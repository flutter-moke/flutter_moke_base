import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo087 extends StatelessWidget {
  const Demo087({super.key});

  final List<Color> _tileColors = const [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.pinkAccent,
    Colors.amberAccent,
    Colors.indigoAccent,
    Colors.limeAccent,
    Colors.cyanAccent,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '087',
      title: 'GridView 网格',
      description: 'GridView.count 展示彩色网格瓦片。',
      child: SizedBox(
        height: 400,
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
          children: List.generate(
            _tileColors.length,
            (i) => Container(
              decoration: BoxDecoration(
                color: _tileColors[i],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '${i + 1}',
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
    );
  }
}
