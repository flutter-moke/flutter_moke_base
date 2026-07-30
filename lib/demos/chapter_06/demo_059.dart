import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo059 extends StatefulWidget {
  const Demo059({super.key});
  @override
  State<Demo059> createState() => _Demo059State();
}

class _Demo059State extends State<Demo059> {
  bool _onDetailPage = false;
  String _selectedItem = '';

  final _items = [
    'Flutter 入门教程',
    'Dart 语言基础',
    'Material Design 3',
    '状态管理指南',
    '网络请求与数据加载',
  ];

  void _navigateToDetail(String item) {
    setState(() {
      _selectedItem = item;
      _onDetailPage = true;
    });
  }

  void _navigateBack() {
    setState(() {
      _onDetailPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '059',
      title: '导航体系与路由',
      description: '模拟 Navigator.push/pop 的页面导航效果。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _onDetailPage ? _buildDetailPage(theme) : _buildListPage(theme),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：页面栈变化',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          // 6 frame stack visualization
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _stackFrame(context, [], 'Frame 1'),
                Icon(Icons.arrow_forward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                _stackFrame(context, ['A'], 'Frame 2'),
                Icon(Icons.arrow_forward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                _stackFrame(context, ['A', 'B'], 'Frame 3'),
                Icon(Icons.arrow_forward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                _stackFrame(context, ['A', 'B', 'C'], 'Frame 4'),
                Icon(Icons.arrow_forward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                _stackFrame(context, ['A', 'B'], 'Frame 5'),
                Icon(Icons.arrow_forward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                _stackFrame(context, ['A'], 'Frame 6'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：ShellRoute 架构',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant),
            ),
            child: Column(
              children: [
                // Shell bar
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(7)),
                  ),
                  alignment: Alignment.center,
                  child: Text('ShellRoute (保持不变)',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer)),
                ),
                const Flexible(fit: FlexFit.loose, child:  SizedBox.shrink()),
                // 3 child pages
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.blue.withValues(alpha: 0.3)),
                        ),
                        child: const Center(
                          child: Text('Home\n子页面',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9)),
                        ),
                      ),
                    ),
                    Flexible(fit: FlexFit.loose, child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.green.withValues(alpha: 0.3)),
                        ),
                        child: const Center(
                          child: Text('Search\n子页面',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9)),
                        ),
                      ),
                    ),
                    Flexible(fit: FlexFit.loose, child: Container(
                        height: 60,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.orange.withValues(alpha: 0.3)),
                        ),
                        child: const Center(
                          child: Text('Profile\n子页面',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Flexible(fit: FlexFit.loose, child:  SizedBox.shrink()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stackFrame(BuildContext context, List<String> pages, String label) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 44,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 55,
            child: Stack(
              children: [
                for (int i = 0; i < pages.length; i++)
                  Positioned(
                    left: (i * 3).toDouble(),
                    top: (i * 3).toDouble(),
                    child: Container(
                      width: 36,
                      height: 28,
                      decoration: BoxDecoration(
                        color: i == pages.length - 1
                            ? theme.colorScheme.primaryContainer
                            : theme.colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: theme.colorScheme.outlineVariant),
                      ),
                      alignment: Alignment.center,
                      child: Text(pages[i],
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: i == pages.length - 1
                                  ? FontWeight.bold
                                  : FontWeight.normal)),
                    ),
                  ),
                if (pages.isEmpty)
                  Container(
                    width: 36,
                    height: 28,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: theme.colorScheme.outlineVariant),
                    ),
                    alignment: Alignment.center,
                    child: Text('[]',
                        style: TextStyle(
                            fontSize: 9,
                            color: theme.colorScheme.onSurfaceVariant)),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(label,
              style: TextStyle(
                  fontSize: 8,
                  color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _buildListPage(ThemeData theme) {
    return Container(
      key: const ValueKey('list'),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
            ),
            child: Row(
              children: [
                Icon(Icons.article, color: theme.colorScheme.onPrimaryContainer),
                const SizedBox(width: 8),
                Text('文章列表',
                     style: theme.textTheme.titleSmall?.copyWith(
                       color: theme.colorScheme.onPrimaryContainer,
                     )),
                const Spacer(),
                Text('共 ${_items.length} 篇',
                     style: theme.textTheme.bodySmall?.copyWith(
                       color: theme.colorScheme.onPrimaryContainer,
                     )),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _items.length,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 16),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Text('${index + 1}',
                         style: TextStyle(
                           color: theme.colorScheme.onSecondaryContainer,
                         )),
                  ),
                  title: Text(_items[index]),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigateToDetail(_items[index]),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildDetailPage(ThemeData theme) {
    return Container(
      key: const ValueKey('detail'),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_back, color: theme.colorScheme.onSecondaryContainer),
                const SizedBox(width: 8),
                Text('文章详情',
                     style: theme.textTheme.titleSmall?.copyWith(
                       color: theme.colorScheme.onSecondaryContainer,
                     )),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_selectedItem,
                       style: theme.textTheme.titleMedium?.copyWith(
                         fontWeight: FontWeight.bold,
                       )),
                  const SizedBox(height: 12),
                  Text(
                    '这是关于"$_selectedItem"的详细内容页面。'
                    '在实际应用中，这里会显示完整的文章内容和交互控件。\n\n'
                    '点击下方按钮或使用返回手势可以返回上一页。',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: FilledButton.icon(
                      onPressed: _navigateBack,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('返回列表'),
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
