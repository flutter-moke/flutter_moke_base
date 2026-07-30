import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo110 extends StatefulWidget {
  const Demo110({super.key});

  @override
  State<Demo110> createState() => _Demo110State();
}

class _Demo110State extends State<Demo110> {
  int _presetIndex = 0;

  final List<_ShadowPreset> _presets = [
    _ShadowPreset(
      name: '柔和阴影',
      color: Colors.black,
      blur: 8,
      offset: Offset(0, 4),
    ),
    _ShadowPreset(
      name: '强烈阴影',
      color: Colors.black87,
      blur: 16,
      offset: Offset(0, 8),
    ),
    _ShadowPreset(
      name: '彩色阴影',
      color: Colors.deepPurple,
      blur: 20,
      offset: Offset(4, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final preset = _presets[_presetIndex];

    return DemoFrame(
      articleId: '110',
      title: 'BoxShadow 盒子阴影',
      description: '通过预设样式切换，展示不同阴影效果的视觉差异。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 阴影展示卡片
          Center(
            child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: preset.color.withAlpha(60),
                    blurRadius: preset.blur,
                    offset: preset.offset,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                preset.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 阴影参数详情
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('当前参数',
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 8),
                  _paramRow(theme, '颜色', preset.color.toString().split('(')[0]),
                  _paramRow(theme, '模糊半径', '${preset.blur.toInt()} px'),
                  _paramRow(
                      theme, '偏移', 'X: ${preset.offset.dx.toInt()}, Y: ${preset.offset.dy.toInt()}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 预设切换按钮
          Text('切换预设', style: theme.textTheme.labelMedium),
          const SizedBox(height: 8),
          Row(
            children: List.generate(_presets.length, (i) {
              final isActive = i == _presetIndex;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(_presets[i].name),
                  selected: isActive,
                  onSelected: (selected) {
                    if (selected) setState(() => _presetIndex = i);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _paramRow(ThemeData theme, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(label,
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
          ),
          Text(value, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _ShadowPreset {
  final String name;
  final Color color;
  final double blur;
  final Offset offset;

  const _ShadowPreset({
    required this.name,
    required this.color,
    required this.blur,
    required this.offset,
  });
}
