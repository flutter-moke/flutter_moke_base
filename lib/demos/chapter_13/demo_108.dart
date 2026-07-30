import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo108 extends StatelessWidget {
  const Demo108({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '108',
      title: 'BoxDecoration 盒子装饰',
      description:
          '使用 Container 与 BoxDecoration 展示颜色、圆角、边框、渐变和阴影的组合效果。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('基础组合', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // 纯色 + 圆角
              _buildBox(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('圆角'),
              ),
              // 边框 + 圆角
              _buildBox(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Text('边框', style: TextStyle(color: theme.colorScheme.primary)),
              ),
              // 渐变
              _buildBox(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  ),
                ),
                child: const Text('渐变', style: TextStyle(color: Colors.white)),
              ),
              // 阴影
              _buildBox(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.shadow.withAlpha(60),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text('阴影', style: TextStyle(color: theme.colorScheme.onSurface)),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text('综合示例', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          // 综合所有特性
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.outlineVariant,
                width: 1,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.surface,
                  theme.colorScheme.primaryContainer,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withAlpha(30),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              '颜色 + 圆角 + 边框 + 渐变 + 阴影',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox({
    required double height,
    required double width,
    required BoxDecoration decoration,
    required Widget child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        child: child,
      ),
    );
  }
}
