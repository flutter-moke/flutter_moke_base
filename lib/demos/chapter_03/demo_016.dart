import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo016 extends StatefulWidget {
  const Demo016({super.key});
  @override
  State<Demo016> createState() => _Demo016State();
}

class _Demo016State extends State<Demo016> {
  double _flex1 = 1;
  double _flex2 = 2;
  double _flex3 = 1;
  bool _useExpanded = true;

  @override
  Widget build(BuildContext context) {
    Widget buildItem(double flex, Color color, String label) {
      final container = Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );

      if (_useExpanded) {
        return Expanded(flex: flex.toInt(), child: container);
      }
      return Flexible(flex: flex.toInt(), child: container);
    }

    return DemoFrame(
      articleId: '016',
      title: 'Expanded 与 Flexible',
      description: '灵活比例分配交互演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Preview ──
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                buildItem(_flex1, Colors.red, '${_flex1.toInt()}'),
                buildItem(_flex2, Colors.green, '${_flex2.toInt()}'),
                buildItem(_flex3, Colors.blue, '${_flex3.toInt()}'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Toggle ──
          Row(
            children: [
              const Text('Expanded'),
              const SizedBox(width: 8),
              Switch(
                value: _useExpanded,
                onChanged: (v) => setState(() => _useExpanded = v),
              ),
              const SizedBox(width: 8),
              const Text('Flexible'),
            ],
          ),
          const SizedBox(height: 16),

          // ── Sliders ──
          Text('容器1 (红色) flex: ${_flex1.toInt()}',
              style: Theme.of(context).textTheme.bodyMedium),
          Slider(
            value: _flex1,
            min: 1,
            max: 5,
            divisions: 4,
            label: '${_flex1.toInt()}',
            onChanged: (v) => setState(() => _flex1 = v),
          ),

          Text('容器2 (绿色) flex: ${_flex2.toInt()}',
              style: Theme.of(context).textTheme.bodyMedium),
          Slider(
            value: _flex2,
            min: 1,
            max: 5,
            divisions: 4,
            label: '${_flex2.toInt()}',
            onChanged: (v) => setState(() => _flex2 = v),
          ),

          Text('容器3 (蓝色) flex: ${_flex3.toInt()}',
              style: Theme.of(context).textTheme.bodyMedium),
          Slider(
            value: _flex3,
            min: 1,
            max: 5,
            divisions: 4,
            label: '${_flex3.toInt()}',
            onChanged: (v) => setState(() => _flex3 = v),
          ),

          const SizedBox(height: 8),
          Text(
            '当前比例: ${_flex1.toInt()} : ${_flex2.toInt()} : ${_flex3.toInt()}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 24),
          Text('flex 系数分配', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('flex:2 (50%)', style: TextStyle(fontSize: 10, color: Colors.red.shade700)),
              Text('flex:1 (25%)', style: TextStyle(fontSize: 10, color: Colors.blue.shade700)),
              Text('flex:1 (25%)', style: TextStyle(fontSize: 10, color: Colors.green.shade700)),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Text('flex:2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.blue,
                        alignment: Alignment.center,
                        child: const Text('flex:1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: const Text('flex:1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text('flex 总和 = 4 (2+1+1)', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }
}
