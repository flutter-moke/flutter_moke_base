import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo074 extends StatelessWidget {
  const Demo074({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '074',
      title: 'AboutDialog 与 LicensePage',
      description: '点击按钮弹出 AboutDialog 或 LicensePage。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('系统内置关于对话框与许可信息页面。',
              style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                icon: const Icon(Icons.info_outline, size: 18),
                label: const Text('显示 AboutDialog'),
                onPressed: () => showAboutDialog(
                  context: context,
                  applicationName: 'Flutter Moke',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '\u{a9} 2026 Flutter Tutorial',
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Flutter 教程演示应用。'),
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.description_outlined, size: 18),
                label: const Text('显示 LicensePage'),
                onPressed: () => showLicensePage(
                  context: context,
                  applicationName: 'Flutter Moke',
                  applicationVersion: '1.0.0',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('点击按钮弹出系统对话框。',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
