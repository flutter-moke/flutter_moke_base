import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo041 extends StatefulWidget {
  const Demo041({super.key});
  @override
  State<Demo041> createState() => _Demo041State();
}

class _Demo041State extends State<Demo041> {
  bool? _checked = false;
  bool? _tristate;

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '041',
      title: 'Checkbox 复选框',
      description: '普通复选框与三态复选框演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('普通复选框：', style: TextStyle(fontWeight: FontWeight.w600)),
          CheckboxListTile(
            title: Text('选中状态: $_checked'),
            value: _checked,
            onChanged: (v) => setState(() => _checked = v),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 4),
          CheckboxListTile(
            title: const Text('选项二 (已禁用)'),
            value: false,
            onChanged: null,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 16),

          const Text('三态复选框 (点击循环切换)：', style: TextStyle(fontWeight: FontWeight.w600)),
          CheckboxListTile(
            title: Text('三态值: ${_tristate == null ? "indeterminate" : _tristate.toString()}'),
            tristate: true,
            value: _tristate,
            onChanged: (v) => setState(() => _tristate = v),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            subtitle: const Text('点击多次观察状态变化'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: () => setState(() => _tristate = null),
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('重置为 indeterminate'),
          ),
          // ── 架构图：Checkbox 渲染层 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：Checkbox 渲染层',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _CheckboxLayers(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _CheckboxLayers extends StatelessWidget {
  const _CheckboxLayers();

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
              // Stacked layers visualization
              SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        // Layer 1: fillColor (bottom)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: cs.primary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: cs.primary.withValues(alpha: 0.3)),
                            ),
                          ),
                        ),
                        // Layer 2: side/shape
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                          ),
                        ),
                        // Layer 3: checkColor
                        const Center(
                          child: Icon(Icons.check, size: 44, color: Colors.green),
                        ),
                        // Layer 4: overlayColor (top)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: cs.primary.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Labels
              Flexible(fit: FlexFit.loose, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _layerLabel(cs, 'overlayColor', '水波纹色', Colors.purple),
                    _layerLabel(cs, 'checkColor', '勾选颜色', Colors.green),
                    _layerLabel(cs, 'side / shape', '边框与形状', Colors.grey),
                    _layerLabel(cs, 'fillColor', '背景填充色', cs.primary),
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
                Icon(Icons.layers, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Text('Stack 从底到顶叠加：fillColor → side/shape → checkColor → overlayColor',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _layerLabel(ColorScheme cs, String param, String desc, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(param,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: color)),
          const SizedBox(width: 6),
          Text(desc, style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}
