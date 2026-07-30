import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo125 extends StatelessWidget {
  const Demo125({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '125',
      title: 'Flutter 性能优化',
      description: '性能优化 Checklist，点击查看详情',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '以下优化措施可显著提升 Flutter 应用的性能表现。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          _OptimizationTile(
            icon: Icons.code,
            title: 'const 构造函数',
            subtitle: '尽可能将无状态组件标记为 const，减少重建开销',
            details: [
              'Widget 构造函数前加 const 关键字',
              '避免在 build 方法中创建新对象',
              '使用 const 修饰的 TextStyle、EdgeInsets 等',
            ],
            theme: theme,
          ),
          _OptimizationTile(
            icon: Icons.border_clear,
            title: 'RepaintBoundary',
            subtitle: '将不需要频繁重绘的组件隔离到单独的图层',
            details: [
              '包裹 ListView 中的列表项',
              '包裹动画区域避免全局重绘',
              '配合 RepaintBoundary 的 child 使用',
            ],
            theme: theme,
          ),
          _OptimizationTile(
            icon: Icons.view_list,
            title: 'ListView.builder',
            subtitle: '使用 Builder 构造函数按需构建列表项',
            details: [
              '避免一次性构建所有列表项',
              'ListView.builder 只构建可见项',
              '对长列表使用 itemExtent 固定高度',
            ],
            theme: theme,
          ),
          _OptimizationTile(
            icon: Icons.image,
            title: '图片缓存',
            subtitle: '合理配置图片缓存策略，减少重复加载',
            details: [
              '使用 cached_network_image 缓存网络图片',
              '设置合适的缓存宽高：cacheWidth / cacheHeight',
              '图片资源使用合适的分辨率',
            ],
            theme: theme,
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 性能优化六步闭环',
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
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child:  _StepBox(step: '1', label: 'Profiling\n(数据采集)', color: theme.colorScheme.primary, theme: theme)),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    Flexible(fit: FlexFit.loose, child:  _StepBox(step: '2', label: '诊断\n(定位瓶颈)', color: theme.colorScheme.secondary, theme: theme)),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    Flexible(fit: FlexFit.loose, child:  _StepBox(step: '3', label: '优化\n(实施改进)', color: Colors.orange, theme: theme)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child:  _StepBox(step: '6', label: '监控\n(持续跟踪)', color: Colors.purple, theme: theme)),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_back, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    Flexible(fit: FlexFit.loose, child:  _StepBox(step: '5', label: '验证\n(效果确认)', color: Colors.teal, theme: theme)),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_back, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    Flexible(fit: FlexFit.loose, child:  _StepBox(step: '4', label: 'Benchmark\n(量化对比)', color: Colors.brown, theme: theme)),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text('闭环迭代，持续优化',
                      style: TextStyle(fontSize: 10, color: theme.colorScheme.onSurfaceVariant, fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepBox extends StatelessWidget {
  const _StepBox({required this.step, required this.label, required this.color, required this.theme});
  final String step;
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: color)),
    );
  }
}

class _OptimizationTile extends StatelessWidget {
  const _OptimizationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.theme,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> details;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details.map((d) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(color: colorScheme.primary),
                      ),
                      Flexible(fit: FlexFit.loose, child: Text(
                          d,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
