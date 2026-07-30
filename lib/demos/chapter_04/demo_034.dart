import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo034 extends StatefulWidget {
  const Demo034({super.key});

  @override
  State<Demo034> createState() => _Demo034State();
}

class _Demo034State extends State<Demo034> {
  // Single selection
  final List<String> _sizeOptions = const ['小', '中', '大'];
  String _selectedSize = '中';

  // Multi selection
  final List<String> _textStyleOptions = const ['粗体', '斜体', '下划线'];
  final Set<String> _selectedStyles = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '034',
      title: 'SegmentedButton 分段按钮',
      description: '2-3 段选择示例',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Single-select: 尺寸选择'),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: _sizeOptions.map((size) {
              return ButtonSegment<String>(
                value: size,
                label: Text(size),
              );
            }).toList(),
            selected: {_selectedSize},
            onSelectionChanged: (selected) {
              setState(() {
                _selectedSize = selected.first;
              });
            },
          ),
          const SizedBox(height: 8),
          Text(
            '已选: $_selectedSize',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          _buildLabel('Multi-select: 文字样式'),
          const SizedBox(height: 8),
          SegmentedButton<String>(
            segments: _textStyleOptions.map((style) {
              IconData icon;
              switch (style) {
                case '粗体':
                  icon = Icons.format_bold;
                  break;
                case '斜体':
                  icon = Icons.format_italic;
                  break;
                case '下划线':
                  icon = Icons.format_underline;
                  break;
                default:
                  icon = Icons.text_fields;
              }
              return ButtonSegment<String>(
                value: style,
                label: Text(style),
                icon: Icon(icon),
              );
            }).toList(),
            selected: _selectedStyles,
            onSelectionChanged: (selected) {
              setState(() {
                _selectedStyles.clear();
                _selectedStyles.addAll(selected);
              });
            },
            showSelectedIcon: false,
          ),
          const SizedBox(height: 8),
          Text(
            '已选: ${_selectedStyles.isEmpty ? "无" : _selectedStyles.join(", ")}',
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
