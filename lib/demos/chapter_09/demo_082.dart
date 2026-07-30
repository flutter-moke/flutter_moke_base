import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo082 extends StatefulWidget {
  const Demo082({super.key});

  @override
  State<Demo082> createState() => _Demo082State();
}

class _Demo082State extends State<Demo082> {
  String _selected = '尚未选择';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '082',
      title: 'MenuAnchor 菜单锚点',
      description: 'MenuAnchor 提供更灵活的菜单定位控制。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮通过 MenuAnchor 弹出菜单。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Row(
            children: [
              MenuAnchor(
                builder: (context, controller, child) {
                  return FilledButton.icon(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(Icons.arrow_drop_down, size: 18),
                    label: const Text('选择操作'),
                  );
                },
                menuChildren: [
                  MenuItemButton(
                    onPressed: () {
                      setState(() => _selected = '编辑');
                      Navigator.of(context).pop();
                    },
                    leadingIcon: const Icon(Icons.edit, size: 18),
                    child: const Text('编辑'),
                  ),
                  MenuItemButton(
                    onPressed: () {
                      setState(() => _selected = '分享');
                      Navigator.of(context).pop();
                    },
                    leadingIcon: const Icon(Icons.share, size: 18),
                    child: const Text('分享'),
                  ),
                  MenuItemButton(
                    onPressed: () {
                      setState(() => _selected = '收藏');
                      Navigator.of(context).pop();
                    },
                    leadingIcon: const Icon(Icons.favorite_outline, size: 18),
                    child: const Text('收藏'),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(_selected,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
