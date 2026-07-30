import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo107 extends StatelessWidget {
  const Demo107({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '107',
      title: 'Material 组件基底',
      description: '展示 Material 组件在不同 elevation 和 shape 下的视觉效果。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Elevation 阴影层级', style: theme.textTheme.titleSmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(6, (i) {
              final elevation = i * 2.0;
              return _buildMaterialBox(
                context,
                elevation: elevation,
                label: 'elevation: ${elevation.toInt()}',
              );
            }),
          ),
          const SizedBox(height: 24),

          Text('Shape 形状', style: theme.textTheme.titleSmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildMaterialBox(
                context,
                elevation: 4,
                label: '圆形',
                shape: BoxShape.circle,
                size: 80,
              ),
              _buildMaterialBox(
                context,
                elevation: 4,
                label: '圆角8',
                shape: BoxShape.rectangle,
                borderRadius: 8,
              ),
              _buildMaterialBox(
                context,
                elevation: 4,
                label: '圆角16',
                shape: BoxShape.rectangle,
                borderRadius: 16,
              ),
              _buildMaterialBox(
                context,
                elevation: 4,
                label: '圆角24',
                shape: BoxShape.rectangle,
                borderRadius: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialBox(
    BuildContext context, {
    required double elevation,
    required String label,
    BoxShape shape = BoxShape.rectangle,
    double borderRadius = 8,
    double size = 80,
  }) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: elevation,
          shadowColor: theme.colorScheme.shadow,
          shape: shape == BoxShape.circle
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
          color: theme.colorScheme.primaryContainer,
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
