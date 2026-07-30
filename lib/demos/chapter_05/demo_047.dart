import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo047 extends StatefulWidget {
  const Demo047({super.key});
  @override
  State<Demo047> createState() => _Demo047State();
}

class _Demo047State extends State<Demo047> {
  final _options = [
    'apple', 'banana', 'grape', 'orange', 'strawberry',
    'watermelon', 'kiwi', 'mango', 'peach', 'pear', 'pineapple', 'plum',
  ];
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '047',
      title: 'Autocomplete 自动补全',
      description: 'Autocomplete 自动补全组件演示，输入字母查看建议。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Autocomplete<String>(
            optionsBuilder: (textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return _options.where((option) =>
                option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
            },
            onSelected: (option) => setState(() => _selected = option),
            fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  labelText: '搜索水果',
                  hintText: '输入水果名称...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onSubmitted: (_) => onSubmitted(),
              );
            },
          ),
          const SizedBox(height: 16),
          if (_selected != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 20),
                  const SizedBox(width: 8),
                  Text('已选择: $_selected'),
                ],
              ),
            ),
          // ── 架构图：Autocomplete 协作 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：Autocomplete 协作',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _AutocompleteFlow(),
          const SizedBox(height: 24),
          const Text('■ 架构图：自动补全展开方向',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _AutocompleteDirection(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _AutocompleteFlow extends StatelessWidget {
  const _AutocompleteFlow();

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
          Row(
            children: [
              _flowStep(cs, '用户输入', Icons.keyboard, Colors.blue),
              _flowArrow(cs),
              _flowStep(cs, 'TextField', Icons.text_fields, Colors.indigo),
              _flowArrow(cs),
              _flowStep(cs, 'options\nBuilder', Icons.list, Colors.teal),
              _flowArrow(cs),
              _flowStep(cs, 'optionsView\nBuilder', Icons.view_list, Colors.orange),
              _flowArrow(cs),
              _flowStep(cs, 'onSelected', Icons.check_circle, Colors.green),
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
                Icon(Icons.alt_route, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Text('数据流方向：输入 → 过滤 → 展示 → 选择',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _flowStep(ColorScheme cs, String label, IconData icon, Color color) {
    return Flexible(fit: FlexFit.loose, child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(height: 4),
            Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _flowArrow(ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Icon(Icons.arrow_forward, size: 14, color: cs.onSurfaceVariant),
    );
  }
}

class _AutocompleteDirection extends StatelessWidget {
  const _AutocompleteDirection();

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
          Row(
            children: [
              // Diagram 1: page top → downward
              Flexible(fit: FlexFit.loose, child:  _directionDiagram(cs, '页面顶部', '↓ 向下展开', Icons.arrow_downward)),
              const SizedBox(width: 12),
              // Diagram 2: page bottom → upward
              Flexible(fit: FlexFit.loose, child:  _directionDiagram(cs, '页面底部', '↑ 向上展开', Icons.arrow_upward)),
              const SizedBox(width: 12),
              // Diagram 3: page right → left
              Flexible(fit: FlexFit.loose, child:  _directionDiagram(cs, '页面右侧', '← 向左展开', Icons.arrow_back)),
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
                Icon(Icons.lightbulb_outline, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Flexible(fit: FlexFit.loose, child: Text(
                    'Autocomplete 自动根据可用空间选择展开方向，避免溢出屏幕',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _directionDiagram(ColorScheme cs, String position, String action, IconData arrow) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(position, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: cs.onSurfaceVariant)),
          const SizedBox(height: 8),
          // Simple position indicator
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: cs.primary.withValues(alpha: 0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(arrow, size: 16, color: cs.primary),
                Text(action, style: TextStyle(fontSize: 7, color: cs.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
