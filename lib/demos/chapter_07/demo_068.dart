import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo068 extends StatelessWidget {
  const Demo068({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '068',
      title: 'Badge 徽章',
      description: 'Badge 附着在图标上，支持数字、圆点、自定义颜色。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('数字徽章：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              Badge(
                label: const Text('3'),
                child: Icon(Icons.notifications_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
              Badge(
                label: const Text('99+'),
                child: Icon(Icons.shopping_cart_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
              Badge(
                label: const Text('新'),
                child: Icon(Icons.message_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('圆点徽章（不显示数字）：',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              Badge(
                child: Icon(Icons.email_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
              Badge(
                isLabelVisible: true,
                child: Icon(Icons.camera_alt_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('自定义颜色：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              Badge(
                backgroundColor: Colors.green,
                label: const Text('5'),
                child: Icon(Icons.check_circle_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
              Badge(
                backgroundColor: Colors.orange,
                label: const Text('!'),
                child: Icon(Icons.warning_amber_outlined,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
              Badge(
                backgroundColor: Colors.red,
                label: const Text('3'),
                child: Icon(Icons.favorite_border,
                    size: 32, color: theme.colorScheme.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
