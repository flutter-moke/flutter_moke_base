import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo013 extends StatefulWidget {
  const Demo013({super.key});
  @override
  State<Demo013> createState() => _Demo013State();
}

class _Demo013State extends State<Demo013> {
  double _padding = 12;
  double _margin = 8;
  double _borderRadius = 8;
  Color _color = Colors.blue;

  static const List<Color> _colors = [Colors.red, Colors.blue, Colors.green, Colors.amber, Colors.purple];
  static const _colorNames = ['红色', '蓝色', '绿色', '琥珀', '紫色'];

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '013',
      title: 'Container 万能容器',
      description: '交互式 Container 属性编辑演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Preview ──
          Center(
            child: Container(
              padding: EdgeInsets.all(_padding),
              margin: EdgeInsets.all(_margin),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              child: const Text(
                'Container',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── Controls ──
          Text(
            'Padding: ${_padding.toInt()} px    '
            'Margin: ${_margin.toInt()} px    '
            'Radius: ${_borderRadius.toInt()} px',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),

          Slider(
            value: _padding,
            min: 0,
            max: 30,
            divisions: 30,
            label: 'Padding ${_padding.toInt()}',
            onChanged: (v) => setState(() => _padding = v),
          ),
          Slider(
            value: _margin,
            min: 0,
            max: 30,
            divisions: 30,
            label: 'Margin ${_margin.toInt()}',
            onChanged: (v) => setState(() => _margin = v),
          ),
          Slider(
            value: _borderRadius,
            min: 0,
            max: 30,
            divisions: 30,
            label: 'Radius ${_borderRadius.toInt()}',
            onChanged: (v) => setState(() => _borderRadius = v),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Text('背景色: '),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _colorNames[_colors.indexOf(_color)],
                items: List.generate(
                  _colorNames.length,
                  (i) => DropdownMenuItem(
                    value: _colorNames[i],
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: _colors[i],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(_colorNames[i]),
                      ],
                    ),
                  ),
                ),
                onChanged: (v) {
                  if (v != null) {
                    setState(() => _color = _colors[_colorNames.indexOf(v)]);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Widget 树对比', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Container', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blue.shade700)),
                    const SizedBox(height: 8),
                    _TreeBox(name: 'Container', color: Colors.blue.shade50, depth: 0),
                    _TreeArrow(),
                    _TreeBox(name: 'ColoredBox', color: Colors.blue.shade100, depth: 1),
                    _TreeArrow(),
                    _TreeBox(name: 'Padding', color: Colors.blue.shade200, depth: 2),
                    _TreeArrow(),
                    _TreeBox(name: 'Text', color: Colors.blue.shade300, depth: 3),
                    const SizedBox(height: 8),
                    Text('4 层包装', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    Text('轻量组件', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green.shade700)),
                    const SizedBox(height: 8),
                    _TreeBox(name: 'Padding', color: Colors.green.shade100, depth: 0),
                    _TreeArrow(),
                    _TreeBox(name: 'ColoredBox', color: Colors.green.shade200, depth: 1),
                    _TreeArrow(),
                    _TreeBox(name: 'Text', color: Colors.green.shade300, depth: 2),
                    const SizedBox(height: 8),
                    Text('3 层包装', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Text('Container 自动插入 3 层包装', style: TextStyle(fontSize: 11, color: Colors.amber.shade800, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

class _TreeBox extends StatelessWidget {
  final String name;
  final Color color;
  final int depth;

  const _TreeBox({required this.name, required this.color, required this.depth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 12.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.withValues(alpha: 0.6)),
        ),
        child: Text(
          name,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _TreeArrow extends StatelessWidget {
  const _TreeArrow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Icon(Icons.arrow_downward, size: 14, color: Colors.grey),
    );
  }
}
