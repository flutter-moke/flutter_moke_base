import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo079 extends StatelessWidget {
  const Demo079({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '079',
      title: 'SnackBar 消息条',
      description: '点击按钮触发底部 SnackBar 消息提示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮显示临时消息条。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Builder(
            builder: (ctx) => Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.info_outline, size: 18),
                  label: const Text('普通消息'),
                  onPressed: () {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      const SnackBar(content: Text('这是一条普通消息。')),
                    );
                  },
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.undo, size: 18),
                  label: const Text('带操作'),
                  onPressed: () {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(
                        content: const Text('项目已删除。'),
                        action: SnackBarAction(
                          label: '撤销',
                          onPressed: () {
                            ScaffoldMessenger.of(ctx).showSnackBar(
                              const SnackBar(content: Text('已撤销删除。')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                TextButton.icon(
                  icon: const Icon(Icons.timer_outlined, size: 18),
                  label: const Text('长显示'),
                  onPressed: () {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(
                        content: const Text('这条消息会显示更长时间。'),
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('SnackBar 显示在屏幕底部，自动消失。',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
