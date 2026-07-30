import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo113 extends StatefulWidget {
  const Demo113({super.key});
  @override
  State<Demo113> createState() => _Demo113State();
}

class _Demo113State extends State<Demo113> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<AlignmentGeometry> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.orange,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _alignmentAnimation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
      articleId: '113',
      title: 'Tween 补间动画',
      description: 'ColorTween + AlignmentTween',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ColorTween(blue -> orange) 和 AlignmentTween(topLeft -> bottomRight)',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: GestureDetector(
              onTap: () => _controller.forward(from: 0),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Align(
                    alignment: _alignmentAnimation.value,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: _colorAnimation.value,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(Icons.animation, color: Colors.white),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: FilledButton.icon(
              onPressed: () => _controller.forward(from: 0),
              icon: const Icon(Icons.replay),
              label: const Text('重播动画'),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ Tween 动画链路',
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
                  _PipeBox(label: 'Animation\nController\n0 → 1', color: theme.colorScheme.primary, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _PipeBox(label: 'Curved\nAnimation\n(easeInOut)', color: theme.colorScheme.secondary, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _PipeBox(label: 'Tween\n(target范围)', color: Colors.orange, theme: theme),
                  const Icon(Icons.arrow_forward, size: 14),
                  _PipeBox(label: 'Widget\n属性', color: Colors.green, theme: theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PipeBox extends StatelessWidget {
  const _PipeBox({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
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
