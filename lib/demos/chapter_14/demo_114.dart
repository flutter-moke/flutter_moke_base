import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo114 extends StatefulWidget {
  const Demo114({super.key});
  @override
  State<Demo114> createState() => _Demo114State();
}

class _Demo114State extends State<Demo114> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _linear;
  late Animation<double> _easeInOut;
  late Animation<double> _bounceOut;
  late Animation<double> _elasticOut;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _linear = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _easeInOut = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _bounceOut = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
    _elasticOut = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '114',
      title: 'Curves 缓动曲线',
      description: '相同动画搭配不同曲线的效果对比',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurveRow('linear', colorScheme.primary, _linear),
          const SizedBox(height: 8),
          _buildCurveRow('easeInOut', colorScheme.tertiary, _easeInOut),
          const SizedBox(height: 8),
          _buildCurveRow('bounceOut', Colors.orange, _bounceOut),
          const SizedBox(height: 8),
          _buildCurveRow('elasticOut', Colors.purple, _elasticOut),
          const SizedBox(height: 16),
          Center(
            child: FilledButton.icon(
              onPressed: () => _controller.forward(from: 0),
              icon: const Icon(Icons.replay),
              label: const Text('重播全部'),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ Curves 对比',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          SizedBox(
            height: 140,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomPaint(
                painter: _CurvePainter(
                  theme: theme,
                  progress: _controller.value,
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurveRow(String label, Color color, Animation<double> anim) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                label,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Flexible(fit: FlexFit.loose, child: Container(
                height: 24,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: anim.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CurvePainter extends CustomPainter {
  _CurvePainter({required this.theme, required this.progress});
  final ThemeData theme;
  final double progress;

  static double linear(double t) => t;
  static double easeInOut(double t) =>
      t < 0.5 ? 2 * t * t : 1 - (1 - (2 * t - 1) * (2 * t - 1)) / 2;
  static double bounceOut(double t) {
    const n1 = 7.5625;
    const d1 = 2.75;
    if (t < 1 / d1) return n1 * t * t;
    if (t < 2 / d1) { t -= 1.5 / d1; return n1 * t * t + 0.75; }
    if (t < 2.5 / d1) { t -= 2.25 / d1; return n1 * t * t + 0.9375; }
    t -= 2.625 / d1; return n1 * t * t + 0.984375;
  }
  static double elasticOut(double t) {
    if (t == 0 || t == 1) return t;
    const c4 = 2.0943951;
    return -math.pow(2, 10 * t - 10) * math.sin((t * 10 - 10.75) * c4) + 1;
  }

  void _drawCurve(
      Canvas canvas, Size size, double Function(double) curve, Color color, String label, {int labelIndex = 0}) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final path = Path();
    const steps = 100;
    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final x = t * size.width;
      final y = (size.height - curve(t) * size.height).clamp(0.0, size.height.toDouble());
      if (i == 0) { path.moveTo(x, y); } else { path.lineTo(x, y); }
    }
    canvas.drawPath(path, paint);
    final tp = TextPainter(
      text: TextSpan(text: label, style: TextStyle(color: color, fontSize: 9)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(size.width - tp.width - 4, 4.0 + labelIndex * 14.0));
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;
    final gp = Paint()
      ..color = theme.colorScheme.outlineVariant.withValues(alpha: 0.3)
      ..strokeWidth = 0.5;
    for (int i = 0; i <= 4; i++) {
      canvas.drawLine(Offset(0, size.height * i / 4), Offset(size.width, size.height * i / 4), gp);
    }
    // Axes
    final ax = Paint()..color = theme.colorScheme.onSurfaceVariant..strokeWidth = 1;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), ax);
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), ax);
    // Labels
    final lp = TextPainter(
      text: TextSpan(text: 'progress↑', style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 8)),
      textDirection: TextDirection.ltr,
    )..layout();
    lp.paint(canvas, Offset(2, 2));
    final lx = TextPainter(
      text: TextSpan(text: 'time→', style: TextStyle(color: theme.colorScheme.onSurfaceVariant, fontSize: 8)),
      textDirection: TextDirection.ltr,
    )..layout();
    lx.paint(canvas, Offset(size.width - lx.width - 2, size.height - lx.height - 2));
    // Curves
    _drawCurve(canvas, size, linear, theme.colorScheme.primary, 'linear', labelIndex: 0);
    _drawCurve(canvas, size, easeInOut, theme.colorScheme.tertiary, 'easeInOut', labelIndex: 1);
    _drawCurve(canvas, size, bounceOut, Colors.orange, 'bounceOut', labelIndex: 2);
    _drawCurve(canvas, size, elasticOut, Colors.purple, 'elasticOut', labelIndex: 3);
    // Progress indicator
    final pp = Paint()
      ..color = theme.colorScheme.error.withValues(alpha: 0.5)
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(size.width * progress, 0), Offset(size.width * progress, size.height), pp);
  }

  @override
  bool shouldRepaint(covariant _CurvePainter old) => old.progress != progress;
}
