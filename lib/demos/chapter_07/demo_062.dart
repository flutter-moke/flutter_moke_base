import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo062 extends StatelessWidget {
  const Demo062({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '062',
      title: 'Icon 图标',
      description: '不同尺寸、颜色、语义标签的 Icon 展示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('不同尺寸：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              Icon(Icons.star, size: 16, color: theme.colorScheme.primary),
              Icon(Icons.star, size: 24, color: theme.colorScheme.primary),
              Icon(Icons.star, size: 32, color: theme.colorScheme.primary),
              Icon(Icons.star, size: 48, color: theme.colorScheme.primary),
              Icon(Icons.star, size: 64, color: theme.colorScheme.primary),
            ],
          ),
          const SizedBox(height: 20),
          Text('不同颜色：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              Icon(Icons.favorite, color: Colors.red, size: 32),
              Icon(Icons.favorite, color: Colors.blue, size: 32),
              Icon(Icons.favorite, color: Colors.green, size: 32),
              Icon(Icons.favorite, color: Colors.orange, size: 32),
              Icon(Icons.favorite, color: Colors.purple, size: 32),
            ],
          ),
          const SizedBox(height: 20),
          Text('语义化示例：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              Semantics(
                label: '设置',
                child: Icon(Icons.settings, size: 32,
                    color: theme.colorScheme.onSurface),
              ),
              Semantics(
                label: '删除',
                child: Icon(Icons.delete, size: 32,
                    color: theme.colorScheme.error),
              ),
              Semantics(
                label: '搜索',
                child: Icon(Icons.search, size: 32,
                    color: theme.colorScheme.primary),
              ),
              Semantics(
                label: '通知',
                child: Icon(Icons.notifications, size: 32,
                    color: theme.colorScheme.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
