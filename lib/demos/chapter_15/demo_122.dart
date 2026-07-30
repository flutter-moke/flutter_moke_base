import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo122 extends StatelessWidget {
  const Demo122({super.key});

  static const _solutions = [
    _SolutionCard(
      name: 'setState',
      icon: Icons.toggle_on,
      color: Color(0xFF4CAF50),
      description: 'Flutter 内置的最基础状态管理方式，通过 State.setState 触发 UI 重建。',
      pros: '简单直接，无需引入第三方库',
      cons: '仅限组件内部状态，跨组件共享需要回调传递',
    ),
    _SolutionCard(
      name: 'Provider',
      icon: Icons.account_tree,
      color: Color(0xFF2196F3),
      description: '官方推荐的状态管理方案，基于 InheritedWidget，提供依赖注入。',
      pros: '生态成熟，学习曲线平缓',
      cons: '复杂场景下需要配合 ChangeNotifier',
    ),
    _SolutionCard(
      name: 'Riverpod',
      icon: Icons.water_drop,
      color: Color(0xFF9C27B0),
      description: 'Provider 的升级版，编译安全，支持异步状态和自动释放。',
      pros: '编译安全，无 BuildContext 依赖',
      cons: '概念较多，API 仍在演进',
    ),
    _SolutionCard(
      name: 'Bloc',
      icon: Icons.category,
      color: Color(0xFFE91E63),
      description: '基于事件驱动和流的状态管理，适合复杂业务逻辑的大型应用。',
      pros: '可测试性强，状态变化可追踪',
      cons: '样板代码较多，小型项目过重',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '122',
      title: '状态管理方案对比',
      description: '四种主流状态管理方案的简要对比',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '选择状态管理方案时需考虑项目规模、团队经验和维护成本。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          ..._solutions.map(
            (s) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: s.color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(s.icon, color: s.color, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          s.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      s.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.thumb_up, size: 14, color: Colors.green),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            s.pros,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.green.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.thumb_down, size: 14, color: Colors.red),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            s.cons,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.red.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 状态管理选型决策树',
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
                _TreeRoot(label: '需要状态管理?', theme: theme),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _TreeBranch(label: '仅组件内', color: Colors.green, theme: theme),
                    const SizedBox(width: 12),
                    _TreeBranch(label: '需要共享', color: Colors.orange, theme: theme),
                    const SizedBox(width: 12),
                    _TreeBranch(label: '大型团队', color: theme.colorScheme.error, theme: theme),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child:  _TreeLeaf(label: 'setState\n(低复杂度)', theme: theme)),
                    const SizedBox(width: 8),
                    Flexible(fit: FlexFit.loose, child:  _TreeLeaf(label: 'Riverpod/Provider\n(中复杂度)', theme: theme)),
                    const SizedBox(width: 8),
                    Flexible(fit: FlexFit.loose, child:  _TreeLeaf(label: 'Bloc\n(高复杂度)', theme: theme)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TreeRoot extends StatelessWidget {
  const _TreeRoot({required this.label, required this.theme});
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13,
              color: theme.colorScheme.onPrimaryContainer)),
    );
  }
}

class _TreeBranch extends StatelessWidget {
  const _TreeBranch({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Flexible(fit: FlexFit.loose, child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
      ),
    );
  }
}

class _TreeLeaf extends StatelessWidget {
  const _TreeLeaf({required this.label, required this.theme});
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: theme.colorScheme.onSurfaceVariant)),
    );
  }
}

class _SolutionCard {
  const _SolutionCard({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.pros,
    required this.cons,
  });
  final String name;
  final IconData icon;
  final Color color;
  final String description;
  final String pros;
  final String cons;
}
