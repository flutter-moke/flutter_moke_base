/// Moke Dialog — 全局非 Context 弹窗管理
///
/// ## 解决的问题
/// Flutter 原生 [showDialog] 需要 [BuildContext]，这在以下场景中不可行：
/// 1. 纯 Dart 层（Bloc、Provider、Service）
/// 2. 全局错误处理（捕获未处理异常时）
/// 3. 推送通知回调中弹出提示
///
/// ## 实现方案
/// 通过 [OverlayEntry] + 全局 [GlobalKey<NavigatorState>] 实现
/// 无需 Context 的弹窗能力。
///
/// ## 使用示例
/// ```dart
/// // 无需 context：
/// MokeDialog.show(title: '提示', message: '操作成功');
///
/// // 确认对话框：
/// final ok = await MokeDialog.confirm(title: '确认删除？');
/// ```
library;

import 'package:flutter/material.dart';

/// Moke 全局弹窗导航键（由 MokeAppEntry 初始化时注入）
final GlobalKey<NavigatorState> mokeNavigatorKey = GlobalKey<NavigatorState>();

/// Moke 全局弹窗管理
class MokeDialog {
  MokeDialog._();

  /// 显示简单提示弹窗
  static Future<void> show({
    required String title,
    String? message,
    String confirmText = '确定',
    VoidCallback? onConfirm,
  }) async {
    final ctx = mokeNavigatorKey.currentContext;
    if (ctx == null) {
      debugPrint('[MokeDialog] Navigator not ready');
      return;
    }

    await showDialog(
      context: ctx,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: message != null ? Text(message) : null,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  /// 显示确认对话框（返回 true/false）
  static Future<bool> confirm({
    required String title,
    String? message,
    String confirmText = '确认',
    String cancelText = '取消',
    Color? confirmColor,
  }) async {
    final ctx = mokeNavigatorKey.currentContext;
    if (ctx == null) {
      debugPrint('[MokeDialog] Navigator not ready');
      return false;
    }

    final result = await showDialog<bool>(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: message != null ? Text(message) : null,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  /// 通过 OverlayEntry 显示自定义弹窗（最灵活）
  static OverlayEntry showOverlay({
    required WidgetBuilder builder,
    bool dismissible = true,
  }) {
    final ctx = mokeNavigatorKey.currentContext;
    if (ctx == null) {
      throw StateError('[MokeDialog] Navigator not ready');
    }

    final overlay = Overlay.of(ctx);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 遮罩层
          if (dismissible)
            GestureDetector(
              onTap: () => entry.remove(),
              child: Container(color: Colors.black.withValues(alpha: 0.4)),
            )
          else
            Container(color: Colors.black.withValues(alpha: 0.4)),
          // 内容层
          Center(child: builder(context)),
        ],
      ),
    );

    overlay.insert(entry);
    return entry;
  }
}
