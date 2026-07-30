import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo109 extends StatelessWidget {
  const Demo109({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '109',
      title: 'Border / BorderRadius / ShapeBorder',
      description: '直观对比不同边框样式、圆角半径和形状边框的视觉效果。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Border 边框样式', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _borderBox(context, '无边框', Border.all(width: 0),
                  color: theme.colorScheme.primary),
              _borderBox(context, 'solid',
                  Border.all(color: theme.colorScheme.primary, width: 2)),
              _borderBox(context, '仅底部',
                  const Border(bottom: BorderSide(color: Colors.green, width: 3))),
              _borderBox(context, '不同色',
                  Border(
                    left: BorderSide(color: theme.colorScheme.primary, width: 3),
                    bottom: BorderSide(color: Colors.amber, width: 3),
                  )),
            ],
          ),
          const SizedBox(height: 24),

          Text('BorderRadius 圆角半径', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _borderRadiusBox(context, '0', BorderRadius.zero),
              _borderRadiusBox(context, '8', BorderRadius.circular(8)),
              _borderRadiusBox(context, '16', BorderRadius.circular(16)),
              _borderRadiusBox(context, '仅左上',
                  const BorderRadius.only(topLeft: Radius.circular(20))),
              _borderRadiusBox(context, '椭圆',
                  BorderRadius.circular(20)),
            ],
          ),
          const SizedBox(height: 24),

          Text('ShapeBorder 形状边框', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _shapeBox(
                context,
                label: 'RoundedRect',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
              ),
              _shapeBox(
                context,
                label: 'Circle',
                shape: CircleBorder(
                  side: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
                size: 80,
              ),
              _shapeBox(
                context,
                label: 'Stadium',
                shape: StadiumBorder(
                  side: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
                width: 120,
              ),
              _shapeBox(
                context,
                label: 'BeveledRect',
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _borderBox(BuildContext context, String label, BoxBorder border,
      {Color? color}) {
    final theme = Theme.of(context);
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        border: border,
        color: color?.withAlpha(20),
      ),
      alignment: Alignment.center,
      child: Text(label,
          style: theme.textTheme.labelSmall),
    );
  }

  Widget _borderRadiusBox(
      BuildContext context, String label, BorderRadius radius) {
    final theme = Theme.of(context);
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: radius,
      ),
      alignment: Alignment.center,
      child: Text(label,
          style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer)),
    );
  }

  Widget _shapeBox(
    BuildContext context, {
    required String label,
    required ShapeBorder shape,
    double size = 80,
    double width = 80,
  }) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          shape: shape,
          color: theme.colorScheme.secondaryContainer,
          child: SizedBox(
            width: width,
            height: size,
            child: Center(
              child: Text(label,
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSecondaryContainer),
                  textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }
}
