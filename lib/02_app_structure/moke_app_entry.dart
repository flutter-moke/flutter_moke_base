/// Moke App Entry — MaterialApp 入口与多语言初始化
///
/// ## 架构职责
/// 1. 组装 [MaterialApp] 配置（主题、路由、本地化）
/// 2. 注入全局拦截器与生命周期监听
/// 3. 多语言初始化及方向适配
///
/// ## 与 moke_theme 的关系
/// - 消费 [MokeTheme.light] / [MokeTheme.dark] 作为主题
/// - 不直接依赖 moke_theme 的具体实现，仅依赖 [ThemeData] 抽象
library;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../01_theme_tokens/moke_theme.dart';

/// Moke 应用入口组件
///
/// 所有 App 级配置均在此收敛，子页面无需关心主题切换或本地化逻辑。
///
/// 使用示例：
/// ```dart
/// void main() => runApp(MokeAppEntry(app: MyApp()));
/// ```
class MokeAppEntry extends StatefulWidget {
  const MokeAppEntry({
    super.key,
    required this.app,
    this.locale,
    this.supportedLocales = const [Locale('zh', 'CN'), Locale('en', 'US')],
    this.localizationsDelegates = const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    this.onThemeChanged,
  });

  /// 根页面组件
  final Widget app;

  /// 初始语言
  final Locale? locale;

  /// 支持的语言列表
  final List<Locale> supportedLocales;

  /// 本地化代理
  final Iterable<LocalizationsDelegate>? localizationsDelegates;

  /// 主题切换回调
  final ValueChanged<ThemeMode>? onThemeChanged;

  @override
  State<MokeAppEntry> createState() => _MokeAppEntryState();
}

class _MokeAppEntryState extends State<MokeAppEntry> {
  ThemeMode _themeMode = ThemeMode.system;

  void _handleThemeChanged(ThemeMode mode) {
    setState(() => _themeMode = mode);
    widget.onThemeChanged?.call(mode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Moke',
      debugShowCheckedModeBanner: false,

      // ── 主题 ──
      theme: MokeTheme.light,
      darkTheme: MokeTheme.dark,
      themeMode: _themeMode,

      // ── 本地化 ──
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
      localizationsDelegates: widget.localizationsDelegates,
      localeResolutionCallback: _resolveLocale,

      // ── 根路由 ──
      home: _Root(
        app: widget.app,
        onThemeChanged: _handleThemeChanged,
      ),

      // ── 全局导航观察者 ──
      navigatorObservers: [
        _RouteLogger(),
      ],
    );
  }

  /// 语言解析回调：中文优先
  Locale? _resolveLocale(Locale? locale, Iterable<Locale> supported) {
    if (locale == null) return supported.first;
    for (final supportedLocale in supported) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    return supported.first;
  }
}

// ═══════════════════════════════════════════════════════════════
// 内部包裹组件 — 提供主题切换能力至子树
// ═══════════════════════════════════════════════════════════════

class _Root extends StatelessWidget {
  const _Root({required this.app, required this.onThemeChanged});

  final Widget app;
  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    // 通过 InheritedWidget 下推主题切换能力
    return _MokeAppInherited(
      onThemeChanged: onThemeChanged,
      child: app,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// InheritedWidget — 全局上下文访问
// ═══════════════════════════════════════════════════════════════

class _MokeAppInherited extends InheritedWidget {
  const _MokeAppInherited({
    required this.onThemeChanged,
    required super.child,
  });

  final ValueChanged<ThemeMode> onThemeChanged;

  static _MokeAppInherited? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_MokeAppInherited>();

  @override
  bool updateShouldNotify(covariant _MokeAppInherited oldWidget) =>
      onThemeChanged != oldWidget.onThemeChanged;
}

// ═══════════════════════════════════════════════════════════════
// 便利扩展
// ═══════════════════════════════════════════════════════════════

/// 主题切换便捷方法
extension MokeThemeModeContext on BuildContext {
  void toggleThemeMode() {
    _MokeAppInherited.of(this)?.onThemeChanged(
      Theme.of(this).brightness == Brightness.light
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 导航日志观察者
// ═══════════════════════════════════════════════════════════════

class _RouteLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('[MokeRoute] push: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('[MokeRoute] pop: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('[MokeRoute] replace: ${newRoute?.settings.name}');
  }
}
