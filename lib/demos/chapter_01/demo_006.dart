import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo006 extends StatelessWidget {
  const Demo006({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    const steps = [
      _ProjectStep(
        icon: Icons.terminal,
        title: 'flutter create my_app',
        description: '在终端执行命令，Flutter 会自动生成项目模板',
        color: Colors.teal,
      ),
      _ProjectStep(
        icon: Icons.folder_open,
        title: '打开项目',
        description: '使用 VS Code 或 Android Studio 打开项目目录',
        color: Colors.blue,
      ),
      _ProjectStep(
        icon: Icons.play_arrow,
        title: '运行项目',
        description: '连接设备或启动模拟器，按 F5 运行调试模式',
        color: Colors.orange,
      ),
      _ProjectStep(
        icon: Icons.add_circle_outline,
        title: '看到默认计数器',
        description: 'Flutter 默认模板是一个带计数按钮的演示应用',
        color: Colors.purple,
      ),
    ];

    return DemoFrame(
      articleId: '006',
      title: '创建并运行第一个 Flutter 项目',
      description: '从创建到运行的完整流程展示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Terminal command preview
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    '\$ flutter create my_app',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontFamilyFallback: ['Courier', 'Menlo'],
                      fontSize: 13,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Step indicator
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
              itemBuilder: (context, index) {
                final step = steps[index];
                final isLast = index == steps.length - 1;
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Step connector
                      SizedBox(
                        width: 40,
                        child: Column(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: step.color,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (!isLast)
                              Expanded(
                                child: Container(
                                  width: 2,
                                  color: colorScheme.outlineVariant,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Step content
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Icon(
                                    step.icon,
                                    size: 28,
                                    color: step.color,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          step.title,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          step.description,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color:
                                                colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
      ),
    );
  }
}

class _ProjectStep {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  const _ProjectStep({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
