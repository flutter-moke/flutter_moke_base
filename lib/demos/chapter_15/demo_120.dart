import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo120 extends StatefulWidget {
  const Demo120({super.key});
  @override
  State<Demo120> createState() => _Demo120State();
}

class _Demo120State extends State<Demo120> {
  final List<_TodoItem> _todos = [
    _TodoItem(title: '学习 Flutter 基础组件', done: true),
    _TodoItem(title: '完成动画系统章节', done: true),
    _TodoItem(title: '练习状态管理', done: false),
    _TodoItem(title: '编写单元测试', done: false),
    _TodoItem(title: '打包发布应用', done: false),
  ];

  void _toggle(int index) {
    setState(() {
      _todos[index].done = !_todos[index].done;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final doneCount = _todos.where((t) => t.done).length;

    return DemoFrame(
      articleId: '120',
      title: '待办清单 App',
      description: '基于 StatefulWidget 的简单 Todo 列表',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: _todos.isEmpty ? 0 : doneCount / _todos.length,
          ),
          const SizedBox(height: 4),
          Text(
            '$doneCount / ${_todos.length} 已完成',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          ..._todos.asMap().entries.map(
            (entry) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: CheckboxListTile(
                value: entry.value.done,
                onChanged: (_) => _toggle(entry.key),
                title: Text(
                  entry.value.title,
                  style: TextStyle(
                    decoration: entry.value.done
                        ? TextDecoration.lineThrough
                        : null,
                    color: entry.value.done
                        ? theme.colorScheme.onSurfaceVariant
                        : theme.colorScheme.onSurface,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 待办 App 三层架构',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _ArchLayer(
                  label: 'UI 层（Widget 树）',
                  color: theme.colorScheme.primary,
                  theme: theme,
                ),
                const SizedBox(height: 4),
                Icon(Icons.arrow_downward, size: 14, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 4),
                _ArchLayer(
                  label: '状态层（Provider / ChangeNotifier）',
                  color: theme.colorScheme.secondary,
                  theme: theme,
                ),
                const SizedBox(height: 4),
                Icon(Icons.arrow_downward, size: 14, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 4),
                _ArchLayer(
                  label: '数据层（SharedPrefs / File）',
                  color: theme.colorScheme.tertiary,
                  theme: theme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArchLayer extends StatelessWidget {
  const _ArchLayer({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: color)),
    );
  }
}

class _TodoItem {
  _TodoItem({required this.title, this.done = false});
  final String title;
  bool done;
}
