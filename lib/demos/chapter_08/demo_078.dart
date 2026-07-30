import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo078 extends StatelessWidget {
  const Demo078({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '078',
      title: 'BottomSheet 底部面板',
      description: '点击按钮弹出模态底部面板。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮显示模态底部面板。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                icon: const Icon(Icons.vertical_align_bottom, size: 18),
                label: const Text('显示 BottomSheet'),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (ctx) => SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const ListTile(
                            leading: Icon(Icons.share),
                            title: Text('分享'),
                          ),
                          const ListTile(
                            leading: Icon(Icons.link),
                            title: Text('复制链接'),
                          ),
                          const ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('编辑'),
                          ),
                          const ListTile(
                            leading: Icon(Icons.delete, color: Colors.red),
                            title: Text('删除',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
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
