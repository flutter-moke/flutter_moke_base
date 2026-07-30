import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo040 extends StatefulWidget {
  const Demo040({super.key});
  @override
  State<Demo040> createState() => _Demo040State();
}

class _Demo040State extends State<Demo040> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _gender;
  bool _agreeToTerms = false;
  String _preference = 'A';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '040',
      title: 'Form 与 FormState',
      description: '包含多种字段类型的完整表单演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '姓名',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty) ? '请输入姓名' : null,
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  initialValue: _gender,
                  decoration: const InputDecoration(
                    labelText: '性别',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.wc),
                  ),
                  items: const [
                    DropdownMenuItem(value: '男', child: Text('男')),
                    DropdownMenuItem(value: '女', child: Text('女')),
                    DropdownMenuItem(value: '其他', child: Text('其他')),
                  ],
                  onChanged: (v) => setState(() => _gender = v),
                  validator: (v) => v == null ? '请选择性别' : null,
                ),
                const SizedBox(height: 16),

                const Text('偏好选择：', style: TextStyle(fontWeight: FontWeight.w600)),
                RadioGroup<String>(
                  groupValue: _preference,
                  onChanged: (v) => setState(() => _preference = v!),
                  child: Row(
                    children: [
                      Radio<String>(value: 'A'),
                      const Text('选项 A'),
                      const SizedBox(width: 16),
                      Radio<String>(value: 'B'),
                      const Text('选项 B'),
                      const SizedBox(width: 16),
                      Radio<String>(value: 'C'),
                      const Text('选项 C'),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                CheckboxListTile(
                  title: const Text('同意条款和条件'),
                  value: _agreeToTerms,
                  onChanged: (v) => setState(() => _agreeToTerms = v!),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 16),

                Center(
                  child: FilledButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (!_agreeToTerms) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('请先同意条款')),
                          );
                          return;
                        }
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('表单提交成功！')),
                        );
                      }
                    },
                    icon: const Icon(Icons.send),
                    label: const Text('提交表单'),
                  ),
                ),
              ],
            ),
          ),
          // ── 架构图：Form 注册时序 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：Form 注册时序',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _FormRegisterSequence(),
          const SizedBox(height: 24),
          const Text('■ 架构图：autovalidateMode 决策',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _AutovalidateDecision(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _FormRegisterSequence extends StatelessWidget {
  const _FormRegisterSequence();

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
          // Object boxes
          Row(
            children: [
              _objectBox(cs, 'Form', Colors.blue),
              const Spacer(),
              _objectBox(cs, 'FormField', Colors.teal),
              const Spacer(),
              _objectBox(cs, 'FormState', Colors.indigo),
            ],
          ),
          const SizedBox(height: 16),
          // Messages
          _messageArrow(cs, 'initState → _register', Colors.blue),
          _messageArrow(cs, 'addListener → 注册验证', Colors.teal),
          _messageArrow(cs, 'validate() → 遍历验证', Colors.indigo),
          _messageArrow(cs, '_unregister → dispose', Colors.red),
          const SizedBox(height: 12),
          // Lifecycle labels
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: const [
                Icon(Icons.sync_alt, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Flexible(fit: FlexFit.loose, child: Text(
                    '生命周期：initState → _register → validate → _unregister → dispose',
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

  Widget _objectBox(ColorScheme cs, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
      ),
      child: Text(label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 13, color: color)),
    );
  }

  Widget _messageArrow(ColorScheme cs, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Icon(Icons.arrow_forward, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(fontSize: 11, color: color)),
          const Spacer(),
        ],
      ),
    );
  }
}

class _AutovalidateDecision extends StatelessWidget {
  const _AutovalidateDecision();

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
          // Header: autovalidateMode
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('autovalidateMode',
                  style: TextStyle(
                      color: cs.onPrimary, fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ),
          const SizedBox(height: 20),
          // 4 branches
          _branchRow(cs, 'always', 'setState 时触发', '实时验证', Colors.blue, Icons.autorenew),
          const SizedBox(height: 10),
          _branchRow(cs, 'onUserInteraction', '用户交互时触发', '输入即验', Colors.teal, Icons.touch_app),
          const SizedBox(height: 10),
          _branchRow(cs, 'onFocusChange', '焦点变化时触发', '离焦验证', Colors.orange, Icons.center_focus_strong),
          const SizedBox(height: 10),
          _branchRow(cs, 'disabled', '不自动验证', '仅手动验证', Colors.grey, Icons.block),
        ],
      ),
    );
  }

  Widget _branchRow(ColorScheme cs, String mode, String trigger, String useCase, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 12),
          Flexible(fit: FlexFit.loose, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mode,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
                const SizedBox(height: 2),
                Text('触发: $trigger   |   场景: $useCase',
                    style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(mode == 'disabled' ? '手动' : '自动',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: color)),
          ),
        ],
      ),
    );
  }
}
