import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo077 extends StatelessWidget {
  const Demo077({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '077',
      title: 'Dialog 自定义弹窗',
      description: 'Dialog 可嵌入任意内容的自定义弹窗。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮弹出完全自定义的对话框内容。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.widgets_outlined, size: 18),
            label: const Text('显示自定义弹窗'),
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.celebration_outlined,
                          size: 48, color: theme.colorScheme.primary),
                      const SizedBox(height: 16),
                      Text('恭喜！',
                          style: theme.textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      const Text('你已经成功创建了自定义弹窗。'),
                      const SizedBox(height: 8),
                      Text('你可以在这里放置任何 Widget。',
                          style: theme.textTheme.bodySmall),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text('关闭'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
