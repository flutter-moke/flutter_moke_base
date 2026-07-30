import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo060 extends StatelessWidget {
  const Demo060({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '060',
      title: 'Text 与 RichText',
      description:
          'Text 用于普通文本，RichText 通过 TextSpan 实现多样化样式。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Headline Large',
              style: theme.textTheme.headlineLarge),
          const SizedBox(height: 4),
          Text('Title Medium — 正文样式示例',
              style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text('Body Text Normal',
              style: theme.textTheme.bodyLarge),
          const SizedBox(height: 4),
          Text('Label Small (caption)',
              style: theme.textTheme.labelSmall),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Text('RichText 示例：',
              style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyLarge,
              children: [
                const TextSpan(text: '普通文字 '),
                TextSpan(
                  text: '加粗',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' 和 '),
                TextSpan(
                  text: '彩色',
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
                const TextSpan(text: ' 以及 '),
                TextSpan(
                  text: '斜体',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：Text 渲染链路',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _renderStage(context, 'Widget 层', 'Text', '声明式描述\n样式+内容', Colors.blue),
                _renderArrow(context),
                _renderStage(context, 'RenderObject 层', 'RichText', '创建渲染对象\n布局测量', Colors.indigo),
                _renderArrow(context),
                _renderStage(context, '布局计算', 'TextPainter', '文本排版\n换行计算', Colors.deepPurple),
                _renderArrow(context),
                _renderStage(context, 'Canvas 绘制', 'ParagraphBuilder', '生成绘制指令\n渲染到屏幕', Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderStage(BuildContext context, String layer, String widget, String desc, Color color) {
    final theme = Theme.of(context);
    return Container(
      width: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(layer,
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: color)),
          ),
          const SizedBox(height: 4),
          Text(widget,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface)),
          const SizedBox(height: 2),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _renderArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_forward, size: 16,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)),
          Icon(Icons.arrow_downward, size: 10,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)),
        ],
      ),
    );
  }
}
