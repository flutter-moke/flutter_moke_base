import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo053 extends StatefulWidget {
  const Demo053({super.key});
  @override
  State<Demo053> createState() => _Demo053State();
}

class _Demo053State extends State<Demo053> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const Center(child: Icon(Icons.home, size: 48)),
      const Center(child: Icon(Icons.search, size: 48)),
      const Center(child: Icon(Icons.settings, size: 48)),
    ];
    final labels = ['首页', '搜索', '设置'];

    return DemoFrame(
      articleId: '053',
      title: 'BottomNavigationBar 传统底部导航',
      description: '传统 BottomNavigationBar 演示，支持三到五个导航项。',
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pages[_selectedIndex],
                      const SizedBox(height: 8),
                      Text('当前: ${labels[_selectedIndex]}',
                           style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (i) => setState(() => _selectedIndex = i),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
