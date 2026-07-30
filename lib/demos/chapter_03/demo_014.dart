import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo014 extends StatefulWidget {
  const Demo014({super.key});
  @override
  State<Demo014> createState() => _Demo014State();
}

class _Demo014State extends State<Demo014> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  bool _isRow = true;

  static const _mainValues = MainAxisAlignment.values;
  static const _crossValues = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.stretch,
  ];

  @override
  Widget build(BuildContext context) {
    final boxes = [
      Container(width: 40, height: 40, color: Colors.red),
      Container(width: 60, height: 60, color: Colors.green),
      Container(width: 40, height: 80, color: Colors.blue),
    ];

    final preview = Container(
      width: double.infinity,
      height: _isRow ? 120 : 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: _isRow
          ? Row(
              mainAxisAlignment: _mainAxisAlignment,
              crossAxisAlignment: _crossAxisAlignment,
              children: boxes,
            )
          : Column(
              mainAxisAlignment: _mainAxisAlignment,
              crossAxisAlignment: _crossAxisAlignment,
              children: boxes,
            ),
    );

    return DemoFrame(
      articleId: '014',
      title: 'Row 与 Column 线性布局',
      description: 'MainAxisAlignment 与 CrossAxisAlignment 交互选择器',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          preview,
          const SizedBox(height: 16),

          // ── 布局方向切换 ──
          Row(
            children: [
              const Text('布局方向:'),
              const SizedBox(width: 8),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: true, label: Text('Row'), icon: Icon(Icons.horizontal_distribute)),
                  ButtonSegment(value: false, label: Text('Column'), icon: Icon(Icons.vertical_distribute)),
                ],
                selected: {_isRow},
                onSelectionChanged: (v) => setState(() => _isRow = v.first),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── MainAxisAlignment ──
          Text('主轴对齐 (MainAxisAlignment)',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          DropdownButton<MainAxisAlignment>(
            value: _mainAxisAlignment,
            isExpanded: true,
            items: _mainValues.map((v) {
              return DropdownMenuItem(
                value: v,
                child: Text(_mainLabel(v)),
              );
            }).toList(),
            onChanged: (v) {
              if (v != null) setState(() => _mainAxisAlignment = v);
            },
          ),
          const SizedBox(height: 12),

          // ── CrossAxisAlignment ──
          Text('交叉轴对齐 (CrossAxisAlignment)',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          DropdownButton<CrossAxisAlignment>(
            value: _crossAxisAlignment,
            isExpanded: true,
            items: _crossValues.map((v) {
              return DropdownMenuItem(
                value: v,
                child: Text(_crossLabel(v)),
              );
            }).toList(),
            onChanged: (v) {
              if (v != null) setState(() => _crossAxisAlignment = v);
            },
          ),
          const SizedBox(height: 24),
          Text('MainAxisAlignment 六种模式', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          _AlignmentDemo(label: 'start', alignment: MainAxisAlignment.start),
          const SizedBox(height: 6),
          _AlignmentDemo(label: 'center', alignment: MainAxisAlignment.center),
          const SizedBox(height: 6),
          _AlignmentDemo(label: 'end', alignment: MainAxisAlignment.end),
          const SizedBox(height: 6),
          _AlignmentDemo(label: 'spaceBetween', alignment: MainAxisAlignment.spaceBetween),
          const SizedBox(height: 6),
          _AlignmentDemo(label: 'spaceAround', alignment: MainAxisAlignment.spaceAround),
          const SizedBox(height: 6),
          _AlignmentDemo(label: 'spaceEvenly', alignment: MainAxisAlignment.spaceEvenly),
        ],
      ),
    );
  }

  String _mainLabel(MainAxisAlignment v) {
    switch (v) {
      case MainAxisAlignment.start:
        return 'start — 起始对齐';
      case MainAxisAlignment.center:
        return 'center — 居中对齐';
      case MainAxisAlignment.end:
        return 'end — 末尾对齐';
      case MainAxisAlignment.spaceBetween:
        return 'spaceBetween — 两端对齐';
      case MainAxisAlignment.spaceAround:
        return 'spaceAround — 均匀分布（两端半距）';
      case MainAxisAlignment.spaceEvenly:
        return 'spaceEvenly — 均匀分布（等距）';
    }
  }

  String _crossLabel(CrossAxisAlignment v) {
    switch (v) {
      case CrossAxisAlignment.start:
        return 'start — 起始对齐';
      case CrossAxisAlignment.center:
        return 'center — 居中对齐';
      case CrossAxisAlignment.end:
        return 'end — 末尾对齐';
      case CrossAxisAlignment.stretch:
        return 'stretch — 拉伸填充';
      default:
        return v.name;
    }
  }
}

class _AlignmentDemo extends StatelessWidget {
  final String label;
  final MainAxisAlignment alignment;

  const _AlignmentDemo({required this.label, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade200),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: alignment,
            children: [
              Container(width: 18, height: 18, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(2))),
              Container(width: 18, height: 18, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(2))),
              Container(width: 18, height: 18, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(2))),
            ],
          ),
        ),
      ],
    );
  }
}
