import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo112 extends StatefulWidget {
  const Demo112({super.key});
  @override
  State<Demo112> createState() => _Demo112State();
}

class _Demo112State extends State<Demo112> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
    return DemoFrame(
      articleId: '112',
      title: 'AnimationController 指南',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '点击下方容器触发缩放动画',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () {
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward(from: 0);
                }
              },
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: child,
                  );
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.touch_app, color: Colors.white, size: 40),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'AnimationController(vsync: this, duration: 800ms)\nTween 0.5 -> 1.5, Curves.easeInOut',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ AnimationController 生命周期',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _LifeStage(label: 'create\n(vsync)', color: theme.colorScheme.primary, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _LifeStage(label: 'forward()', color: theme.colorScheme.secondary, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _LifeStage(label: 'repeat()', color: Colors.orange, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _LifeStage(label: 'stop()', color: Colors.purple, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _LifeStage(label: 'dispose()', color: theme.colorScheme.error, theme: theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LifeStage extends StatelessWidget {
  const _LifeStage({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color)),
    );
  }
}
