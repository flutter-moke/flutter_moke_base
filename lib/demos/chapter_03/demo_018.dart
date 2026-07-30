import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo018 extends StatefulWidget {
  const Demo018({super.key});
  @override
  State<Demo018> createState() => _Demo018State();
}

class _Demo018State extends State<Demo018> {
  final List<String> _tags = ['Flutter', 'Dart', '跨平台'];
  int _counter = 4;

  static const _alignments = [
    WrapAlignment.start,
    WrapAlignment.center,
    WrapAlignment.end,
    WrapAlignment.spaceBetween,
    WrapAlignment.spaceAround,
    WrapAlignment.spaceEvenly,
  ];

  WrapAlignment _alignment = WrapAlignment.start;

  void _addTag() {
    setState(() {
      _tags.add('标签 $_counter');
      _counter++;
    });
  }

  void _removeTag(int index) {
    setState(() {
      _tags.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '018',
      title: 'Wrap 与 Flow 流式布局',
      description: '动态换行的 Chip 列表演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Wrap Preview ──
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: _alignment,
              children: List.generate(
                _tags.length,
                (i) => Chip(
                  label: Text(_tags[i]),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () => _removeTag(i),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── Controls ──
          Row(
            children: [
              FilledButton.icon(
                onPressed: _addTag,
                icon: const Icon(Icons.add),
                label: const Text('添加标签'),
              ),
              const SizedBox(width: 12),
              Text('${_tags.length} 个标签',
                  style: theme.textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 12),

          Text('对齐方式:', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          DropdownButton<WrapAlignment>(
            value: _alignment,
            isExpanded: true,
            items: _alignments.map((v) {
              return DropdownMenuItem(
                value: v,
                child: Text(_alignmentLabel(v)),
              );
            }).toList(),
            onChanged: (v) {
              if (v != null) setState(() => _alignment = v);
            },
          ),
          const SizedBox(height: 8),

          Text(
            '提示: 点击 Chip 上的 × 可删除标签',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text('WrapAlignment 五种模式', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          _AlignmentRow(alignment: WrapAlignment.start, label: 'start'),
          const SizedBox(height: 6),
          _AlignmentRow(alignment: WrapAlignment.center, label: 'center'),
          const SizedBox(height: 6),
          _AlignmentRow(alignment: WrapAlignment.end, label: 'end'),
          const SizedBox(height: 6),
          _AlignmentRow(alignment: WrapAlignment.spaceBetween, label: 'spaceBetween'),
          const SizedBox(height: 6),
          _AlignmentRow(alignment: WrapAlignment.spaceEvenly, label: 'spaceEvenly'),
        ],
      ),
    );
  }

  String _alignmentLabel(WrapAlignment a) {
    switch (a) {
      case WrapAlignment.start:
        return 'start — 起始对齐';
      case WrapAlignment.center:
        return 'center — 居中对齐';
      case WrapAlignment.end:
        return 'end — 末尾对齐';
      case WrapAlignment.spaceBetween:
        return 'spaceBetween — 两端对齐';
      case WrapAlignment.spaceAround:
        return 'spaceAround — 均匀分布（两端半距）';
      case WrapAlignment.spaceEvenly:
        return 'spaceEvenly — 均匀分布（等距）';
    }
  }
}

class _AlignmentRow extends StatelessWidget {
  final WrapAlignment alignment;
  final String label;

  const _AlignmentRow({required this.alignment, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Wrap(
            spacing: 8,
            alignment: alignment,
            children: [
              _MiniChip('Flutter'),
              _MiniChip('Dart'),
              _MiniChip('Widget'),
            ],
          ),
        ),
      ],
    );
  }
}

class _MiniChip extends StatelessWidget {
  final String label;
  const _MiniChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Text(label, style: TextStyle(fontSize: 11, color: Colors.blue.shade700)),
    );
  }
}
