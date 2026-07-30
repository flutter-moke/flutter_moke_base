/// Moke RoutePath — 混合端级路由规则
///
/// ## 路由设计
/// 采用类 URL 路径格式，支持 Android Deep Link 与 iOS Universal Link。
///
/// ## 路径规则
/// ```
/// /                   → 首页
/// /article/{id}       → 文章详情
/// /articles           → 文章列表
/// /settings           → 设置页
/// /category/{name}    → 分类页
/// ```
///
/// ## 与 Navigator 2.0 的关系
/// [RoutePath] 是 [RouteInformationParser] 的解析结果类型，
/// 也是 [RouterDelegate] 的状态驱动源。
library;

/// Moke 路由路径模型
///
/// 不可变对象，表示一个路由状态。
class MokeRoutePath {
  const MokeRoutePath({
    this.location = '/',
    this.parameters = const {},
  });

  /// 路径（如 `/article/123`）
  final String location;

  /// 查询参数（如 `?from=home`）
  final Map<String, String> parameters;

  // ── 便捷工厂 ──

  /// 首页
  static const MokeRoutePath home = MokeRoutePath(location: '/');

  /// 文章详情
  factory MokeRoutePath.article(String id) => MokeRoutePath(
        location: '/article/$id',
        parameters: {'id': id},
      );

  /// 文章列表
  static const MokeRoutePath articles = MokeRoutePath(location: '/articles');

  /// 设置
  static const MokeRoutePath settings = MokeRoutePath(location: '/settings');

  /// 分类页
  factory MokeRoutePath.category(String name) => MokeRoutePath(
        location: '/category/$name',
        parameters: {'name': name},
      );

  // ── 路径匹配 ──

  /// 配置化路由匹配
  bool get isHome => location == '/';
  bool get isArticle => location.startsWith('/article/');
  bool get isArticles => location == '/articles';
  bool get isSettings => location == '/settings';

  /// 提取路径参数
  String? get articleId =>
      isArticle ? location.split('/').last : null;

  // ── 序列化 ──

  @override
  String toString() => 'MokeRoutePath($location)';

  @override
  bool operator ==(Object other) =>
      other is MokeRoutePath && location == other.location;

  @override
  int get hashCode => location.hashCode;
}
