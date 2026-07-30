import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo057 extends StatefulWidget {
  const Demo057({super.key});
  @override
  State<Demo057> createState() => _Demo057State();
}

class _Demo057State extends State<Demo057> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = ['收件箱', '星标', '稍后阅读', '已发送', '垃圾邮件'];
    final icons = [
      Icons.inbox,
      Icons.star,
      Icons.bookmark,
      Icons.send,
      Icons.report,
    ];

    return DemoFrame(
      articleId: '057',
      title: 'NavigationDrawer 导航抽屉 (M3)',
      description: 'Material 3 NavigationDrawer 效果演示。',
      child: SizedBox(
        height: 350,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('邮箱'),
          ),
          drawer: NavigationDrawer(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (i) {
              setState(() => _selectedIndex = i);
              Navigator.pop(context);
            },
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text('邮箱功能', style: theme.textTheme.titleSmall),
              ),
              ...List.generate(items.length, (i) {
                return NavigationDrawerDestination(
                  icon: Icon(icons[i]),
                  label: Text(items[i]),
                );
              }),
              const Divider(indent: 16, endIndent: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text('其他', style: theme.textTheme.titleSmall),
              ),
              const NavigationDrawerDestination(
                icon: Icon(Icons.settings_outlined),
                label: Text('设置'),
              ),
              const NavigationDrawerDestination(
                icon: Icon(Icons.help_outline),
                label: Text('帮助'),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icons[_selectedIndex], size: 48, color: theme.colorScheme.primary),
                const SizedBox(height: 12),
                Text(items[_selectedIndex], style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('点击左上角菜单按钮打开导航抽屉',
                     style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
