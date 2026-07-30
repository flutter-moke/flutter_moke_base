import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo083 extends StatelessWidget {
  const Demo083({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '083',
      title: 'MenuBar 菜单栏',
      description: 'MenuBar 提供桌面风格的菜单栏。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('桌面风格的 MenuBar 菜单栏（Web/Desktop 平台适用）。',
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
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.file_open, size: 18),
                      child: const Text('打开'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.save, size: 18),
                      child: const Text('保存'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.save_alt, size: 18),
                      child: const Text('另存为...'),
                    ),
                  ],
                  child: const Text('文件'),
                ),
                SubmenuButton(
                  menuChildren: [
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.content_cut, size: 18),
                      child: const Text('剪切'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.content_copy, size: 18),
                      child: const Text('复制'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.content_paste, size: 18),
                      child: const Text('粘贴'),
                    ),
                  ],
                  child: const Text('编辑'),
                ),
                SubmenuButton(
                  menuChildren: [
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.help_outline, size: 18),
                      child: const Text('帮助'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.info_outline, size: 18),
                      child: const Text('关于'),
                    ),
                  ],
                  child: const Text('帮助'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('提示：在 Web/Desktop 平台，点击菜单项查看效果。',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：MenuBar 三层嵌套',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Layer 1: MenuBar (horizontal bar)
                Container(
                  width: 260,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      _menuLabel(context, '文件', true),
                      const SizedBox(width: 4),
                      _menuLabel(context, '编辑', false),
                      const SizedBox(width: 4),
                      _menuLabel(context, '视图', false),
                      const SizedBox(width: 4),
                      _menuLabel(context, '帮助', false),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Icon(Icons.arrow_downward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                const SizedBox(height: 4),
                // Layer 2: SubmenuButton (dropdown)
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    children: [
                      Text('SubmenuButton',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary)),
                      const SizedBox(height: 2),
                      Text('下拉菜单容器',
                          style: TextStyle(
                              fontSize: 9,
                              color: Theme.of(context).colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Icon(Icons.arrow_downward, size: 14,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
                const SizedBox(height: 4),
                // Layer 3: MenuItemButton (items)
                Container(
                  width: 180,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    children: [
                      Text('MenuItemButton',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary)),
                      const SizedBox(height: 4),
                      _menuItemRow(context, Icons.file_open, '打开'),
                      _menuItemRow(context, Icons.save, '保存'),
                      _menuItemRow(context, Icons.content_copy, '复制'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuLabel(BuildContext context, String label, bool active) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: active ? theme.colorScheme.primaryContainer : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 11,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
              color: active
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSurface)),
    );
  }

  Widget _menuItemRow(BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 14,
              color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(
                  fontSize: 10, color: theme.colorScheme.onSurface)),
        ],
      ),
    );
  }
}
