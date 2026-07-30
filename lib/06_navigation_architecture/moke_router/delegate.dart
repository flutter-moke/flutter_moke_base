/// Moke RouterDelegate — 数据响应流路由代理
///
/// ## 架构说明
/// 基于 Flutter [RouterDelegate] + [ChangeNotifier] 实现声明式路由：
///
/// ```
/// RouteInformation (浏览器/DeepLink)
///     │
///     ▼
/// RouteInformationParser ──→ MokeRoutePath
///     │
///     ▼
/// RouterDelegate (监听状态变化)
///     │
///     ▼
/// build() → 返回当前路由对应的页面
/// ```
///
/// ## 对比 Navigator 1.0
/// | 维度 | Navigator 1.0 | Navigator 2.0 (本实现) |
/// |------|--------------|----------------------|
/// | 路由声明 | 集中式 routes 表 | 声明式页面栈 |
/// | URL 同步 | 需手动 | 自动双向同步 |
/// | Deep Link | 有限支持 | 原生支持 |
/// | 页面栈控制 | push/pop | 自由操作 `List<Page>` |
library;

import 'package:flutter/material.dart';

import 'route_path.dart';

/// Moke 路由代理
///
/// 使用 [ChangeNotifier] 驱动 [Router] 重建。
/// 需要外部通过 [MokeRouterDelegate.of(context)] 获取实例进行导航。
class MokeRouterDelegate extends RouterDelegate<MokeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MokeRoutePath> {
  MokeRouterDelegate() : _currentPath = MokeRoutePath.home;

  /// 当前路由路径
  MokeRoutePath _currentPath;
  MokeRoutePath get currentPath => _currentPath;

  /// 页面栈（支持多页面场景）
  final List<MokeRoutePath> _pageStack = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // ═════════════════════════════════════════════════════════════
  // 导航方法
  // ═════════════════════════════════════════════════════════════

  /// 导航到新路径
  void navigateTo(MokeRoutePath path) {
    if (path == _currentPath) return;
    _currentPath = path;
    _pageStack.add(path);
    notifyListeners();
  }

  /// 替换当前路径（不增加历史）
  void replaceWith(MokeRoutePath path) {
    _currentPath = path;
    if (_pageStack.isNotEmpty) {
      _pageStack.removeLast();
    }
    _pageStack.add(path);
    notifyListeners();
  }

  /// 返回上一页
  bool pop() {
    if (_pageStack.length <= 1) return false;
    _pageStack.removeLast();
    _currentPath = _pageStack.last;
    notifyListeners();
    return true;
  }

  /// 返回首页
  void popToHome() {
    _currentPath = MokeRoutePath.home;
    _pageStack.clear();
    _pageStack.add(MokeRoutePath.home);
    notifyListeners();
  }

  // ═════════════════════════════════════════════════════════════
  // RouterDelegate 协议实现
  // ═════════════════════════════════════════════════════════════

  @override
  MokeRoutePath get currentConfiguration => _currentPath;

  @override
  Future<void> setNewRoutePath(MokeRoutePath configuration) async {
    _currentPath = configuration;
    _pageStack.add(configuration);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // 首页（始终存在）
        MaterialPage(
          key: const ValueKey('home'),
          child: _buildHome(context),
        ),

        // 根据当前路径添加附加页面
        if (_currentPath.isArticle)
          MaterialPage(
            key: ValueKey('article-${_currentPath.articleId}'),
            child: _buildArticle(context, _currentPath.articleId!),
          ),

        if (_currentPath.isSettings)
          const MaterialPage(
            key: ValueKey('settings'),
            child: _SettingsPage(),
          ),
      ],
      onDidRemovePage: (page) {
        pop();
      },
    );
  }

  // ═════════════════════════════════════════════════════════════
  // 占位页面构建
  // ═════════════════════════════════════════════════════════════

  Widget _buildHome(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moke Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Flutter Moke'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                navigateTo(MokeRoutePath.article('1'));
              },
              child: const Text('Open Article'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                navigateTo(MokeRoutePath.settings);
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticle(BuildContext context, String id) {
    return Scaffold(
      appBar: AppBar(title: Text('Article $id')),
      body: Center(
        child: Text('Article content: $id'),
      ),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Page')),
    );
  }
}
