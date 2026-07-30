import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo111 extends StatelessWidget {
  const Demo111({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '111',
      title: 'Gradient 渐变',
      description: '展示 LinearGradient、RadialGradient 与 SweepGradient 三种渐变的视觉效果。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LinearGradient 线性渐变', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _gradientBox(
                height: 100,
                width: 160,
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ),
                label: '默认方向',
              ),
              _gradientBox(
                height: 100,
                width: 160,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange, Colors.purple],
                ),
                label: '对角线',
              ),
              _gradientBox(
                height: 100,
                width: 160,
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.tertiary,
                    theme.colorScheme.error,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
                label: '三色渐变',
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text('RadialGradient 径向渐变', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _gradientBox(
                height: 100,
                width: 160,
                gradient: const RadialGradient(
                  colors: [Colors.amber, Colors.brown],
                  radius: 1.0,
                ),
                label: '径向渐变',
              ),
              _gradientBox(
                height: 100,
                width: 160,
                gradient: RadialGradient(
                  colors: [Colors.cyan, Colors.blue, Colors.indigo],
                  radius: 1.0,
                  center: const Alignment(0.3, -0.3),
                ),
                label: '偏移中心',
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text('SweepGradient 扫描渐变', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _gradientBox(
                height: 100,
                width: 160,
                gradient: const SweepGradient(
                  colors: [Colors.red, Colors.yellow, Colors.green, Colors.blue, Colors.red],
                ),
                label: '扫描渐变',
              ),
              _gradientBox(
                height: 100,
                width: 160,
                gradient: const SweepGradient(
                  colors: [Colors.pink, Colors.purple, Colors.deepPurple],
                  startAngle: 0,
                  endAngle: 3.14,
                ),
                label: '半圆扫描',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gradientBox({
    required double height,
    required double width,
    required Gradient gradient,
    required String label,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
