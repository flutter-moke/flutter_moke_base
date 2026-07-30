import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo051 extends StatefulWidget {
  const Demo051({super.key});
  @override
  State<Demo051> createState() => _Demo051State();
}

class _Demo051State extends State<Demo051> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '051',
      title: 'SliverAppBar 可折叠顶栏',
      description: 'SliverAppBar 的可折叠效果演示，滚动查看。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
        child: Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 150,
                pinned: true,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('可折叠标题'),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.landscape, size: 60, color: Colors.white),
                    ),
                  ),
                ),
                actions: [
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('列表项 #${index + 1}'),
                    subtitle: Text('向下滚动以查看折叠效果'),
                  ),
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：SliverAppBar 滚动行为',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(fit: FlexFit.loose, child: _behaviorCard(
                  context,
                  label: 'pinned',
                  pinned: true,
                  floating: false,
                  snap: false,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(fit: FlexFit.loose, child: _behaviorCard(
                  context,
                  label: 'floating',
                  pinned: false,
                  floating: true,
                  snap: false,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(fit: FlexFit.loose, child: _behaviorCard(
                  context,
                  label: 'snap',
                  pinned: false,
                  floating: true,
                  snap: true,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(fit: FlexFit.loose, child: _behaviorCard(
                  context,
                  label: 'pinned\n+floating',
                  pinned: true,
                  floating: true,
                  snap: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：title 折叠动画',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(fit: FlexFit.loose, child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Frame 1\n大标题\n居中',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.arrow_forward,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Flexible(fit: FlexFit.loose, child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Frame 2\n缩小左移',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.arrow_forward,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Flexible(fit: FlexFit.loose, child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Frame 3\n小标题左对齐',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _behaviorCard(
    BuildContext context, {
    required String label,
    required bool pinned,
    required bool floating,
    required bool snap,
  }) {
    final theme = Theme.of(context);
    final colors = [
      pinned ? Colors.blue : Colors.grey,
      floating ? Colors.green : Colors.grey,
      snap ? Colors.orange : Colors.grey,
    ];
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          // Half scroll state
          Container(
            height: 24,
            decoration: BoxDecoration(
              color: colors[0].withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text('50%',
                  style: TextStyle(fontSize: 8, color: colors[0])),
            ),
          ),
          const SizedBox(height: 2),
          // Full scroll state
          Container(
            height: 24,
            decoration: BoxDecoration(
              color: colors[0].withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text('到底',
                  style: TextStyle(
                      fontSize: 8,
                      color: colors[0],
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
