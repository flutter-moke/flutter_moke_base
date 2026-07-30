import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo067 extends StatefulWidget {
  const Demo067({super.key});

  @override
  State<Demo067> createState() => _Demo067State();
}

class _Demo067State extends State<Demo067> {
  final List<Map<String, String>> _contacts = [
    {'name': '张三', 'email': 'zhangsan@example.com'},
    {'name': '李四', 'email': 'lisi@example.com'},
    {'name': '王五', 'email': 'wangwu@example.com'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '067',
      title: 'InputChip 输入标签',
      description: 'InputChip 带头像与删除功能，模拟联系人标签。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_contacts.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text('所有标签已删除，点击下方重置',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant)),
              ),
            ),
          if (_contacts.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: _contacts.map((contact) {
                final initials = (contact['name'] as String).substring(0, 1);
                return InputChip(
                  label: Text(contact['name'] as String),
                  avatar: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Text(initials,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                        )),
                  ),
                  onDeleted: () {
                    setState(() => _contacts.remove(contact));
                  },
                );
              }).toList(),
            ),
          if (_contacts.length < 3)
            TextButton.icon(
              onPressed: () {
                setState(() {
                  if (!_contacts.any((c) => c['name'] == '张三')) {
                    _contacts.add({
                      'name': '张三',
                      'email': 'zhangsan@example.com'
                    });
                  }
                  if (!_contacts.any((c) => c['name'] == '李四')) {
                    _contacts.add({
                      'name': '李四',
                      'email': 'lisi@example.com'
                    });
                  }
                  if (!_contacts.any((c) => c['name'] == '王五')) {
                    _contacts.add({
                      'name': '王五',
                      'email': 'wangwu@example.com'
                    });
                  }
                });
              },
              icon: const Icon(Icons.restart_alt, size: 18),
              label: const Text('重置'),
            ),
        ],
      ),
    );
  }
}
