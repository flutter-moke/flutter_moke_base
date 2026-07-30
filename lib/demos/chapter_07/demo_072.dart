import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo072 extends StatelessWidget {
  const Demo072({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '072',
      title: 'Tooltip 提示工具',
      description: '长按或悬停显示提示信息。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('长按下面的元素查看提示：',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              Tooltip(
                message: '添加新项目',
                child: IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 36),
                  onPressed: () {},
                  tooltip: '添加', // overridden by Tooltip
                ),
              ),
              Tooltip(
                message: '编辑当前内容',
                triggerMode: TooltipTriggerMode.tap,
                child: IconButton(
                  icon: const Icon(Icons.edit_outlined, size: 36),
                  onPressed: () {},
                ),
              ),
              Tooltip(
                message: '删除此条目（不可恢复）',
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(6),
                ),
                textStyle: TextStyle(color: theme.colorScheme.onError),
                child: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 36),
                  onPressed: () {},
                ),
              ),
              Tooltip(
                message: '分享到社交平台',
                preferBelow: false,
                child: IconButton(
                  icon: const Icon(Icons.share_outlined, size: 36),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('提示：长按图标显示 Tooltip，点击则不显示。',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
