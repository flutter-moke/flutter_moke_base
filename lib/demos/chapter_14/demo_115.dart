import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo115 extends StatefulWidget {
  const Demo115({super.key});
  @override
  State<Demo115> createState() => _Demo115State();
}

class _Demo115State extends State<Demo115> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _rotation = Tween<double>(begin: 0, end: 2 * 3.14159265).animate(
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
      articleId: '115',
      title: 'AnimatedBuilder 与显式动画',
      description: 'AnimatedBuilder 驱动旋转动画',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AnimatedBuilder 监听 Animation 并重建其 builder，实现显式动画控制。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () => _controller.forward(from: 0),
              child: AnimatedBuilder(
                animation: _rotation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotation.value,
                    child: child,
                  );
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.sync,
                    size: 56,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: FilledButton.icon(
              onPressed: () => _controller.forward(from: 0),
              icon: const Icon(Icons.replay),
              label: const Text('旋转 360°'),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ child 优化对比',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      Text('未优化', style: TextStyle(fontWeight: FontWeight.w600,
                          color: theme.colorScheme.error, fontSize: 13)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            _NodeBox(label: 'AnimatedBuilder', color: theme.colorScheme.error, theme: theme),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.error),
                            ),
                            _NodeBox(label: 'builder重建\n整个子树', color: theme.colorScheme.error.withValues(alpha: 0.7), theme: theme),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Icon(Icons.close, size: 14, color: theme.colorScheme.error),
                            ),
                            _NodeBox(label: '重复创建\nContainer', color: theme.colorScheme.error.withValues(alpha: 0.5), theme: theme),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      Text('已优化', style: TextStyle(fontWeight: FontWeight.w600,
                          color: Colors.green, fontSize: 13)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            _NodeBox(label: 'AnimatedBuilder', color: Colors.green, theme: theme),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Icon(Icons.arrow_forward, size: 12, color: Colors.green),
                            ),
                            _NodeBox(label: 'builder仅\n动画部分', color: Colors.green.withValues(alpha: 0.7), theme: theme),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Icon(Icons.check, size: 14, color: Colors.green),
                            ),
                            _NodeBox(label: 'const child\n缓存外部', color: Colors.green.withValues(alpha: 0.5), theme: theme),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NodeBox extends StatelessWidget {
  const _NodeBox({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: color)),
    );
  }
}
