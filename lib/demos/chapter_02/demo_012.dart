import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo012 extends StatelessWidget {
  const Demo012({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '012',
      title: 'ScaffoldMessenger 全局通知',
      description: '不同类型的 SnackBar 通知演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮显示对应类型的 SnackBar：',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 16),

          // ── 成功按钮 ──
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showSnackBar(
                context,
                message: '操作已成功完成！',
                icon: Icons.check_circle,
                color: Colors.green,
              ),
              icon: const Icon(Icons.check_circle),
              label: const Text('成功'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ── 警告按钮 ──
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showSnackBar(
                context,
                message: '请注意，此操作不可撤销！',
                icon: Icons.warning_amber_rounded,
                color: Colors.orange,
              ),
              icon: const Icon(Icons.warning_amber_rounded),
              label: const Text('警告'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ── 错误按钮 ──
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showSnackBar(
                context,
                message: '操作失败，请重试！',
                icon: Icons.error_outline,
                color: Colors.red,
              ),
              icon: const Icon(Icons.error_outline),
              label: const Text('错误'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const SizedBox(height: 24),
          Text('SnackBar 类型说明：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Text(
            '• 成功 — 绿色背景，表示操作已成功完成',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            '• 警告 — 橙色背景，提示需要关注的注意事项',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            '• 错误 — 红色背景，表示操作出现问题',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  void _showSnackBar(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
