import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo024 extends StatelessWidget {
  const Demo024({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '024',
      title: 'Divider 分割线',
      description: '多种分割线样式演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Default Divider ──
          _sectionLabel('默认 Divider'),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 4),
          Text('height: 默认, thickness: 默认, indent: 0',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const SizedBox(height: 16),

          // ── Indented Divider ──
          _sectionLabel('Divider with indent 20'),
          const SizedBox(height: 4),
          const Divider(indent: 20),
          const SizedBox(height: 4),
          Text('左侧缩进 20px',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const SizedBox(height: 16),

          // ── End indented Divider ──
          _sectionLabel('Divider with endIndent 20'),
          const SizedBox(height: 4),
          const Divider(endIndent: 20),
          const SizedBox(height: 4),
          Text('右侧缩进 20px',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const SizedBox(height: 16),

          // ── Thick Divider ──
          _sectionLabel('Divider with thickness 3'),
          const SizedBox(height: 4),
          const Divider(thickness: 3),
          const SizedBox(height: 4),
          Text('厚度为 3px 的粗分割线',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const SizedBox(height: 16),

          // ── Custom Color Divider ──
          _sectionLabel('Divider with custom color'),
          const SizedBox(height: 4),
          Divider(color: Colors.red.shade300, thickness: 2),
          const SizedBox(height: 4),
          Text('自定义颜色为红色',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const SizedBox(height: 16),

          // ── Vertical Divider ──
          _sectionLabel('VerticalDivider（垂直分割线）'),
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue.shade50,
                    alignment: Alignment.center,
                    child: const Text('左侧'),
                  ),
                ),
                const VerticalDivider(width: 20, thickness: 1),
                Expanded(
                  child: Container(
                    color: Colors.green.shade50,
                    alignment: Alignment.center,
                    child: const Text('右侧'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text('VerticalDivider 用于垂直分隔左右两侧内容',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const SizedBox(height: 16),

          // ── Combined ──
          _sectionLabel('组合使用：indent + endIndent + thickness + color'),
          const SizedBox(height: 4),
          Divider(
            indent: 16,
            endIndent: 16,
            thickness: 2,
            color: Colors.amber.shade400,
          ),
          const SizedBox(height: 4),
          Text('同时设置缩进、厚度和颜色',
              style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
  }
}
