import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo063 extends StatefulWidget {
  const Demo063({super.key});

  @override
  State<Demo063> createState() => _Demo063State();
}

class _Demo063State extends State<Demo063> {
  final List<String> _chips = ['Flutter', 'Dart', 'Widget'];
  bool _deletedSomething = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '063',
      title: 'Chip 标签',
      description: '基础 Chip 与 RawChip，支持头像、删除操作。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chip（基础标签）：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Chip(label: const Text('Flutter')),
              Chip(label: const Text('Dart'), avatar: const Icon(Icons.code)),
              Chip(
                label: const Text('Widget'),
                avatar: CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: const Text('W',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('RawChip（带删除按钮）：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _chips
                .map((chip) => RawChip(
                      label: Text(chip),
                      avatar: const Icon(Icons.label_outline, size: 18),
                      onDeleted: () {
                        setState(() {
                          _chips.remove(chip);
                          _deletedSomething = true;
                        });
                      },
                      deleteIconColor: theme.colorScheme.error,
                    ))
                .toList(),
          ),
          if (_deletedSomething)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('已删除一个标签，点击下方按钮重置',
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant)),
            ),
          if (_deletedSomething)
            TextButton(
              onPressed: () {
                setState(() {
                  _chips.addAll(['Flutter', 'Dart', 'Widget']
                      .where((e) => !_chips.contains(e)));
                  _deletedSomething = false;
                });
              },
              child: const Text('重置'),
            ),
        ],
      ),
    );
  }
}
