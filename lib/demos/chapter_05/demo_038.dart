import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo038 extends StatefulWidget {
  const Demo038({super.key});
  @override
  State<Demo038> createState() => _Demo038State();
}

class _Demo038State extends State<Demo038> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '038',
      title: 'TextFormField 表单输入框',
      description: '使用 Form + TextFormField 进行表单输入与验证。',
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
                    hintText: '请输入姓名',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '姓名不能为空';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: '邮箱',
                    hintText: '请输入邮箱地址',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '邮箱不能为空';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return '请输入有效的邮箱地址';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: '密码',
                    hintText: '密码（至少6位）',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return '密码至少需要6个字符';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: FilledButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('表单验证通过！')),
                        );
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('提交'),
                  ),
                ),
              ],
            ),
          ),
          // ── 架构图：Form 协作时序 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：Form 协作时序',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _FormCollaborationFlow(),
          const SizedBox(height: 24),
          const Text('■ 架构图：TextFormField 架构',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _TextFormFieldArch(),
          const SizedBox(height: 32), // 底部留白
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _FormCollaborationFlow extends StatelessWidget {
  const _FormCollaborationFlow();

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Main flow row
          Row(
            children: [
              _flowBox(cs, '用户点击\n提交', Colors.blue),
              _flowArrow(cs),
              _flowBox(cs, 'FormState\n.validate()', Colors.indigo),
              _flowArrow(cs),
              _flowBox(cs, 'TextFormField\n.validator', Colors.teal),
              _flowArrow(cs),
              _flowBox(cs, '返回值\nnull?', Colors.deepPurple),
            ],
          ),
          const SizedBox(height: 16),
          // Success/failure branches
          Row(
            children: [
              const Spacer(flex: 5),
              _branchBox(cs, 'null → 验证通过 ✓', Colors.green, Icons.check_circle),
              const Spacer(flex: 2),
              _branchBox(cs, '非 null → 显示错误 ✗', Colors.red, Icons.error),
              const Spacer(flex: 5),
            ],
          ),
          const SizedBox(height: 12),
          // Labels for each step
          Row(
            children: const [
              Expanded(child: Center(child: Text('步骤 1', style: TextStyle(fontSize: 10, color: Colors.grey)))),
              SizedBox(width: 8),
              Expanded(child: Center(child: Text('步骤 2', style: TextStyle(fontSize: 10, color: Colors.grey)))),
              SizedBox(width: 8),
              Expanded(child: Center(child: Text('步骤 3', style: TextStyle(fontSize: 10, color: Colors.grey)))),
              SizedBox(width: 8),
              Expanded(child: Center(child: Text('步骤 4', style: TextStyle(fontSize: 10, color: Colors.grey)))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _flowBox(ColorScheme cs, String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: color)),
      ),
    );
  }

  Widget _flowArrow(ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Icon(Icons.arrow_forward, size: 16, color: cs.onSurfaceVariant),
    );
  }

  Widget _branchBox(ColorScheme cs, String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 10, color: color)),
        ],
      ),
    );
  }
}

class _TextFormFieldArch extends StatelessWidget {
  const _TextFormFieldArch();

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
          // Top: FormField
          _archBox(
            cs, 'FormField', '验证状态管理', Colors.indigo, Icons.verified_user, null),
          _archConnector(cs, '继承'),
          // Middle: TextFormField
          _archBox(
            cs, 'TextFormField', '文本输入 + 验证能力', cs.primary, Icons.text_fields, null),
          const SizedBox(height: 16),
          // Bottom row: three components
          Row(
            children: [
              Expanded(child: _archBox(cs, 'validator', '验证回调函数', Colors.teal, null, 0)),
              const SizedBox(width: 8),
              Expanded(child: _archBox(cs, 'onSaved', '保存回调函数', Colors.orange, null, 0)),
              const SizedBox(width: 8),
              Expanded(child: _archBox(cs, 'autovalidate\nMode', '自动验证模式', Colors.purple, null, 0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _archBox(
      ColorScheme cs, String title, String subtitle, Color color, IconData? icon, double? leftMargin) {
    return Padding(
      padding: EdgeInsets.only(left: leftMargin ?? 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.35), width: 1.5),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
            ],
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13, color: color)),
                  Text(subtitle,
                      style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _archConnector(ColorScheme cs, String label) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          const SizedBox(width: 32),
          Column(
            children: [
              Container(height: 8, width: 1, color: cs.outlineVariant),
              Icon(Icons.arrow_downward, size: 12, color: cs.outlineVariant),
            ],
          ),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 10, color: cs.outlineVariant)),
        ],
      ),
    );
  }
}
