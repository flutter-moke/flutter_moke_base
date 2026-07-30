import 'dart:async';
import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo104 extends StatefulWidget {
  const Demo104({super.key});

  @override
  State<Demo104> createState() => _Demo104State();
}

class _Demo104State extends State<Demo104> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _progress += 0.01;
        if (_progress > 1.0) {
          _progress = 0.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '104',
      title: 'LinearProgressIndicator 线性进度',
      description:
          '展示 determinate（有值）、indeterminate（无限滚动）和自定义颜色的线性进度。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Determinate
          Text('Determinate (${(_progress * 100).toInt()}%)',
              style: theme.textTheme.labelMedium),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: _progress),
          const SizedBox(height: 24),

          // Indeterminate
          Text('Indeterminate', style: theme.textTheme.labelMedium),
          const SizedBox(height: 8),
          const LinearProgressIndicator(),
          const SizedBox(height: 24),

          // Custom color
          Text('Custom Color', style: theme.textTheme.labelMedium),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: _progress,
            color: Colors.teal,
            backgroundColor: Colors.teal.withAlpha(40),
          ),
          const SizedBox(height: 16),

          Text(
            'Determinate 进度值通过 Timer 定时器从 0 到 1 循环递增。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
