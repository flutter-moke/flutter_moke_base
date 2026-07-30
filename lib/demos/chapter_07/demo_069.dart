import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo069 extends StatelessWidget {
  const Demo069({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '069',
      title: 'CircleAvatar 圆形头像',
      description: 'CircleAvatar 支持首字母、背景色、图标等形态。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('首字母头像：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primary,
                child: const Text('张',
                    style: TextStyle(color: Colors.white)),
              ),
              CircleAvatar(
                backgroundColor: theme.colorScheme.secondary,
                child: const Text('李',
                    style: TextStyle(color: Colors.white)),
              ),
              CircleAvatar(
                backgroundColor: theme.colorScheme.tertiary,
                child: const Text('王',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('不同背景色：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: const Text('A',
                    style: TextStyle(color: Colors.white)),
              ),
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: const Text('B',
                    style: TextStyle(color: Colors.white)),
              ),
              CircleAvatar(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black87,
                child: const Text('C'),
              ),
              CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: const Text('D',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('带图标：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(Icons.person,
                    color: theme.colorScheme.onPrimaryContainer),
              ),
              CircleAvatar(
                backgroundColor: theme.colorScheme.secondaryContainer,
                child: Icon(Icons.settings,
                    color: theme.colorScheme.onSecondaryContainer),
              ),
              CircleAvatar(
                child: Icon(Icons.image,
                    color: theme.colorScheme.onPrimary),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：CircleAvatar 三层渲染',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
              width: 200,
              height: 160,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer: backgroundColor
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                          width: 2),
                    ),
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('backgroundColor',
                        style: TextStyle(
                            fontSize: 8,
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  // Middle: backgroundImage or color fill
                  Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.35),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                          width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text('bgImage/color',
                        style: TextStyle(
                            fontSize: 8,
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                  // Inner: child text
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text('张',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text('外圈 → 中圈 → 内圈 (child)',
                style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
