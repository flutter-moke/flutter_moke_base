/// Moke Scaffold — Scaffold 嵌套布局控制中心
///
/// ## 解决的问题
/// 在 Flutter 中多层 [Scaffold] 嵌套会导致 SnackBar、FAB、BottomSheet 等组件
/// 定位异常。本组件通过单层 Scaffold + 插槽体系解决此问题。
///
/// ## 插槽体系
/// - `header` — 自定义头部（替代 AppBar）
/// - `body` — 正文区域
/// - `footer` — 底部导航 / 工具栏
/// - `fab` — 浮动按钮
/// - `drawer` / `endDrawer` — 抽屉
///
/// ## 使用示例
/// ```dart
/// MokeScaffold(
///   header: MokeSliverAppBar(title: '首页'),
///   body: ListView(...),
///   footer: BottomNavigationBar(...),
/// )
/// ```
library;

import 'package:flutter/material.dart';

/// Moke 布局插槽容器
class MokeScaffold extends StatefulWidget {
  const MokeScaffold({
    super.key,
    this.header,
    required this.body,
    this.footer,
    this.fab,
    this.fabLocation,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.padding,
  });

  /// 头部组件（AppBar / SliverAppBar / 自定义）
  final PreferredSizeWidget? header;

  /// 正文区域
  final Widget body;

  /// 底部组件（BottomNavigationBar / 工具栏）
  final Widget? footer;

  /// 浮动操作按钮
  final Widget? fab;

  /// FAB 位置
  final FloatingActionButtonLocation? fabLocation;

  /// 左侧抽屉
  final Widget? drawer;

  /// 右侧抽屉
  final Widget? endDrawer;

  /// 背景色
  final Color? backgroundColor;

  /// 是否自动调整底部 inset（键盘弹出时）
  final bool resizeToAvoidBottomInset;

  /// 内边距
  final EdgeInsets? padding;

  @override
  State<MokeScaffold> createState() => _MokeScaffoldState();
}

class _MokeScaffoldState extends State<MokeScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 编程式打开抽屉
  void openDrawer() => _scaffoldKey.currentState?.openDrawer();
  void openEndDrawer() => _scaffoldKey.currentState?.openEndDrawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,

      // ── AppBar 或自定义头部 ──
      appBar: widget.header,

      // ── 正文（支持 padding） ──
      body: widget.padding != null
          ? Padding(
              padding: widget.padding!,
              child: widget.body,
            )
          : widget.body,

      // ── 底部 ──
      bottomNavigationBar: widget.footer,

      // ── FAB ──
      floatingActionButton: widget.fab,
      floatingActionButtonLocation: widget.fabLocation,

      // ── 抽屉 ──
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 便捷工厂方法
// ═══════════════════════════════════════════════════════════════

/// MokeScaffold 便捷构造扩展
extension MokeScaffoldFactory on MokeScaffold {
  /// 创建一个带有标准列表页面的 Scaffold
  static MokeScaffold listPage({
    required PreferredSizeWidget header,
    required Widget Function(BuildContext, int) itemBuilder,
    int itemCount = 0,
    Widget? footer,
    EdgeInsets? padding,
  }) {
    return MokeScaffold(
      header: header,
      body: ListView.builder(
        itemCount: itemCount,
        padding: padding ?? EdgeInsets.zero,
        itemBuilder: itemBuilder,
      ),
      footer: footer,
    );
  }
}
