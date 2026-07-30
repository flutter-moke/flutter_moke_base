import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo085 extends StatefulWidget {
  const Demo085({super.key});

  @override
  State<Demo085> createState() => _Demo085State();
}

class _Demo085State extends State<Demo085> {
  bool _showToolbar = true;
  bool _showLineNumbers = false;
  bool _wordWrap = true;
  bool _autoSave = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '085',
      title: 'CheckboxMenuButton 勾选菜单',
      description: 'CheckboxMenuButton 在菜单中提供勾选选项。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('使用 CheckboxMenuButton 在菜单中切换选项。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: MenuBar(
              children: [
                SubmenuButton(
                  menuChildren: [
                    CheckboxMenuButton(
                      value: _showToolbar,
                      onChanged: (v) =>
                          setState(() => _showToolbar = v ?? false),
                      child: const Text('显示工具栏'),
                    ),
                    CheckboxMenuButton(
                      value: _showLineNumbers,
                      onChanged: (v) =>
                          setState(() => _showLineNumbers = v ?? false),
                      child: const Text('显示行号'),
                    ),
                    CheckboxMenuButton(
                      value: _wordWrap,
                      onChanged: (v) =>
                          setState(() => _wordWrap = v ?? false),
                      child: const Text('自动换行'),
                    ),
                    const PopupMenuDivider(),
                    CheckboxMenuButton(
                      value: _autoSave,
                      onChanged: (v) =>
                          setState(() => _autoSave = v ?? false),
                      child: const Text('自动保存'),
                    ),
                  ],
                  child: const Text('编辑器'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('当前设置：',
                    style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('显示工具栏: ${_showToolbar ? '是' : '否'}'),
                Text('显示行号: ${_showLineNumbers ? '是' : '否'}'),
                Text('自动换行: ${_wordWrap ? '是' : '否'}'),
                Text('自动保存: ${_autoSave ? '是' : '否'}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
