import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo039 extends StatelessWidget {
  const Demo039({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '039',
      title: 'InputDecoration 输入装饰',
      description: 'InputDecoration 的各种装饰属性展示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Label + Hint:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: '请输入用户名',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Helper text:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              labelText: '密码',
              helperText: '8-16位字母或数字',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Error text:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              labelText: '邮箱',
              errorText: '邮箱格式不正确',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Counter:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              labelText: '简介',
              counterText: '0/100',
              border: OutlineInputBorder(),
            ),
            maxLength: 100,
          ),
          const SizedBox(height: 16),

          const Text('Prefix / Suffix icon:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              labelText: '搜索',
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.clear),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          const Text('Prefix / Suffix text:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const TextField(
            decoration: InputDecoration(
              labelText: '金额',
              prefixText: '¥ ',
              suffixText: '元',
              prefixStyle: TextStyle(fontWeight: FontWeight.w600),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          // ── 架构图：InputDecoration 边框五态 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：InputDecoration 边框五态',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _BorderDecisionTree(),
          const SizedBox(height: 24),
          const Text('■ 架构图：InputDecoration 层级',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _InputDecorationLayers(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _BorderDecisionTree extends StatelessWidget {
  const _BorderDecisionTree();

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
          // Root condition
          _conditionBadge(cs, 'enabled', Icons.power_settings_new, Colors.grey),
          _branchSplit(cs),
          // Yes/No branches
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: [
                // No branch
                Flexible(fit: FlexFit.loose, child: _leafBox(cs, 'disabledBorder', Colors.grey, false, false, false),
                ),
                const SizedBox(width: 16),
                // Yes branch
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      _conditionBadge(cs, 'focused', Icons.center_focus_strong, Colors.blue),
                      _branchSplit(cs),
                      Row(
                        children: [
                          // Yes → focused
                          Flexible(fit: FlexFit.loose, child: Column(
                              children: [
                                _leafBox(cs, 'focusedBorder', Colors.blue, true, true, false),
                                const SizedBox(height: 4),
                                _conditionBadge(cs, 'errorText', Icons.error_outline, Colors.red),
                                _branchSplit(cs),
                                _leafBox(cs, 'focusedErrorBorder', Colors.deepOrange, true, true, true),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // No → errorText check
                          Flexible(fit: FlexFit.loose, child: Column(
                              children: [
                                _conditionBadge(cs, 'errorText', Icons.error_outline, Colors.red),
                                _branchSplit(cs),
                                Row(
                                  children: [
                                    Flexible(fit: FlexFit.loose, child: _leafBox(cs, 'errorBorder', Colors.red, true, false, true),
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(fit: FlexFit.loose, child: _leafBox(cs, 'enabledBorder', Colors.green, true, false, false),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _conditionBadge(ColorScheme cs, String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }

  Widget _branchSplit(ColorScheme cs) {
    return SizedBox(
      height: 16,
      child: Center(child: Icon(Icons.arrow_downward, size: 12, color: cs.outlineVariant)),
    );
  }

  Widget _leafBox(ColorScheme cs, String label, Color color, bool enabled, bool focused, bool error) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Column(
        children: [
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: color)),
          const SizedBox(height: 2),
          Text('en:${enabled?'✓':'✗'} fo:${focused?'✓':'✗'} er:${error?'✓':'✗'}',
              style: TextStyle(fontSize: 8, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _InputDecorationLayers extends StatelessWidget {
  const _InputDecorationLayers();

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
          _layerRow(cs, 'helperText', '辅助说明文字', Colors.blue, Icons.info_outline),
          _layerArrow(cs),
          _layerRow(cs, 'labelText', '标签文本', Colors.indigo, Icons.label_outline),
          _layerArrow(cs),
          // Input area: prefix + input + suffix
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.teal.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                _miniLabel(cs, 'prefixText', Colors.teal),
                const Flexible(fit: FlexFit.loose, child: Center(
                    child: Text('输入区域',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.teal)),
                  ),
                ),
                _miniLabel(cs, 'suffixText', Colors.teal),
              ],
            ),
          ),
          _layerArrow(cs),
          _layerRow(cs, 'counterText', '计数字样', Colors.orange, Icons.numbers),
          _layerArrow(cs),
          _layerRow(cs, 'errorText', '错误提示', Colors.red, Icons.error_outline),
        ],
      ),
    );
  }

  Widget _layerRow(ColorScheme cs, String param, String desc, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(param,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: color)),
          const SizedBox(width: 8),
          Text(desc, style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('InputDecoration',
                style: TextStyle(fontSize: 8, color: color)),
          ),
        ],
      ),
    );
  }

  Widget _miniLabel(ColorScheme cs, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label,
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: color)),
    );
  }

  Widget _layerArrow(ColorScheme cs) {
    return const SizedBox(
      height: 14,
      child: Center(child: Icon(Icons.arrow_downward, size: 10, color: Colors.grey)),
    );
  }
}
