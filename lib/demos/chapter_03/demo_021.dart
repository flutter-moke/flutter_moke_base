import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo021 extends StatefulWidget {
  const Demo021({super.key});
  @override
  State<Demo021> createState() => _Demo021State();
}

class _Demo021State extends State<Demo021> {
  bool _dense = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '021',
      title: 'ListTile 列表图块',
      description: 'ListTile 配置演示（leading, trailing, subtitle）',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Dense Toggle ──
          Row(
            children: [
              const Text('Dense 密集模式'),
              const SizedBox(width: 8),
              Switch(
                value: _dense,
                onChanged: (v) => setState(() => _dense = v),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '打开后 ListTile 高度减小',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),

          const Divider(height: 16),

          // ── Example 1: leading icon + title + subtitle ──
          const Text('带图标、标题和副标题',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ListTile(
            dense: _dense,
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: const Text('收藏'),
            subtitle: const Text('点击收藏这篇文章'),
            trailing: const Icon(Icons.chevron_right),
          ),

          const Divider(height: 8),

          // ── Example 2: CircleAvatar + title + trailing ──
          const Text('带头像和尾部图标',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ListTile(
            dense: _dense,
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: const Text('张', style: TextStyle(color: Colors.white)),
            ),
            title: const Text('张三'),
            subtitle: const Text('在线'),
            trailing: const Icon(Icons.chat_bubble_outline),
          ),

          const Divider(height: 8),

          // ── Example 3: Three-line ListTile ──
          const Text('三行文本',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ListTile(
            dense: _dense,
            isThreeLine: true,
            leading: const Icon(Icons.article_outlined),
            title: const Text('Flutter 布局指南'),
            subtitle: const Text(
              '本章节介绍了 Flutter 中常用的布局组件，包括 Container、Row、Column、Stack 等。',
            ),
          ),

          const Divider(height: 8),

          // ── Example 4: Dense ListTile ──
          const Text('启用 dense 的效果',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ListTile(
            dense: _dense,
            leading: const Icon(Icons.info_outline),
            title: const Text('信息提示'),
            subtitle: const Text('Dense 模式减小了垂直间距'),
            trailing: const Icon(Icons.open_in_new, size: 16),
          ),
        ],
      ),
    );
  }
}
