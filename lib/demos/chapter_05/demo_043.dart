import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo043 extends StatefulWidget {
  const Demo043({super.key});
  @override
  State<Demo043> createState() => _Demo043State();
}

class _Demo043State extends State<Demo043> {
  String _paymentMethod = 'alipay';

  final _methods = [
    {'value': 'alipay', 'title': '支付宝', 'subtitle': '推荐支付宝支付', 'icon': Icons.payment},
    {'value': 'wechat', 'title': '微信支付', 'subtitle': '微信扫码支付', 'icon': Icons.wechat},
    {'value': 'card', 'title': '银行卡', 'subtitle': '储蓄卡/信用卡', 'icon': Icons.credit_card},
    {'value': 'cash', 'title': '现金', 'subtitle': '到店支付', 'icon': Icons.money},
  ];

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '043',
      title: 'RadioListTile 单选列表',
      description: '使用 RadioListTile 构建的单选列表。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('选择支付方式：', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Column(
            children: _methods.map((m) {
              return RadioListTile<String>(
                title: Text(m['title'] as String),
                subtitle: Text(m['subtitle'] as String),
                secondary: Icon(m['icon'] as IconData),
                value: m['value'] as String,
                groupValue: _paymentMethod,
                onChanged: (v) => setState(() => _paymentMethod = v!),
                contentPadding: EdgeInsets.zero,
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Text('已选支付方式: '),
                Text(_paymentMethod, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // ── 架构图：RadioListTile 布局 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：RadioListTile 布局',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _RadioListTileLayout(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _RadioListTileLayout extends StatelessWidget {
  const _RadioListTileLayout();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          // Visual representation
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: cs.outlineVariant),
            ),
            child: Row(
              children: [
                _section(cs, 'leading', Icons.photo, Colors.blue),
                _divider(cs),
                _section(cs, 'Radio', Icons.radio_button_checked, Colors.teal),
                _divider(cs),
                Flexible(fit: FlexFit.loose, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.indigo)),
                      const SizedBox(height: 2),
                      Text('subtitle', style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
                    ],
                  ),
                ),
                _divider(cs),
                _section(cs, 'trailing', Icons.chevron_right, Colors.orange),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Measurement annotations
          Row(
            children: [
              _measure(cs, 'minLeadingWidth', 0, 48, Colors.blue),
              _measure(cs, 'horizontalTitleGap', 64, 80, Colors.teal),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              children: [
                Icon(Icons.straighten, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Text('Row 水平布局：leading → title → subtitle → trailing，Radio 嵌入其中',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(ColorScheme cs, String label, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }

  Widget _divider(ColorScheme cs) {
    return Container(width: 1, height: 32, color: cs.outlineVariant.withValues(alpha: 0.5));
  }

  Widget _measure(ColorScheme cs, String label, double start, double end, Color color) {
    return Flexible(fit: FlexFit.loose, child: Column(
        children: [
          Text('← $label →',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: color)),
          const SizedBox(height: 4),
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color, color]),
            ),
          ),
        ],
      ),
    );
  }
}
