import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo088 extends StatelessWidget {
  const Demo088({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '088',
      title: 'CustomScrollView 与 Sliver',
      description: 'CustomScrollView 组合 SliverList 和 SliverGrid。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 420,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 100,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('SliverAppBar'),
                    background: Container(
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('SliverList 区域',
                        style: theme.textTheme.labelLarge),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, i) => ListTile(
                      leading: CircleAvatar(child: Text('${i + 1}')),
                      title: Text('列表项 ${i + 1}'),
                    ),
                    childCount: 5,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('SliverGrid 区域',
                        style: theme.textTheme.labelLarge),
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (ctx, i) => Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('${i + 1}',
                            style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    childCount: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ Sliver 协作布局',
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
                // SliverAppBar block
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text('SliverAppBar（可折叠头部）',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 4),
                Icon(Icons.arrow_downward, size: 14,
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5)),
                const SizedBox(height: 4),
                // SliverList block
                Container(
                  height: 60,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: List.generate(3, (i) => Flexible(fit: FlexFit.loose, child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(height: 4),
                Icon(Icons.arrow_downward, size: 14,
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5)),
                const SizedBox(height: 4),
                // SliverGrid block
                Container(
                  height: 48,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: List.generate(3, (i) => Flexible(fit: FlexFit.loose, child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onTertiaryContainer.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
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
