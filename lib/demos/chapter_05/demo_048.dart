import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo048 extends StatelessWidget {
  const Demo048({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '048',
      title: 'SelectableText 可选文本',
      description: 'SelectableText（可选）与 Text（不可选）的对比演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.error.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Text (不可选中):', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const Text('这段文字无法被选中复制。长按不会有任何反应。'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('SelectableText (可选中复制):', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const SelectableText(
                  '这段文字可以被选中复制。长按或双击可以弹出选择菜单。',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('多段落可选文本:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const SelectableText(
            '第一段可选文字。\n\n'
            '第二段可选文字，可以跨段落选择。\n\n'
            '第三段可选文字。',
          ),
          const SizedBox(height: 16),
          const Text('自定义样式:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          SelectableText(
            '可以使用不同的 TextStyle 样式',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.blueGrey),
          ),
          // ── 架构图：SelectableText 架构对比 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：SelectableText 架构对比',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _SelectableTextArch(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _SelectableTextArch extends StatelessWidget {
  const _SelectableTextArch();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Text simple path
              Flexible(fit: FlexFit.loose, child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Text',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.blue)),
                    ),
                    _archDownArrow(cs),
                    _compBox(cs, 'RichText', '渲染文本', Colors.blue),
                    const SizedBox(height: 8),
                    _noteBox(cs, '简单路径：\nText → RichText\n不支持选择', Colors.blue),
                  ],
                ),
              ),
              // VS divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 1,
                  height: 160,
                  color: cs.outlineVariant,
                ),
              ),
              // Right: SelectableText complex path
              Flexible(fit: FlexFit.loose, child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.teal.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('SelectableText',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal)),
                    ),
                    _archDownArrow(cs),
                    _compBox(cs, 'EditableText', '文本 + 光标', Colors.teal),
                    _archMiniRow(cs, 'selection', '选择控制', Colors.indigo),
                    _archMiniRow(cs, 'focusNode', '焦点管理', Colors.orange),
                    _archMiniRow(cs, 'cursor', '光标渲染', Colors.purple),
                    const SizedBox(height: 8),
                    _noteBox(cs, '复杂路径：\nSelectableText → EditableText\n支持选择、光标、焦点', Colors.teal),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              children: [
                Icon(Icons.compare_arrows, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Flexible(fit: FlexFit.loose, child: Text(
                    'SelectableText 复用 EditableText 能力，增加 selection / focusNode / cursor 支持',
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

  Widget _compBox(ColorScheme cs, String name, String desc, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.35), width: 1.5),
      ),
      child: Column(
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: color)),
          Text(desc, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _archDownArrow(ColorScheme cs) {
    return const SizedBox(
      height: 20, child: Center(child: Icon(Icons.arrow_downward, size: 14, color: Colors.grey)),
    );
  }

  Widget _archMiniRow(ColorScheme cs, String label, String desc, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Icon(Icons.add, size: 10, color: color),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color)),
            const SizedBox(width: 4),
            Text(desc, style: TextStyle(fontSize: 9, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }

  Widget _noteBox(ColorScheme cs, String text, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: TextStyle(fontSize: 9, color: cs.onSurfaceVariant)),
    );
  }
}
