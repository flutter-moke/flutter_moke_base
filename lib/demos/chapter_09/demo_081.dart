import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo081 extends StatefulWidget {
  const Demo081({super.key});

  @override
  State<Demo081> createState() => _Demo081State();
}

class _Demo081State extends State<Demo081> {
  String _selected = '未选择';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '081',
      title: 'PopupMenuButton 弹出菜单',
      description: 'PopupMenuButton 点击显示选项菜单。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('当前选择：', style: theme.textTheme.bodyMedium),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(_selected,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 16),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  setState(() => _selected = value);
                },
                itemBuilder: (ctx) => [
                  const PopupMenuItem(
                    value: '编辑',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('编辑'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: '分享',
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('分享'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: '收藏',
                    child: ListTile(
                      leading: Icon(Icons.favorite_outline),
                      title: Text('收藏'),
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: '删除',
                    child: ListTile(
                      leading: Icon(Icons.delete, color: Colors.red),
                      title: Text('删除',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
