import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo118 extends StatelessWidget {
  const Demo118({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '118',
      title: 'Hero 共享元素过渡',
      description: '带有 Hero tag 的两个容器，在页面跳转时会产生共享元素动画',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '两个页面的容器使用相同的 Hero tag（如 "hero_demo"），导航时自动过渡。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          // 当前页面的 Hero
          Center(
            child: Hero(
              tag: 'hero_demo',
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.flight_takeoff,
                  size: 56,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            '跳转后页面（预览）：',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          // 目标页面的 Hero 预览
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Column(
              children: [
                Text(
                  '目标页面',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Hero(
                  tag: 'hero_demo',
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.flight_land,
                      size: 72,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '相同的 Hero tag，不同的大小/位置/形状',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '使用 Navigator.push 跳转时，Hero 会自动补间过渡。\n两个页面的 Hero widget 必须有相同的 tag。',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
