import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo095 extends StatefulWidget {
  const Demo095({super.key});

  @override
  State<Demo095> createState() => _Demo095State();
}

class _Demo095State extends State<Demo095> {
  final List<_PanelData> _panels = [
    _PanelData('Flutter', 'Google 开源的 UI 工具包。', true),
    _PanelData('Dart', 'Flutter 的编程语言。', false),
    _PanelData('Firebase', 'Google 的后端服务平台。', false),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '095',
      title: 'ExpansionPanelList 面板列表',
      description: 'ExpansionPanelList 管理多个展开面板。',
      child: ExpansionPanelList(
        elevation: 0,
        dividerColor: theme.colorScheme.outlineVariant,
        children: _panels
            .map((panel) => ExpansionPanel(
                  headerBuilder: (ctx, isExpanded) => ListTile(
                    title: Text(panel.title),
                    leading: Icon(Icons.folder_outlined,
                        color: theme.colorScheme.primary),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Text(panel.body,
                        style: theme.textTheme.bodyMedium),
                  ),
                  isExpanded: panel.isExpanded,
                ))
            .toList(),
        expansionCallback: (index, isExpanded) {
          setState(() => _panels[index].isExpanded = !isExpanded);
        },
      ),
    );
  }
}

class _PanelData {
  final String title;
  final String body;
  bool isExpanded;

  _PanelData(this.title, this.body, this.isExpanded);
}
