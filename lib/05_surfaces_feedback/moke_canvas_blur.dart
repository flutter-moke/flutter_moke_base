/// Moke Canvas Blur — 高级高斯模糊与剪裁表面
///
/// ## 渲染原理
/// 利用 [BackdropFilter] + [ImageFilter.blur] 实现实时高斯模糊。
/// 与静态模糊图片不同，此方案会实时模糊其背后所有的 widget 图层。
///
/// ## 性能说明
/// - 实时模糊是 GPU 密集操作，需控制模糊半径（通常 sigma ≤ 8）
/// - 配合 [ClipRRect] 限制模糊区域，避免全屏模糊
/// - 使用 `RepaintBoundary` 隔离静态内容，减少重绘区域
///
/// ## 使用示例
/// ```dart
/// MokeBlurSurface(
///   sigma: 6,
///   borderRadius: 16,
///   child: Text('模糊背景上的文字'),
/// )
/// ```
library;

import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

/// Moke 模糊表面容器
///
/// 在子组件背后创建实时高斯模糊效果。典型用途：模态背景、卡片毛玻璃效果。
class MokeBlurSurface extends StatelessWidget {
  const MokeBlurSurface({
    super.key,
    required this.child,
    this.sigmaX = 4,
    this.sigmaY,
    this.borderRadius = 0,
    this.overlayColor,
    this.blurEnabled = true,
  });

  /// 子组件
  final Widget child;

  /// 水平模糊强度（推荐 2-10）
  final double sigmaX;

  /// 垂直模糊强度（默认等于 sigmaX）
  final double? sigmaY;

  /// 圆角
  final double borderRadius;

  /// 叠加色（调整模糊层的明暗）
  final Color? overlayColor;

  /// 是否启用模糊（可动态关闭以节省性能）
  final bool blurEnabled;

  @override
  Widget build(BuildContext context) {
    final sigmaY = this.sigmaY ?? sigmaX;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          // 实时模糊层
          if (blurEnabled)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                child: Container(color: Colors.transparent),
              ),
            ),

          // 叠加色
          if (overlayColor != null)
            Positioned.fill(
              child: Container(color: overlayColor),
            ),

          // 前景内容
          child,
        ],
      ),
    );
  }
}

/// 性能诊断：模糊半径警告阈值
const double _kBlurWarningThreshold = 8.0;

/// 检查模糊半径是否在合理范围内
bool isBlurSigmaSafe(double sigma) => sigma <= _kBlurWarningThreshold;
