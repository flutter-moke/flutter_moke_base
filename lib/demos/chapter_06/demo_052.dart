import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo052 extends StatefulWidget {
  const Demo052({super.key});
  @override
  State<Demo052> createState() => _Demo052State();
}

class _Demo052State extends State<Demo052> {
  int _selectedIndex = 0;

  final _labels = ['首页', '收藏', '通知', '我的'];

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '052',
      title: 'NavigationBar 底部导航 (M3)',
      description: 'Material 3 NavigationBar 演示，点击切换页面。',
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
                      _buildPageContent(),
                      const SizedBox(height: 8),
                      Text('当前: ${_labels[_selectedIndex]}',
                           style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (i) => setState(() => _selectedIndex = i),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '首页'),
                NavigationDestination(icon: Icon(Icons.favorite_outlined), selectedIcon: Icon(Icons.favorite), label: '收藏'),
                NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: '通知'),
                NavigationDestination(icon: Icon(Icons.person_outlined), selectedIcon: Icon(Icons.person), label: '我的'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent() {
    switch (_selectedIndex) {
      case 0: return const Column(children: [Icon(Icons.home, size: 48, color: Colors.blue), Text('首页内容')]);
      case 1: return const Column(children: [Icon(Icons.favorite, size: 48, color: Colors.red), Text('收藏内容')]);
      case 2: return const Column(children: [Icon(Icons.notifications, size: 48, color: Colors.orange), Text('通知内容')]);
      case 3: return const Column(children: [Icon(Icons.person, size: 48, color: Colors.green), Text('个人中心')]);
      default: return const SizedBox.shrink();
    }
  }
}
