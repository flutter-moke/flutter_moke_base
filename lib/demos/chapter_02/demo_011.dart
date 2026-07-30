import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo011 extends StatefulWidget {
  const Demo011({super.key});

  @override
  State<Demo011> createState() => _Demo011State();
}

class _Demo011State extends State<Demo011> {
  Color _selectedColor = Colors.blue;
  String _colorName = '蓝色';

  final List<_ColorOption> _options = const [
    _ColorOption(Colors.blue, '蓝色'),
    _ColorOption(Colors.teal, '青色'),
    _ColorOption(Colors.indigo, '靛蓝'),
    _ColorOption(Colors.pink, '粉色'),
    _ColorOption(Colors.orange, '橙色'),
    _ColorOption(Colors.green, '绿色'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = ColorScheme.fromSeed(seedColor: _selectedColor);

    return DemoFrame(
      articleId: '011',
      title: 'Theme 主题系统与 Material 3',
      description: '通过 ColorScheme.fromSeed 动态生成主题',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 种子颜色选择器 ──
          Text('选择种子颜色：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: _options.map((opt) {
              final isSelected = _selectedColor == opt.color;
              return GestureDetector(
                onTap: () => setState(() {
                  _selectedColor = opt.color;
                  _colorName = opt.name;
                }),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: opt.color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                            color: theme.colorScheme.onSurface,
                            width: 3,
                          )
                        : null,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: opt.color.withValues(alpha: 0.4),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Text(
            '当前选择：$_colorName',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),
          Text('ColorScheme 色板预览：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),

          // ── 色板预览 ──
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSwatch(colorScheme.primary, 'Primary'),
              _buildSwatch(colorScheme.onPrimary, 'OnPrimary'),
              _buildSwatch(
                  colorScheme.primaryContainer, 'PrimaryContainer'),
              _buildSwatch(colorScheme.secondary, 'Secondary'),
              _buildSwatch(
                  colorScheme.secondaryContainer, 'SecondaryContainer'),
              _buildSwatch(colorScheme.tertiary, 'Tertiary'),
              _buildSwatch(colorScheme.error, 'Error'),
              _buildSwatch(colorScheme.surface, 'Surface'),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '提示：选择不同种子颜色，下方色板会动态变化',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text('主题继承层级', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.lightBlue.shade200, width: 2),
              ),
              child: Column(
                children: [
                  Text('MaterialApp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue.shade800)),
                  Text('seed=indigo', style: TextStyle(fontSize: 10, color: Colors.blue.shade600)),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade200, width: 1.5),
                    ),
                    child: Column(
                      children: [
                        Text('Page', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green.shade800)),
                        Text('继承主题', style: TextStyle(fontSize: 10, color: Colors.green.shade600)),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange.shade200, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              Text('Card', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.orange.shade800)),
                              Text('copyWith primary=red', style: TextStyle(fontSize: 10, color: Colors.orange.shade600)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwatch(Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 8)),
      ],
    );
  }
}

class _ColorOption {
  final Color color;
  final String name;

  const _ColorOption(this.color, this.name);
}
