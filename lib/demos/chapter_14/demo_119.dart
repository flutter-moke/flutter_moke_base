import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo119 extends StatefulWidget {
  const Demo119({super.key});
  @override
  State<Demo119> createState() => _Demo119State();
}

class _Demo119State extends State<Demo119> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _controller.repeat(reverse: true);
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
      articleId: '119',
      title: 'TweenAnimationBuilder 自动动画',
      description: 'TweenAnimationBuilder 自动处理补间，无需手动管理控制器',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TweenAnimationBuilder 使用 begin/end 值自动驱动动画，\n下方示例结合 AnimatedBuilder 展示循环缩放效果。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.8, end: 1.2),
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.tertiary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.auto_awesome,
                        size: 48,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.autorenew, size: 16, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  '循环缩放 0.8 -> 1.2',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 动画系统全览',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Top tier (narrowest)
                Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.withValues(alpha: 0.4)),
                  ),
                  child: const Text('AnimatedContainer\nAnimatedSwitcher / Hero',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.green)),
                ),
                const SizedBox(height: 4),
                Text('最简便 · 控制最少',
                    style: TextStyle(fontSize: 9, color: Colors.green)),
                const SizedBox(height: 8),
                // Middle tier
                Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withValues(alpha: 0.4)),
                  ),
                  child: const Text('Tween / CurvedAnimation\nAnimatedBuilder',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.orange)),
                ),
                const SizedBox(height: 4),
                Text('中等复杂度',
                    style: TextStyle(fontSize: 9, color: Colors.orange)),
                const SizedBox(height: 8),
                // Bottom tier (widest)
                Container(
                  width: 240,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.colorScheme.error.withValues(alpha: 0.4)),
                  ),
                  child: const Text('AnimationController\nTicker / vsync',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.redAccent)),
                ),
                const SizedBox(height: 4),
                Text('最强大 · 控制最多',
                    style: TextStyle(fontSize: 9, color: Colors.redAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
