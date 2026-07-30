import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo097 extends StatefulWidget {
  const Demo097({super.key});

  @override
  State<Demo097> createState() => _Demo097State();
}

class _Demo097State extends State<Demo097> {
  final List<String> _items = List.generate(6, (i) => '项目 ${i + 1}');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '097',
      title: 'ReorderableListView 拖拽排序',
      description: '长按拖拽排序列表项。',
      child: SizedBox(
        height: 400,
        child: ReorderableListView.builder(
          itemCount: _items.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          itemBuilder: (ctx, i) {
            final item = _items[i];
            return ListTile(
              key: ValueKey(item),
              leading: ReorderableDragStartListener(
                index: i,
                child: Icon(Icons.drag_handle,
                    color: theme.colorScheme.onSurfaceVariant),
              ),
              title: Text(item),
              trailing: Icon(Icons.menu,
                  color: theme.colorScheme.onSurfaceVariant),
            );
          },
        ),
      ),
    );
  }
}
