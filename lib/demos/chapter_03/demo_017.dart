import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo017 extends StatelessWidget {
  const Demo017({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '017',
      title: 'SizedBox / Padding / Align / Center',
      description: '4种基础布局组件快速演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── SizedBox ──
          _sectionHeader('SizedBox — 固定尺寸', Icons.crop_square),
          const SizedBox(height: 8),
          SizedBox(
            width: 100,
            height: 50,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                '100x50',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('固定宽度 100，高度 50', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const Divider(height: 24),

          // ── Padding ──
          _sectionHeader('Padding — 内边距', Icons.space_bar),
          const SizedBox(height: 8),
          Container(
            color: Colors.grey.shade200,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Padding 20px 所有方向', style: TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(height: 4),
          Text('灰色区域展示 padding 效果', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const Divider(height: 24),

          // ── Align ──
          _sectionHeader('Align — 对齐', Icons.align_horizontal_left),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.amber.shade50,
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('bottomRight', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('子组件对齐到右下角', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),

          const Divider(height: 24),

          // ── Center ──
          _sectionHeader('Center — 居中', Icons.center_focus_strong),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.green.shade50,
            child: const Center(
              child: Text('居中显示', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 4),
          Text('子组件自动居中', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          const SizedBox(height: 24),
          Text('Container 树 vs 轻量组件树', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildTreeColumn(
                  title: 'Container 树',
                  layers: [
                    _TreeLayer('Container', Colors.blue.shade50, '布局+绘制'),
                    _TreeLayer('  ├─ ColoredBox', Colors.blue.shade100, '背景色'),
                    _TreeLayer('  ├─ Padding', Colors.blue.shade200, '内边距'),
                    _TreeLayer('  ├─ Align', Colors.blue.shade300, '对齐'),
                    _TreeLayer('  └─ Text', Colors.blue.shade400, '文本'),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTreeColumn(
                  title: '轻量组件树',
                  layers: [
                    _TreeLayer('SizedBox', Colors.green.shade50, '固定尺寸'),
                    _TreeLayer('  ├─ ColoredBox', Colors.green.shade100, '背景色'),
                    _TreeLayer('  ├─ Padding', Colors.green.shade200, '内边距'),
                    _TreeLayer('  ├─ Center', Colors.green.shade300, '居中'),
                    _TreeLayer('  └─ Text', Colors.green.shade400, '文本'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTreeColumn({required String title, required List<_TreeLayer> layers}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: layers.map((l) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: l.color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(l.name, style: TextStyle(fontSize: 12)),
                    const Spacer(),
                    Text(l.purpose, style: TextStyle(fontSize: 9, color: Colors.grey.shade500)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 6),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }
}

class _TreeLayer {
  final String name;
  final Color color;
  final String purpose;

  const _TreeLayer(this.name, this.color, this.purpose);
}
