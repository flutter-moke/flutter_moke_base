/// Moke SnackBar — 全局通知组件
///
/// ## 对比原生
/// - 原生 SnackBar 依赖于 [ScaffoldMessenger]，且只对当前 Scaffold 生效
/// - MokeSnackBar 通过 [OverlayEntry] 实现全局覆盖，无需 Scaffold 上下文
///
/// ## 使用场景
/// 1. 全局操作反馈（保存成功、网络错误）
/// 2. 无需用户交互的轻提示
library;

import 'package:flutter/material.dart';

import 'dialog.dart';

/// Moke 全局 SnackBar 管理
class MokeSnackBar {
  MokeSnackBar._();

  /// 显示成功通知
  static void success(String message, {Duration duration = const Duration(seconds: 2)}) {
    _show(message, MokeSnackBarType.success, duration);
  }

  /// 显示错误通知
  static void error(String message, {Duration duration = const Duration(seconds: 3)}) {
    _show(message, MokeSnackBarType.error, duration);
  }

  /// 显示警告通知
  static void warning(String message, {Duration duration = const Duration(seconds: 3)}) {
    _show(message, MokeSnackBarType.warning, duration);
  }

  /// 显示信息通知
  static void info(String message, {Duration duration = const Duration(seconds: 2)}) {
    _show(message, MokeSnackBarType.info, duration);
  }

  static void _show(String message, MokeSnackBarType type, Duration duration) {
    final ctx = mokeNavigatorKey.currentContext;
    if (ctx == null) return;

    final messenger = ScaffoldMessenger.maybeOf(ctx);
    if (messenger != null) {
      messenger.showSnackBar(_buildSnackBar(message, type, duration));
    } else {
      _showViaOverlay(message, type, duration);
    }
  }

  static SnackBar _buildSnackBar(
    String message,
    MokeSnackBarType type,
    Duration duration,
  ) {
    final cfg = _typeConfig(type);

    return SnackBar(
      content: Row(
        children: [
          Icon(cfg.icon, color: cfg.fg, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: cfg.bg,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
    );
  }

  /// Overlay fallback
  static void _showViaOverlay(
    String message,
    MokeSnackBarType type,
    Duration duration,
  ) {
    final entry = MokeDialog.showOverlay(
      builder: (context) {
        final cfg = _typeConfig(type);
        return Positioned(
          bottom: 24,
          left: 16,
          right: 16,
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(8),
            color: cfg.bg,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(cfg.icon, color: cfg.fg, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(message, style: TextStyle(color: cfg.fg)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      dismissible: false,
    );

    Future.delayed(duration, entry.remove);
  }

  static _SnackBarConfig _typeConfig(MokeSnackBarType type) {
    return switch (type) {
      MokeSnackBarType.success => _SnackBarConfig(
        bg: const Color(0xFF2E7D32),
        fg: Colors.white,
        icon: Icons.check_circle,
      ),
      MokeSnackBarType.error => _SnackBarConfig(
        bg: const Color(0xFFB3261E),
        fg: Colors.white,
        icon: Icons.error,
      ),
      MokeSnackBarType.warning => _SnackBarConfig(
        bg: const Color(0xFFE65100),
        fg: Colors.white,
        icon: Icons.warning,
      ),
      MokeSnackBarType.info => _SnackBarConfig(
        bg: const Color(0xFF3B6B8A),
        fg: Colors.white,
        icon: Icons.info,
      ),
    };
  }
}

/// 类型配置数据类
class _SnackBarConfig {
  const _SnackBarConfig({
    required this.bg,
    required this.fg,
    required this.icon,
  });

  final Color bg;
  final Color fg;
  final IconData icon;
}

enum MokeSnackBarType { success, error, warning, info }
