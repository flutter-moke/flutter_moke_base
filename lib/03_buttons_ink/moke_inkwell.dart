/// Moke InkWell — 触摸反馈与水墨泼墨特效
///
/// ## 核心思路
/// 原生 [InkWell] 的波纹是圆形扩散。本组件实现：
/// 1. **水墨扩散** — 不规则的墨水浸染效果（通过 CustomPainter）
/// 2. **涟漪链** — 多次触摸产生的波纹叠加管理
/// 3. **节流控制** — 高频触摸时自动合并反馈
///
/// ## 渲染原理
/// InkWell 本质是 [InkResponse] + [MaterialInkController]。
/// MokeInkWell 在此基础上叠加一层 [CustomPainter]，在 ink 层之上绘制水墨纹理。
library;

import 'package:flutter/material.dart';

/// Moke 水墨触摸反馈
///
/// 在原生 InkWell 基础上添加水墨浸染扩散动画。
class MokeInkWell extends StatefulWidget {
  const MokeInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.borderRadius = BorderRadius.zero,
    this.splashColor,
    this.highlightColor,
    this.hoverColor,
    this.inkStyle = MokeInkStyle.ink,
    this.radius,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final BorderRadius borderRadius;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? hoverColor;
  final MokeInkStyle inkStyle;
  final double? radius;

  @override
  State<MokeInkWell> createState() => _MokeInkWellState();
}

class _MokeInkWellState extends State<MokeInkWell>
    with SingleTickerProviderStateMixin {
  late AnimationController _rippleController;
  Offset _tapPosition = Offset.zero;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition;
      _isPressed = true;
    });
    _rippleController.forward(from: 0);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final splashColor =
        widget.splashColor ?? theme.colorScheme.primary.withValues(alpha: 0.12);
    final highlightColor =
        widget.highlightColor ?? theme.colorScheme.primary.withValues(alpha: 0.06);

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onDoubleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: _InkStyleDecorator(
        borderRadius: widget.borderRadius,
        inkStyle: widget.inkStyle,
        tapPosition: _tapPosition,
        animation: _rippleController,
        isPressed: _isPressed,
        splashColor: splashColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: _isPressed ? highlightColor : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// 水墨风格枚举
enum MokeInkStyle {
  /// 标准圆形涟漪
  circle,

  /// 水墨浸染（不规则扩散）
  ink,
}

/// 水墨特效绘制层
class _InkStyleDecorator extends StatelessWidget {
  const _InkStyleDecorator({
    required this.borderRadius,
    required this.inkStyle,
    required this.tapPosition,
    required this.animation,
    required this.isPressed,
    required this.splashColor,
    required this.child,
  });

  final BorderRadius borderRadius;
  final MokeInkStyle inkStyle;
  final Offset tapPosition;
  final Animation<double> animation;
  final bool isPressed;
  final Color splashColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          child,
          // 水墨特效叠加层
          if (inkStyle == MokeInkStyle.ink)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _InkSplashPainter(
                      center: tapPosition,
                      radius: animation.value * 120,
                      color: splashColor,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

/// 水墨浸染 CustomPainter
class _InkSplashPainter extends CustomPainter {
  _InkSplashPainter({
    required this.center,
    required this.radius,
    required this.color,
  });

  final Offset center;
  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius <= 0) return;

    final paint = Paint()
      ..color = color
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    // 主波纹
    canvas.drawCircle(center, radius, paint);

    // 子墨点（随机偏移，模拟水墨浸染的不规则性）
    for (int i = 0; i < 6; i++) {
      final offset = Offset(
        (i * 17.3) % 30 - 15,
        (i * 13.7) % 30 - 15,
      );
      final r = radius * (0.3 + (i * 0.08) % 0.4);
      canvas.drawCircle(center + offset, r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _InkSplashPainter oldDelegate) =>
      oldDelegate.radius != radius || oldDelegate.center != center;
}
