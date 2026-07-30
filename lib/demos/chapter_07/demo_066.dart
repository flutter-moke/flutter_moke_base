import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo066 extends StatefulWidget {
  const Demo066({super.key});

  @override
  State<Demo066> createState() => _Demo066State();
}

class _Demo066State extends State<Demo066> {
  final Map<String, bool> _filters = {
    'Flutter': true,
    'Dart': false,
    'Widget': true,
    'Firebase': false,
  };

  @override
  Widget build(BuildContext context) {
    final selectedCount = _filters.values.where((v) => v).length;

    return DemoFrame(
      articleId: '066',
      title: 'FilterChip 筛选标签',
      description: 'FilterChip 多选，适合筛选场景。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _filters.keys.map((label) {
              return FilterChip(
                label: Text(label),
                selected: _filters[label]!,
                onSelected: (selected) {
                  setState(() => _filters[label] = selected);
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
            child: Text('已选择 $selectedCount 个筛选条件',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
