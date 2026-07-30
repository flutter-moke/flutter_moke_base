/// Moke SliverAppBar — 沉浸式吸顶折叠 AppBar
///
/// ## 设计要点
/// 1. 基于 [SliverAppBar] 实现大面积头部折叠效果
/// 2. 支持 `expandedHeight` 动态计算、title 淡入淡出、背景模糊
/// 3. 完全兼容 [MokeScaffold] 的插槽体系
///
/// ## 对比原生 SliverAppBar
/// | 特性 | 原生 | Moke |
/// |------|------|------|
/// | 背景模糊 | 无 | 内置 BackdropFilter |
/// | title 动画 | 简单缩放 | 自定义渐变 + 位移 |
/// | 滚动监听 | 需手动 | 内置 ScrollController 桥接 |
///
/// ## 使用示例
/// ```dart
/// CustomScrollView(
///   slivers: [
///     MokeSliverAppBar(
///       title: '深度文章',
///       expandedHeight: 200,
///       flexibleSpace: Image.network('...', fit: BoxFit.cover),
///     ),
///     SliverList(...),
///   ],
/// )
/// ```
library;

import 'dart:math';
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class MokeSliverAppBar extends StatefulWidget {
  const MokeSliverAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.expandedHeight,
    this.flexibleSpace,
    this.backgroundImage,
    this.backgroundGradient,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.backgroundColor,
    this.foregroundColor,
    this.blurSigma = 4.0,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.stretch = false,
    this.bottom,
    this.collapsedHeight,
    this.onScrollUpdate,
  });

  /// 标题
  final Widget? title;

  /// 标题样式
  final TextStyle? titleStyle;

  /// 展开高度（默认 160）
  final double? expandedHeight;

  /// 展开区域背景（图片、渐变等）
  final Widget? flexibleSpace;

  /// 背景图（flexibleSpace 的快捷方式）
  final ImageProvider? backgroundImage;

  /// 背景渐变（叠加在图片之上）
  final Gradient? backgroundGradient;

  /// 动作按钮
  final List<Widget>? actions;

  /// 返回按钮
  final Widget? leading;

  /// leading 宽度
  final double? leadingWidth;

  /// 背景色
  final Color? backgroundColor;

  /// 前景色
  final Color? foregroundColor;

  /// 高斯模糊半径
  final double blurSigma;

  /// 是否吸顶
  final bool pinned;

  /// 随滚出
  final bool floating;

  /// snap（需 floating true）
  final bool snap;

  /// 弹性拉伸
  final bool stretch;

  /// 底部组件（TabBar 等）
  final PreferredSizeWidget? bottom;

  /// 折叠后高度
  final double? collapsedHeight;

  /// 滚动偏移回调
  final ValueChanged<double>? onScrollUpdate;

  @override
  State<MokeSliverAppBar> createState() => _MokeSliverAppBarState();
}

class _MokeSliverAppBarState extends State<MokeSliverAppBar> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if (offset != _scrollOffset) {
      setState(() => _scrollOffset = offset);
      widget.onScrollUpdate?.call(offset);
    }
  }

  double get _effectiveExpandedHeight =>
      widget.expandedHeight ?? 160.0;

  /// 计算 title 透明度：折叠过程中从 0 → 1
  double get _titleOpacity {
    final collapseDistance = _effectiveExpandedHeight - kToolbarHeight;
    if (collapseDistance <= 0) return 1.0;
    return min(1.0, _scrollOffset / collapseDistance);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = widget.backgroundColor ?? theme.colorScheme.surface;
    final fg = widget.foregroundColor ?? theme.colorScheme.onSurface;

    return SliverAppBar(
      expandedHeight: _effectiveExpandedHeight,
      pinned: widget.pinned,
      floating: widget.floating,
      snap: widget.snap,
      stretch: widget.stretch,
      leading: widget.leading,
      leadingWidth: widget.leadingWidth,
      actions: widget.actions,
      backgroundColor: bg,
      foregroundColor: fg,
      collapsedHeight: widget.collapsedHeight,
      bottom: widget.bottom,

      // ── 标题（带淡入淡出） ──
      title: widget.title != null
          ? Opacity(
              opacity: _titleOpacity,
              child: DefaultTextStyle(
                style: widget.titleStyle ??
                    theme.textTheme.titleLarge?.copyWith(color: fg) ??
                    const TextStyle(),
                child: widget.title!,
              ),
            )
          : null,

      // ── 展开区域 ──
      flexibleSpace: FlexibleSpaceBar(
        background: _buildFlexibleBackground(bg),
      ),
    );
  }

  /// 构建展开背景（高斯模糊 + 渐变叠加）
  Widget _buildFlexibleBackground(Color fallbackColor) {
    // 1. 用户自定义 flexibleSpace
    if (widget.flexibleSpace != null) return widget.flexibleSpace!;

    // 2. 背景图
    if (widget.backgroundImage != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: widget.backgroundImage!,
            fit: BoxFit.cover,
          ),
          // 高斯模糊叠加层
          Positioned.fill(
            child: ClipRRect(
              child: BackdropFilter(
                filter: _buildBlur(),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          // 渐变遮罩
          if (widget.backgroundGradient != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(gradient: widget.backgroundGradient),
              ),
            ),
        ],
      );
    }

    // 3. 纯色背景
    return Container(color: fallbackColor);
  }

  ImageFilter _buildBlur() {
    return ImageFilter.blur(
      sigmaX: widget.blurSigma * _blurIntensity,
      sigmaY: widget.blurSigma * _blurIntensity,
    );
  }

  /// 模糊强度：展开时最强（1.0），折叠后消失（0.0）
  double get _blurIntensity {
    final collapseDistance = _effectiveExpandedHeight - kToolbarHeight;
    if (collapseDistance <= 0) return 0;
    return max(0.0, 1.0 - _scrollOffset / collapseDistance);
  }
}
