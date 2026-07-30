import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo064 extends StatefulWidget {
  const Demo064({super.key});

  @override
  State<Demo064> createState() => _Demo064State();
}

class _Demo064State extends State<Demo064> {
  String _lastAction = '尚未点击';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '064',
      title: 'ActionChip 动作标签',
      description: '点击 ActionChip 触发回调，类似按钮。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              ActionChip(
                avatar: const Icon(Icons.favorite_border),
                label: const Text('收藏'),
                onPressed: () {
                  setState(() => _lastAction = '点击了「收藏」');
                },
              ),
              ActionChip(
                avatar: const Icon(Icons.share),
                label: const Text('分享'),
                onPressed: () {
                  setState(() => _lastAction = '点击了「分享」');
                },
              ),
              ActionChip(
                avatar: const Icon(Icons.download),
                label: const Text('下载'),
                onPressed: () {
                  setState(() => _lastAction = '点击了「下载」');
                },
              ),
              ActionChip(
                avatar: const Icon(Icons.delete_outline),
                label: const Text('删除'),
                onPressed: () {
                  setState(() => _lastAction = '点击了「删除」');
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline,
                    size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text('上次操作：$_lastAction',
                    style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
