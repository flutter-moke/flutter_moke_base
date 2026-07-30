import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo126 extends StatefulWidget {
  const Demo126({super.key});
  @override
  State<Demo126> createState() => _Demo126State();
}

class _Demo126State extends State<Demo126> {
  Color _seedColor = Colors.blue;

  static const List<Color> _seedColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.amber,
    Colors.deepOrange,
    Colors.cyan,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = ColorScheme.fromSeed(seedColor: _seedColor);

    return DemoFrame(
      articleId: '126',
      title: 'Material 3 主题定制',
      description: '选择种子色预览 ColorScheme 调色板',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ColorScheme.fromSeed(seedColor: ...) 生成的调色板',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          // 种子色选择
          Text(
            '选择种子色：',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _seedColors.map((c) {
              final isSelected = _seedColor.toARGB32() == c.toARGB32();
              return GestureDetector(
                onTap: () => setState(() => _seedColor = c),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isSelected ? 40 : 32,
                  height: isSelected ? 40 : 32,
                  decoration: BoxDecoration(
                    color: c,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: theme.colorScheme.onSurface, width: 2.5)
                        : null,
                    boxShadow: isSelected
                        ? [BoxShadow(color: c.withValues(alpha: 0.5), blurRadius: 8)]
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          // 调色板预览
          Text(
            '生成的 ColorScheme：',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _ColorSwatchRow(label: 'primary', color: colorScheme.primary, theme: theme),
          _ColorSwatchRow(label: 'onPrimary', color: colorScheme.onPrimary, theme: theme),
          _ColorSwatchRow(label: 'primaryContainer', color: colorScheme.primaryContainer, theme: theme),
          _ColorSwatchRow(label: 'secondary', color: colorScheme.secondary, theme: theme),
          _ColorSwatchRow(label: 'tertiary', color: colorScheme.tertiary, theme: theme),
          _ColorSwatchRow(label: 'error', color: colorScheme.error, theme: theme),
          _ColorSwatchRow(label: 'surface', color: colorScheme.surface, theme: theme),
          _ColorSwatchRow(label: 'surfaceContainer', color: colorScheme.surfaceContainerLow, theme: theme),
          const SizedBox(height: 16),
          // 预览卡片
          Card(
            color: colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.palette, color: colorScheme.onPrimaryContainer),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '主题预览卡片',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        Text(
                          '使用 primaryContainer 背景 + onPrimaryContainer 文字',
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                    onPressed: () {},
                    child: const Text('按钮'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ M3 主题管道',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _PipeItem(label: 'seed\nColor', color: _seedColor, theme: theme),
                      Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _PipeItem(label: 'fromSeed\n()', color: theme.colorScheme.primary, theme: theme),
                      Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _PipeItem(label: 'Color\nScheme', color: theme.colorScheme.secondary, theme: theme),
                      Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _PipeItem(label: 'Theme\nData', color: theme.colorScheme.tertiary, theme: theme),
                      Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _PipeItem(label: 'MaterialApp\ntheme', color: Colors.purple, theme: theme),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Color spectrum
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [
                        _seedColor,
                        theme.colorScheme.primary,
                        theme.colorScheme.secondary,
                        theme.colorScheme.tertiary,
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('种子色', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                    Text('Primary', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                    Text('Secondary', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                    Text('Tertiary', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PipeItem extends StatelessWidget {
  const _PipeItem({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: color)),
    );
  }
}

class _ColorSwatchRow extends StatelessWidget {
  const _ColorSwatchRow({
    required this.label,
    required this.color,
    required this.theme,
  });
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: 'monospace',
            ),
          ),
          const Spacer(),
          Text(
            color.toHex(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'monospace',
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

extension on Color {
  String toHex() =>
      '#${(toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}
