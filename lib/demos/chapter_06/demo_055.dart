import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo055 extends StatefulWidget {
  const Demo055({super.key});
  @override
  State<Demo055> createState() => _Demo055State();
}

class _Demo055State extends State<Demo055> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '055',
      title: 'TabBar 标签栏',
      description: 'TabBar 与 TabBarView 联动演示，支持左右滑动切换。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
        child: Scaffold(
          appBar: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: '热门', icon: Icon(Icons.local_fire_department)),
              Tab(text: '推荐', icon: Icon(Icons.recommend)),
              Tab(text: '关注', icon: Icon(Icons.person_add)),
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildTabContent('热门内容', Icons.local_fire_department, Colors.orange),
              _buildTabContent('推荐内容', Icons.recommend, Colors.blue),
              _buildTabContent('关注内容', Icons.person_add, Colors.green),
            ],
          ),
        ),
      ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：DefaultTabController 数据流',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top: DefaultTabController (InheritedWidget)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                  ),
                  child: const Text('DefaultTabController\n(InheritedWidget)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),
                // Arrows down
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.arrow_downward,
                        size: 16,
                        color: Colors.blue.withValues(alpha: 0.5)),
                    const SizedBox(width: 80),
                    Icon(Icons.arrow_downward,
                        size: 16,
                        color: Colors.blue.withValues(alpha: 0.5)),
                  ],
                ),
                const SizedBox(height: 8),
                // Bottom row: TabBar and TabBarView
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.green.withValues(alpha: 0.3)),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('TabBar',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                          Text('消费 selected index',
                              style: TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.orange.withValues(alpha: 0.3)),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('TabBarView',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange)),
                          Text('消费选中内容',
                              style: TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String text, IconData icon, Color color) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(text, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
