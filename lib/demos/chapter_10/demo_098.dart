import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo098 extends StatelessWidget {
  const Demo098({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '098',
      title: 'Scrollbar 滚动条',
      description: '长列表配合 Scrollbar 指示滚动位置。',
      child: SizedBox(
        height: 400,
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 8,
          radius: const Radius.circular(4),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text('${i + 1}',
                    style: TextStyle(
                        color: theme.colorScheme.onPrimaryContainer)),
              ),
              title: Text('列表项 ${i + 1}'),
              subtitle: Text('这是第 ${i + 1} 项的描述文字'),
              trailing: Icon(Icons.chevron_right,
                  color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
        ),
      ),
    );
  }
}
