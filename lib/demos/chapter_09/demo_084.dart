import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo084 extends StatelessWidget {
  const Demo084({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '084',
      title: 'MenuItemButton 与 SubmenuButton',
      description: 'SubmenuButton 内嵌 MenuItemButton 构建层级菜单。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('使用 SubmenuButton 构建带子菜单的层级菜单。',
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
                      leadingIcon: const Icon(Icons.grid_view, size: 18),
                      child: const Text('网格视图'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.view_list, size: 18),
                      child: const Text('列表视图'),
                    ),
                    SubmenuButton(
                      leadingIcon: const Icon(Icons.sort, size: 18),
                      menuChildren: [
                        MenuItemButton(
                          leadingIcon: const Icon(Icons.sort_by_alpha, size: 18),
                          child: const Text('按名称'),
                        ),
                        MenuItemButton(
                          leadingIcon: const Icon(Icons.access_time, size: 18),
                          child: const Text('按日期'),
                        ),
                        MenuItemButton(
                          leadingIcon: const Icon(Icons.sort, size: 18),
                          child: const Text('按大小'),
                        ),
                      ],
                      child: const Text('排序方式'),
                    ),
                  ],
                  child: const Text('视图'),
                ),
                SubmenuButton(
                  menuChildren: [
                    SubmenuButton(
                      leadingIcon: const Icon(Icons.color_lens, size: 18),
                      menuChildren: [
                        MenuItemButton(child: const Text('浅色')),
                        MenuItemButton(child: const Text('深色')),
                        MenuItemButton(child: const Text('跟随系统')),
                      ],
                      child: const Text('主题'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.language, size: 18),
                      child: const Text('语言'),
                    ),
                    MenuItemButton(
                      leadingIcon: const Icon(Icons.notifications, size: 18),
                      child: const Text('通知设置'),
                    ),
                  ],
                  child: const Text('设置'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
