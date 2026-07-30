import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo042 extends StatefulWidget {
  const Demo042({super.key});
  @override
  State<Demo042> createState() => _Demo042State();
}

class _Demo042State extends State<Demo042> {
  String _transport = 'bus';

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '042',
      title: 'Radio 单选按钮',
      description: 'Radio 单选按钮组演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('选择交通工具：', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            children: [
              _buildRadioOption('bus', Icons.directions_bus, '公交'),
              _buildRadioOption('subway', Icons.subway, '地铁'),
              _buildRadioOption('bike', Icons.directions_bike, '自行车'),
              _buildRadioOption('walk', Icons.directions_walk, '步行'),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  _transport == 'bus' ? Icons.directions_bus :
                  _transport == 'subway' ? Icons.subway :
                  _transport == 'bike' ? Icons.directions_bike :
                  Icons.directions_walk,
                ),
                const SizedBox(width: 12),
                Text('已选择: $_transport'),
              ],
            ),
          ),
          // ── 架构图：RadioGroup 架构 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：RadioGroup 架构',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _RadioGroupArch(),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value, IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: _transport,
          onChanged: (v) => setState(() => _transport = v!),
        ),
        Icon(icon, size: 20),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}

// ── Visualization Helpers ──

class _RadioGroupArch extends StatelessWidget {
  const _RadioGroupArch();

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Traditional approach
          Flexible(fit: FlexFit.loose, child: _sideBySide(
              cs, '传统方式', Colors.blue,
              [
                _archItem(cs, 'Radio', 'groupValue', Colors.blue),
                _archItem(cs, 'Radio', 'onChanged', Colors.blue),
                _archItem(cs, 'Radio', 'groupValue', Colors.blue),
                _archItem(cs, 'Radio', 'onChanged', Colors.blue),
              ],
              '每个 Radio 独立传入\ngroupValue / onChanged\n易出错，代码冗余',
            ),
          ),
          // Arrow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
            child: Icon(Icons.arrow_forward, size: 24, color: cs.primary),
          ),
          // RadioGroup approach
          Flexible(fit: FlexFit.loose, child: _sideBySide(
              cs, 'RadioGroup', Colors.teal,
              [
                _archItem(cs, 'RadioGroup', 'groupValue / onChanged', Colors.teal),
                _archItem(cs, '  ├── Radio', '自动获取值', Colors.teal),
                _archItem(cs, '  ├── Radio', '自动获取值', Colors.teal),
                _archItem(cs, '  └── Radio', '自动获取值', Colors.teal),
              ],
              'RadioGroup 统一管理\nInheritedWidget 广播\nRadio 自动获取值',
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideBySide(ColorScheme cs, String title, Color color, List<Widget> items, String note) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
        ),
        const SizedBox(height: 8),
        ...items,
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(note, style: TextStyle(fontSize: 9, color: cs.onSurfaceVariant)),
        ),
      ],
    );
  }

  Widget _archItem(ColorScheme cs, String name, String desc, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Text(name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, color: color)),
            const SizedBox(width: 4),
            Text(desc, style: TextStyle(fontSize: 9, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
