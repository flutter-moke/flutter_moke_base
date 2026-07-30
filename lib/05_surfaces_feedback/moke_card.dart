/// Moke Card — Card 与离屏渲染优化（Elevation）
///
/// ## 深入原理
/// [Card] 底层使用 [Material] widget 实现 elevation 阴影。
/// 每次 elevation 变化会导致 [PhysicalShape] 图层重绘。
///
/// ## 优化策略
/// 1. **静态 elevation**：预置 4 档阴影高度，避免动态计算
/// 2. **离屏渲染**：对静态卡片使用 [RepaintBoundary] 隔离
/// 3. **圆角裁剪**：[ClipRRect] 替代 shape 中的 borderRadius
///    以减少 Material 层的绘制复杂度
///
/// ## 阴影档位
/// - `flat` — 0.0 （纯平，无阴影）
/// - `raised` — 1.0 （轻微浮起，默认）
/// - `elevated` — 3.0 （明显浮起，如弹窗卡片）
/// - `prominent` — 6.0 （突出，如 FAB 卡片）
library;

import 'package:flutter/material.dart';

/// Moke 卡片高度枚举
enum MokeCardElevation {
  flat(0),
  raised(1),
  elevated(3),
  prominent(6);

  const MokeCardElevation(this.value);
  final double value;
}

/// Moke 高性能卡片
class MokeCard extends StatelessWidget {
  const MokeCard({
    super.key,
    required this.child,
    this.elevation = MokeCardElevation.raised,
    this.padding,
    this.margin,
    this.borderRadius = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.useRepaintBoundary = true,
    this.onTap,
    this.onLongPress,
  });

  final Widget child;
  final MokeCardElevation elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final bool useRepaintBoundary;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ?? theme.colorScheme.surface;

    final card = Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!)
            : null,
        boxShadow: _buildShadow(theme),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: _buildContent(theme),
      ),
    );

    // 静态卡片用 RepaintBoundary 隔离
    if (useRepaintBoundary && elevation == MokeCardElevation.flat) {
      return RepaintBoundary(child: card);
    }
    return card;
  }

  Widget _buildContent(ThemeData theme) {
    final content = Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: DefaultTextStyle(
        style:
            theme.textTheme.bodyMedium?.copyWith(color: foregroundColor) ??
                theme.textTheme.bodyMedium!,
        child: child,
      ),
    );

    if (onTap != null || onLongPress != null) {
      return InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(borderRadius),
        child: content,
      );
    }

    return content;
  }

  /// 手动构建阴影，避免 [Material] 层的额外开销
  List<BoxShadow> _buildShadow(ThemeData theme) {
    final e = elevation.value;
    if (e <= 0) return [];

    return [
      BoxShadow(
        color: theme.shadowColor.withValues(alpha: (0.04 + e * 0.02).clamp(0, 0.2)),
        blurRadius: e * 4,
        offset: Offset(0, e * 1.5),
      ),
    ];
  }
}
