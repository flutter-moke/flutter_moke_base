import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo035 extends StatefulWidget {
  const Demo035({super.key});

  @override
  State<Demo035> createState() => _Demo035State();
}

class _Demo035State extends State<Demo035> {
  final List<bool> _selected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '035',
      title: 'ToggleButtons 切换按钮组',
      description: '多选切换按钮组演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('ToggleButtons 组'),
          const SizedBox(height: 8),
          ToggleButtons(
            isSelected: _selected,
            onPressed: (index) {
              setState(() {
                _selected[index] = !_selected[index];
              });
            },
            borderRadius: BorderRadius.circular(8),
            selectedColor: theme.colorScheme.onPrimary,
            fillColor: theme.colorScheme.primary,
            color: theme.colorScheme.onSurfaceVariant,
            borderColor: theme.colorScheme.outline,
            selectedBorderColor: theme.colorScheme.primary,
            constraints: const BoxConstraints(minWidth: 56, minHeight: 40),
            children: const [
              Icon(Icons.format_bold),
              Icon(Icons.format_italic),
              Icon(Icons.format_underline),
              Icon(Icons.format_strikethrough),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '已选: ${_selected.asMap().entries.where((e) => e.value).map((e) {
              switch (e.key) {
                case 0:
                  return '粗体';
                case 1:
                  return '斜体';
                case 2:
                  return '下划线';
                case 3:
                  return '删除线';
                default:
                  return '';
              }
            }).join(", ")})',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
