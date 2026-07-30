import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo103 extends StatefulWidget {
  const Demo103({super.key});

  @override
  State<Demo103> createState() => _Demo103State();
}

class _Demo103State extends State<Demo103> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
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
      articleId: '103',
      title: 'CircularProgressIndicator 圆形进度',
      description:
          '展示 determinate（有值）、indeterminate（无限旋转）和自定义样式的圆形进度。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 三种样式
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Determinate
              _buildItem(
                context,
                label: 'Determinate',
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      value: _controller.value,
                      strokeWidth: 6,
                    );
                  },
                ),
              ),

              // Indeterminate
              _buildItem(
                context,
                label: 'Indeterminate',
                child: const CircularProgressIndicator(),
              ),

              // Customized
              _buildItem(
                context,
                label: 'Custom',
                child: const CircularProgressIndicator(
                  strokeWidth: 8,
                  color: Colors.deepOrange,
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            'Determinate 圆形进度使用 AnimationController 循环驱动，'
            'Indeterminate 为无限旋转动画。Custom 示例修改了 strokeWidth 与 color。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String label,
    required Widget child,
  }) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 64, height: 64, child: Center(child: child)),
        const SizedBox(height: 8),
        Text(label, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
