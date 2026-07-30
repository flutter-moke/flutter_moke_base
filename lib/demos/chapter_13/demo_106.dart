import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo106 extends StatelessWidget {
  const Demo106({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '106',
      title: 'Ink 墨迹绘制',
      description: '使用 Ink 组件在 Material 上绘制装饰与背景。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 纯色墨迹
          Text('Ink with decoration', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Material(
            borderRadius: BorderRadius.circular(16),
            child: Ink(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  'Ink with gradient decoration',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Ink + InkWell 组合
          Text('Ink with InkWell', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Material(
            borderRadius: BorderRadius.circular(12),
            child: Ink(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ink tapped!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Center(
                  child: Text('点击查看水波纹与背景叠加效果'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            'Ink 组件作为 Material 的装饰子组件，可同时拥有背景装饰与 InkWell 水波纹效果。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
