import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo089 extends StatelessWidget {
  const Demo089({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '089',
      title: 'SingleChildScrollView 单子滚动',
      description: '内容超出屏幕时，使用 SingleChildScrollView 滚动。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  20,
                  (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: theme.colorScheme.outlineVariant),
                      ),
                      child: Center(
                        child: Text('第 ${i + 1} 项 — 滚动查看',
                            style: theme.textTheme.bodyMedium),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 内存占用对比',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      Text('SingleChildScrollView',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                              color: theme.colorScheme.error)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: List.generate(5, (i) => Container(
                            height: 12,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.error.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('全部构建（高内存）',
                          style: TextStyle(fontSize: 10, color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      Text('ListView.builder',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            // 3 visible blocks
                            ...List.generate(3, (i) => Container(
                              height: 12,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            )),
                            // dashed outlines for off-screen
                            ...List.generate(3, (i) => Container(
                              height: 12,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('按需构建（低内存）',
                          style: TextStyle(fontSize: 10, color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
