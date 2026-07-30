import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo008 extends StatefulWidget {
  const Demo008({super.key});

  @override
  State<Demo008> createState() => _Demo008State();
}

class _Demo008State extends State<Demo008> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '008',
      title: 'Widget 核心概念',
      description: 'StatelessWidget 与 StatefulWidget 的对比',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 对比卡片 ──
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(Icons.widgets_outlined,
                            size: 32, color: Colors.blue),
                        const SizedBox(height: 8),
                        Text(
                          'StatelessWidget',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '不可变，构建后不会自动更新',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(Icons.autorenew,
                            size: 32, color: Colors.green),
                        const SizedBox(height: 8),
                        Text(
                          'StatefulWidget',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '可变，通过 setState 更新界面',
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── 计数器示例 ──
          Text('状态更新示例：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 12),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$_counter',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => setState(() => _counter++),
                  icon: const Icon(Icons.touch_app),
                  label: const Text('点击切换计数器'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '提示：此演示组件本身是一个 StatefulWidget，'
            '通过 setState 方法更新计数显示',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text('Widget 不可变性', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('旧树', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                    const SizedBox(height: 8),
                    _NodeBox(name: 'A', color: Colors.blue.shade100),
                    const _DownArrow(),
                    _NodeBox(name: 'B', color: Colors.blue.shade100),
                    const _DownArrow(),
                    _NodeBox(name: 'C', color: Colors.blue.shade100),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text('新树', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700)),
                    const SizedBox(height: 8),
                    _NodeBox(name: 'A', color: Colors.blue.shade100),
                    const _DownArrow(),
                    _NodeBox(name: "B'", color: Colors.red.shade50, borderColor: Colors.red),
                    const _DownArrow(),
                    _NodeBox(name: "C'", color: Colors.red.shade50, borderColor: Colors.red),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Widget 生命周期对比', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('StatelessWidget', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blue.shade700)),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _LifeCircle(label: 'construct', color: Colors.blue),
                    const _LifeArrow(),
                    _LifeCircle(label: 'build', color: Colors.blue),
                    const _LifeArrow(),
                    _LifeCircle(label: 'dispose', color: Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text('StatefulWidget', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.orange.shade700)),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _LifeCircle(label: 'construct', color: Colors.orange),
                    const _LifeArrow(),
                    _LifeCircle(label: 'initState', color: Colors.orange),
                    const _LifeArrow(),
                    _LifeCircle(label: 'build', color: Colors.orange),
                    const _LifeArrow(),
                    _LifeCircle(label: 'setState', color: Colors.orange, optional: true),
                    const _LifeArrow(),
                    _LifeCircle(label: 'didUpdate\nWidget', color: Colors.orange, optional: true),
                    const _LifeArrow(),
                    _LifeCircle(label: 'dispose', color: Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NodeBox extends StatelessWidget {
  final String name;
  final Color color;
  final Color? borderColor;

  const _NodeBox({required this.name, required this.color, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 60),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor ?? Colors.grey.shade300,
          width: borderColor != null ? 2.5 : 1,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DownArrow extends StatelessWidget {
  const _DownArrow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Icon(Icons.arrow_downward, size: 16, color: Colors.grey),
    );
  }
}

class _LifeCircle extends StatelessWidget {
  final String label;
  final Color color;
  final bool optional;

  const _LifeCircle({required this.label, required this.color, this.optional = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: optional ? Colors.white : color.withValues(alpha: 0.15),
            border: Border.all(
              color: optional ? color.withValues(alpha: 0.4) : color,
              width: optional ? 1.5 : 2.5,
            ),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 8, height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 8, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _LifeArrow extends StatelessWidget {
  const _LifeArrow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
    );
  }
}
