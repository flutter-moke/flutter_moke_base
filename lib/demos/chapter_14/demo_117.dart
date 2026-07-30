import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo117 extends StatefulWidget {
  const Demo117({super.key});
  @override
  State<Demo117> createState() => _Demo117State();
}

class _Demo117State extends State<Demo117> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '117',
      title: '隐式动画系列 AnimatedContainer',
      description: '点击容器触发属性变化，AnimatedContainer 自动过渡',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AnimatedContainer 会在 color、width、height、borderRadius 等属性变化时自动补间。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: _expanded ? 220 : 120,
                height: _expanded ? 220 : 120,
                decoration: BoxDecoration(
                  color: _expanded
                      ? theme.colorScheme.tertiary
                      : theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(_expanded ? 32 : 16),
                  boxShadow: [
                    BoxShadow(
                      color: (_expanded
                              ? theme.colorScheme.tertiary
                              : theme.colorScheme.primary)
                          .withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _expanded ? '展开' : '点击',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '变化属性：color, width, height, borderRadius',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 动画选型决策树',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DecideNode(label: '需要动画?', color: theme.colorScheme.primary, theme: theme),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const SizedBox(width: 60),
                    _DecideBranch(label: '简单', color: Colors.green, theme: theme),
                    const Spacer(),
                    _DecideBranch(label: '复杂', color: theme.colorScheme.error, theme: theme),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child: Column(
                        children: [
                          _DecideNode(label: '隐式动画', color: Colors.green, theme: theme),
                          const SizedBox(height: 4),
                          Text('AnimatedContainer\nAnimatedOpacity',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9, color: theme.colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(fit: FlexFit.loose, child: Column(
                        children: [
                          _DecideNode(label: '显式动画', color: theme.colorScheme.error, theme: theme),
                          const SizedBox(height: 4),
                          Text('AnimationController\n+ AnimatedBuilder',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9, color: theme.colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Flexible(fit: FlexFit.loose, child:  _Tag(label: '需要循环?', theme: theme)),
                      const SizedBox(width: 4),
                      Flexible(fit: FlexFit.loose, child:  _Tag(label: '需要交互控制?', theme: theme)),
                      const SizedBox(width: 4),
                      Flexible(fit: FlexFit.loose, child:  _Tag(label: '需要链式?', theme: theme)),
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
}

class _DecideNode extends StatelessWidget {
  const _DecideNode({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
    );
  }
}

class _DecideBranch extends StatelessWidget {
  const _DecideBranch({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.theme});
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11)),
    );
  }
}
