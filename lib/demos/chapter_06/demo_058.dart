import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo058 extends StatelessWidget {
  const Demo058({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '058',
      title: 'SearchBar 搜索栏',
      description: 'Material 3 SearchBar 搜索栏组件展示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('基本 SearchBar:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const SearchBar(
            hintText: '搜索...',
            leading: Icon(Icons.search),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          ),
          const SizedBox(height: 16),

          const Text('带 trailing 操作:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const SearchBar(
            hintText: '输入关键词...',
            leading: Icon(Icons.search),
            trailing: [
              Icon(Icons.mic),
              Icon(Icons.photo_camera),
            ],
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          ),
          const SizedBox(height: 16),

          const Text('使用中状态 (with text):', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const SearchBar(
            hintText: '搜索...',
            leading: Icon(Icons.search),
            trailing: [Icon(Icons.clear)],
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('搜索建议', style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                )),
                const SizedBox(height: 8),
                _suggestionItem(Icons.history, 'Flutter 教程'),
                _suggestionItem(Icons.history, 'Material Design 3'),
                _suggestionItem(Icons.history, 'Dart 语言基础'),
                _suggestionItem(Icons.trending_up, '热门搜索趋势'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：搜索交互流',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _flowStep(context, 'SearchBar\n初始状态', Icons.search, Colors.blue),
                _flowArrow(context),
                _flowStep(context, '用户点击\n输入框聚焦', Icons.tap_and_play, Colors.green),
                _flowArrow(context),
                _flowStep(context, 'SearchAnchor\n显示建议列表', Icons.list, Colors.orange),
                _flowArrow(context),
                _flowStep(context, '用户选择\n填充并关闭', Icons.check_circle, Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _flowStep(BuildContext context, String label, IconData icon, Color color) {
    final theme = Theme.of(context);
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9, color: theme.colorScheme.onSurface)),
        ],
      ),
    );
  }

  Widget _flowArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Icon(Icons.arrow_forward, size: 16,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5)),
    );
  }

  Widget _suggestionItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
