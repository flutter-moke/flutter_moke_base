import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo056 extends StatefulWidget {
  const Demo056({super.key});
  @override
  State<Demo056> createState() => _Demo056State();
}

class _Demo056State extends State<Demo056> {
  String _selectedItem = '首页';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '056',
      title: 'Drawer 抽屉导航',
      description: '左侧抽屉导航效果演示，点击菜单按钮打开。',
      child: SizedBox(
        height: 350,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('应用标题'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        child: Icon(Icons.person, size: 32),
                      ),
                      const SizedBox(height: 8),
                      Text('用户名', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white)),
                      Text('user@example.com', style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('首页'),
                  selected: _selectedItem == '首页',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    setState(() => _selectedItem = '首页');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('收藏'),
                  selected: _selectedItem == '收藏',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    setState(() => _selectedItem = '收藏');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('设置'),
                  selected: _selectedItem == '设置',
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    setState(() => _selectedItem = '设置');
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('关于'),
                  onTap: () {
                    setState(() => _selectedItem = '关于');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.menu, size: 48, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 12),
                Text('当前页面: $_selectedItem',
                     style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('向左滑动或点击左上角菜单按钮',
                     style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
