import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo037 extends StatefulWidget {
  const Demo037({super.key});
  @override
  State<Demo037> createState() => _Demo037State();
}

class _Demo037State extends State<Demo037> {
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _showError = false;

  @override
  void dispose() {
    _textController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '037',
      title: 'TextField 文本输入框',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Outlined variant
          const Text('Outlined (default):', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: '请输入文本',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Filled variant
          const Text('Filled:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: '请输入文本',
              filled: true,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // With leading icon
          const Text('With icon:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: '搜索...',
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // Error state
          const Text('Error state:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: '必填项',
              errorText: _showError ? '此字段不能为空' : null,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          FilledButton.tonalIcon(
            onPressed: () {
              setState(() {
                _showError = _textController.text.trim().isEmpty;
              });
            },
            icon: const Icon(Icons.check, size: 18),
            label: const Text('验证'),
          ),
          const SizedBox(height: 16),

          // Password with obscure toggle
          const Text('Password:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: '输入密码',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
          ),
          // ── 架构图：TextField 参数脑图 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：TextField 参数脑图',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _TextFieldMindMap(),
          const SizedBox(height: 24),
          const Text('■ 架构图：TextField 层级结构',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _TextFieldHierarchy(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _MindMapBranch {
  final String title;
  final List<String> items;
  final Color color;
  const _MindMapBranch(this.title, this.items, this.color);
}

class _TextFieldMindMap extends StatelessWidget {
  const _TextFieldMindMap();

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
          _centerBadge(cs),
          const SizedBox(height: 20),
          _branchRow(cs, const [
            _MindMapBranch('控制器与数据流', ['controller', 'TextEditingController'], Colors.blue),
            _MindMapBranch('光标与选择', ['cursorColor', 'showCursor'], Colors.teal),
            _MindMapBranch('键盘与输入法', ['keyboardType', 'textInputAction'], Colors.indigo),
            _MindMapBranch('输入约束', ['maxLength', 'inputFormatters'], Colors.orange),
          ]),
          const SizedBox(height: 8),
          _branchRow(cs, const [
            _MindMapBranch('密码与隐私', ['obscureText', 'obscuringCharacter'], Colors.purple),
            _MindMapBranch('多行与滚动', ['maxLines', 'scrollPhysics'], Colors.pink),
            _MindMapBranch('自动填充', ['autofillHints', 'enableIMEPersonalizedLearning'], Colors.brown),
          ]),
        ],
      ),
    );
  }

  Widget _centerBadge(ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(color: cs.primary.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Text('TextField',
          style: TextStyle(
              color: cs.onPrimary, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1)),
    );
  }

  Widget _branchRow(ColorScheme cs, List<_MindMapBranch> branches) {
    return Row(
      children: branches.map((b) {
        return Flexible(fit: FlexFit.loose, child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: b.color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: b.color.withValues(alpha: 0.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: b.color)),
                const SizedBox(height: 3),
                ...b.items.map((item) => Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Row(
                        children: [
                          Text('• ', style: TextStyle(fontSize: 10, color: b.color)),
                          Flexible(fit: FlexFit.loose, child: Text(item,
                                style: TextStyle(fontSize: 10, color: cs.onSurfaceVariant)),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _TextFieldHierarchy extends StatelessWidget {
  const _TextFieldHierarchy();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          _layer(cs, 'TextField / TextFormField', '便捷 API 层', cs.primary, 0),
          _connector(cs),
          _layer(cs, 'InputDecorator', '边框、标签、装饰渲染', cs.secondary, 32),
          _connector(cs),
          _layer(cs, 'EditableText', '文本输入、光标处理', cs.tertiary, 64),
        ],
      ),
    );
  }

  Widget _layer(ColorScheme cs, String name, String desc, Color color, double indent) {
    return Padding(
      padding: EdgeInsets.only(left: indent),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.35), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 3, height: 28, color: color, margin: const EdgeInsets.only(right: 12)),
            Flexible(fit: FlexFit.loose, child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
                  const SizedBox(height: 2),
                  Text(desc, style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, size: 18, color: color.withValues(alpha: 0.4)),
          ],
        ),
      ),
    );
  }

  Widget _connector(ColorScheme cs) {
    return const SizedBox(
      height: 16,
      child: Center(child: Icon(Icons.arrow_downward, size: 12, color: Colors.grey)),
    );
  }
}
