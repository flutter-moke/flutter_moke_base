import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo086 extends StatelessWidget {
  const Demo086({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '086',
      title: 'ListView 列表',
      description: 'ListView 展示多种列表项样式。',
      child: SizedBox(
        height: 400,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: const Text('简单列表项'),
              subtitle: const Text('这是最基本的列表项'),
            ),
            const Divider(height: 1),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(Icons.person,
                    color: theme.colorScheme.onPrimaryContainer),
              ),
              title: const Text('带头像'),
              subtitle: const Text('CircleAvatar + Icon'),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: const Text('带星标'),
              subtitle: const Text('使用 trailing 添加操作'),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            const Divider(height: 1),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('SwitchListTile'),
              subtitle: const Text('带开关的列表项'),
              value: true,
              onChanged: (v) {},
            ),
            const Divider(height: 1),
            CheckboxListTile(
              secondary: const Icon(Icons.check_circle_outline),
              title: const Text('CheckboxListTile'),
              subtitle: const Text('带勾选的列表项'),
              value: false,
              onChanged: (v) {},
            ),
          ],
        ),
      ),
    );
  }
}
