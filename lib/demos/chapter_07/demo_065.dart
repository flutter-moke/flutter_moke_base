import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo065 extends StatefulWidget {
  const Demo065({super.key});

  @override
  State<Demo065> createState() => _Demo065State();
}

class _Demo065State extends State<Demo065> {
  String _selected = 'Flutter';

  final List<String> _options = ['Flutter', 'Dart', 'Firebase', 'Widget'];

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '065',
      title: 'ChoiceChip 选择标签',
      description: 'ChoiceChip 组单选，选中一个标签。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _options.map((option) {
              return ChoiceChip(
                label: Text(option),
                selected: _selected == option,
                onSelected: (selected) {
                  setState(() => _selected = option);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('当前选择：$_selected',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
