import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo020 extends StatefulWidget {
  const Demo020({super.key});
  @override
  State<Demo020> createState() => _Demo020State();
}

class _Demo020State extends State<Demo020> {
  double _elevation = 4;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '020',
      title: 'Card 卡片组件',
      description: '不同 elevation 级别的卡片效果',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Static elevation examples ──
          Text('固定 elevation 示例', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),

          _cardExample(
            title: 'Elevation 0 (无阴影)',
            content: '扁平卡片，适合无层级场景',
            elevation: 0,
          ),
          const SizedBox(height: 8),

          _cardExample(
            title: 'Elevation 4 (标准)',
            content: '默认的卡片阴影高度',
            elevation: 4,
          ),
          const SizedBox(height: 8),

          _cardExample(
            title: 'Elevation 12 (高凸起)',
            content: '强调卡片层级关系',
            elevation: 12,
          ),

          const Divider(height: 24),

          // ── Interactive ──
          Text('交互式 elevation 调节', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),

          _cardExample(
            title: '可调节卡片',
            content: '拖动下方的滑条改变 elevation',
            elevation: _elevation,
          ),
          const SizedBox(height: 8),

          Text('当前 elevation: ${_elevation.toStringAsFixed(1)}',
              style: theme.textTheme.bodySmall),
          Slider(
            value: _elevation,
            min: 0,
            max: 24,
            divisions: 24,
            label: _elevation.toStringAsFixed(1),
            onChanged: (v) => setState(() => _elevation = v),
          ),
        ],
      ),
    );
  }

  Widget _cardExample({
    required String title,
    required String content,
    required double elevation,
  }) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(content, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
