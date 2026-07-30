import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo050 extends StatelessWidget {
  const Demo050({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '050',
      title: 'AppBar 顶部应用栏',
      description: 'AppBar 的 leading、title、actions 与 bottom 属性展示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('带 leading + actions:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          AppBar(
            leading: const Icon(Icons.menu),
            title: const Text('首页'),
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: null),
              IconButton(icon: const Icon(Icons.notifications), onPressed: null),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: null),
            ],
          ),
          const SizedBox(height: 16),

          const Text('带 Bottom (TabBar):', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          SizedBox(
            height: 200,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('标签栏示例'),
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.star), text: '收藏'),
                      Tab(icon: Icon(Icons.people), text: '好友'),
                      Tab(icon: Icon(Icons.settings), text: '设置'),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Center(child: Text('收藏页内容')),
                    Center(child: Text('好友页内容')),
                    Center(child: Text('设置页内容')),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：AppBar elevation 对比',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(fit: FlexFit.loose, child: Container(
                  height: 86,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  alignment: Alignment.center,
                  child: const Text('普通状态\nelevation = 0（无阴影）',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(fit: FlexFit.loose, child: Container(
                  height: 86,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text('滚动后\nscrolledUnderElevation\n阴影可见',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
