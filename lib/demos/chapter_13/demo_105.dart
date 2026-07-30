import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo105 extends StatelessWidget {
  const Demo105({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '105',
      title: 'InkWell 与 InkResponse',
      description:
          '在 Material 组件上展示 InkWell 的水波纹效果与点击反馈。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // InkWell 示例
          Text('InkWell', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Material(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('InkWell tapped!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.touch_app,
                        color: theme.colorScheme.primary, size: 24),
                    const SizedBox(width: 8),
                    Text('点击此处查看水波纹',
                        style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // InkResponse 示例
          Text('InkResponse', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Material(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(16),
            child: InkResponse(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('InkResponse tapped!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.water_drop,
                        color: theme.colorScheme.onSecondaryContainer,
                        size: 24),
                    const SizedBox(width: 8),
                    Text('InkResponse 也支持水波纹',
                        style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            'InkWell 与 InkResponse 都需要包裹在 Material 组件中才能显示水波纹效果。'
            '点击上方区域查看反馈。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
