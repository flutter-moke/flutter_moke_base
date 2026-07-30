import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo093 extends StatefulWidget {
  const Demo093({super.key});

  @override
  State<Demo093> createState() => _Demo093State();
}

class _Demo093State extends State<Demo093> {
  int _itemCount = 10;

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _itemCount = 10 + (DateTime.now().millisecondsSinceEpoch % 10));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '093',
      title: 'RefreshIndicator 下拉刷新',
      description: '下拉 RefreshIndicator 触发 onRefresh 回调。',
      child: SizedBox(
        height: 400,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView.builder(
            itemCount: _itemCount,
            itemBuilder: (ctx, i) => ListTile(
              leading: Icon(Icons.article_outlined,
                  color: theme.colorScheme.primary),
              title: Text('文章 ${i + 1}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ),
    );
  }
}
