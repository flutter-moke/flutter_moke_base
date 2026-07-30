import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo091 extends StatelessWidget {
  const Demo091({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '091',
      title: 'NestedScrollView 嵌套滚动',
      description: 'NestedScrollView 实现头部 + 选项卡内容的嵌套滚动。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 固定高度演示区域 ──
          Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  // 模拟 SliverAppBar
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                    ),
                    child: Center(
                      child: Text('可折叠头部（模拟 SliverAppBar）',
                          style: TextStyle(
                              color: theme.colorScheme.onPrimaryContainer)),
                    ),
                  ),
                  // TabBar
                  TabBar(
                    tabs: const [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                    labelColor: theme.colorScheme.primary,
                    unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                    indicatorColor: theme.colorScheme.primary,
                  ),
                  // TabBarView
                  Expanded(
                    child: TabBarView(
                      children: List.generate(
                        3,
                        (tab) => ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: 15,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: theme.colorScheme.primaryContainer,
                              child: Text('${i + 1}'),
                            ),
                            title: Text('Tab ${tab + 1} — 项目 ${i + 1}'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ NestedScrollView 三层结构',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Layer 1: collapsible header
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text('第1层：SliverAppBar 可折叠头部',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 4),
                // Layer 2: sticky TabBar
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Tab ${i + 1}',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,
                              color: theme.colorScheme.onSecondaryContainer)),
                    )),
                  ),
                ),
                const SizedBox(height: 4),
                // Layer 3: TabBarView scrollable content
                Container(
                  height: 84,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: List.generate(4, (i) => Container(
                      height: 14,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onTertiaryContainer.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
