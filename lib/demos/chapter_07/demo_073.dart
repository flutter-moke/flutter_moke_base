import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo073 extends StatelessWidget {
  const Demo073({super.key});

  final List<Color> _cardColors = const [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '073',
      title: 'CarouselView 轮播视图',
      description: 'CarouselView 提供滑动卡片轮播体验。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: CarouselView(
              itemExtent: 260,
              shrinkExtent: 180,
              children: List.generate(
                _cardColors.length,
                (i) => Card(
                  color: _cardColors[i],
                  child: Center(
                    child: Text(
                      '卡片 ${i + 1}',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('左右滑动切换卡片',
              style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
