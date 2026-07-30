import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo094 extends StatelessWidget {
  const Demo094({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '094',
      title: 'ExpansionTile 可展开列表',
      description: 'ExpansionTile 可点击展开/收起详情。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('什么是 Flutter？'),
            subtitle: const Text('点击展开了解更多'),
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Text(
                'Flutter 是 Google 开源的 UI 工具包，用于从单份代码构建精美、编译型多平台应用。',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Divider(height: 1),
          ExpansionTile(
            leading: const Icon(Icons.code),
            title: const Text('什么是 Dart？'),
            subtitle: const Text('点击展开了解更多'),
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Text(
                'Dart 是 Flutter 使用的编程语言，由 Google 开发，支持 JIT 与 AOT 编译。',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Divider(height: 1),
          ExpansionTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text('Widget 是什么？'),
            subtitle: const Text('点击展开了解更多'),
            initiallyExpanded: false,
            childrenPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Text(
                '在 Flutter 中，所有界面元素都是 Widget，从布局到交互控件，一切皆 Widget。',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
