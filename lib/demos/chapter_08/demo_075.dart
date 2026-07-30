import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo075 extends StatelessWidget {
  const Demo075({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '075',
      title: 'AlertDialog 警告弹窗',
      description: '点击按钮弹出确认/警告对话框。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击下方按钮显示不同风格的 AlertDialog。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                icon: const Icon(Icons.warning_amber, size: 18),
                label: const Text('警告对话框'),
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('确认删除？'),
                    content: const Text('此操作不可撤销。'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('取消'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('删除'),
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.info_outline, size: 18),
                label: const Text('信息对话框'),
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('操作成功'),
                    content: const Text('您的设置已保存。'),
                    actions: [
                      FilledButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
