import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo080 extends StatefulWidget {
  const Demo080({super.key});

  @override
  State<Demo080> createState() => _Demo080State();
}

class _Demo080State extends State<Demo080> {
  int _bannerCount = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '080',
      title: 'MaterialBanner 横幅通知',
      description: '点击按钮在顶部显示 MaterialBanner 横幅通知。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮显示横幅通知。', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Builder(
            builder: (ctx) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    FilledButton.icon(
                      icon: const Icon(Icons.notifications_outlined, size: 18),
                      label: const Text('显示 Banner'),
                      onPressed: () {
                        _bannerCount++;
                        ScaffoldMessenger.of(ctx).showMaterialBanner(
                          MaterialBanner(
                            padding: const EdgeInsets.all(16),
                            content: Text(
                                '这是第 $_bannerCount 条横幅通知。'),
                            leading: Icon(Icons.info_outline,
                                color: theme.colorScheme.primary),
                            actions: [
                              TextButton(
                                onPressed: () => ScaffoldMessenger.of(ctx)
                                    .hideCurrentMaterialBanner(),
                                child: const Text('关闭'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.cancel_outlined, size: 18),
                      label: const Text('隐藏 Banner'),
                      onPressed: () {
                        ScaffoldMessenger.of(ctx)
                            .hideCurrentMaterialBanner();
                      },
                    ),
                  ],
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
            child: Text('MaterialBanner 显示在屏幕顶部，需要手动关闭。',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
