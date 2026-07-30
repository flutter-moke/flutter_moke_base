/// Moke RouteInformationParser — 路由信息解析器
///
/// ## 职责
/// 将 [RouteInformation]（通常来自浏览器 URL 或 Deep Link）解析为
/// 应用内路由状态 [MokeRoutePath]，以及反向序列化。
///
/// ## 解析流程
/// ```
/// RouteInformation (uri) ──→ 字符串路径 ──→ 路径分段校验 ──→ MokeRoutePath
/// RouteInformation (state) ←── 字符串路径 ←── 序列化 ←── MokeRoutePath
/// ```
///
/// ## 异常安全
/// - 非法的 URI 不会导致崩溃，而是 fallback 到首页（`/`）
/// - 未知路径按普通路径处理，不会抛出 FormatException
library;

import 'package:flutter/material.dart';

import 'route_path.dart';

/// Moke 路由信息解析器
class MokeRouteParser extends RouteInformationParser<MokeRoutePath> {
  @override
  Future<MokeRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;

    // 从 URI 路径解析
    final path = uri.path;
    final params = uri.queryParameters;

    try {
      return _parsePath(path, params);
    } catch (_) {
      // 异常 fallback 到首页
      return MokeRoutePath.home;
    }
  }

  @override
  RouteInformation restoreRouteInformation(MokeRoutePath configuration) {
    // 构建 URI
    final uri = Uri.parse(configuration.location);
    return RouteInformation(uri: uri);
  }

  /// 路径解析核心逻辑
  MokeRoutePath _parsePath(String path, Map<String, String> params) {
    // 移除末尾斜杠
    final normalized = path.endsWith('/') && path.length > 1
        ? path.substring(0, path.length - 1)
        : path;

    final segments = normalized.split('/').where((s) => s.isNotEmpty).toList();

    if (segments.isEmpty) return MokeRoutePath.home;

    return switch (segments[0]) {
      'article' => _parseArticle(segments),
      'articles' => MokeRoutePath.articles,
      'settings' => MokeRoutePath.settings,
      'category' => _parseCategory(segments, params),
      _ => MokeRoutePath(location: normalized, parameters: params),
    };
  }

  MokeRoutePath _parseArticle(List<String> segments) {
    if (segments.length < 2) return MokeRoutePath.home;
    return MokeRoutePath.article(segments[1]);
  }

  MokeRoutePath _parseCategory(
    List<String> segments,
    Map<String, String> params,
  ) {
    if (segments.length < 2) return MokeRoutePath.home;
    return MokeRoutePath.category(segments[1]);
  }
}
