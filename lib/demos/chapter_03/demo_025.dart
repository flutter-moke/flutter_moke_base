import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo025 extends StatelessWidget {
  const Demo025({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '025',
      title: 'ButtonBar 按钮组',
      description: 'ButtonBar 中的按钮排列演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Default ButtonBar ──
          Text('默认 ButtonBar', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(
            '按钮自动右对齐，水平排列',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          OverflowBar(
            children: [
              TextButton(onPressed: () {}, child: const Text('取消')),
              OutlinedButton(onPressed: () {}, child: const Text('重置')),
              FilledButton(onPressed: () {}, child: const Text('保存')),
            ],
          ),

          const Divider(height: 24),

          // ── Centered OverflowBar ──
          Text('居中对齐 OverflowBar', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(
            'alignment: MainAxisAlignment.center',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          OverflowBar(
            alignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('拒绝')),
              FilledButton(onPressed: () {}, child: const Text('接受')),
            ],
          ),

          const Divider(height: 24),

          // ── Overflow OverflowBar ──
          Text('多按钮溢出 OverflowBar', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(
            '按钮过多时会自动换行',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          OverflowBar(
            spacing: 8,
            overflowSpacing: 8,
            children: [
              TextButton(onPressed: () {}, child: const Text('操作一')),
              TextButton(onPressed: () {}, child: const Text('操作二')),
              OutlinedButton(onPressed: () {}, child: const Text('操作三')),
              FilledButton(onPressed: () {}, child: const Text('操作四')),
              FilledButton.tonal(onPressed: () {}, child: const Text('操作五')),
            ],
          ),

          const SizedBox(height: 12),
          Text(
            'ButtonBar 使用 ButtonTheme 和 Overlay 管理按钮间距',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
