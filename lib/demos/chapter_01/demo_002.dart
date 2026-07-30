import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo002 extends StatefulWidget {
  const Demo002({super.key});

  @override
  State<Demo002> createState() => _Demo002State();
}

class _Demo002State extends State<Demo002> {
  final Map<int, bool> _checked = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const steps = [
      _StepInfo(Icons.download, '下载 Flutter SDK', '从官网下载最新稳定版 Flutter SDK'),
      _StepInfo(Icons.terminal, '配置 PATH 环境变量', '将 Flutter bin 目录添加到系统 PATH'),
      _StepInfo(Icons.apple, '安装 Xcode', '从 App Store 安装 Xcode（iOS 构建必需）'),
      _StepInfo(Icons.android, '安装 Android Studio', '安装并配置 Android 开发工具链'),
      _StepInfo(Icons.code, '安装 VS Code', '安装 Visual Studio Code 编辑器'),
      _StepInfo(Icons.checklist, '运行 flutter doctor', '验证开发环境配置是否完整'),
    ];

    final completedCount = _checked.length;
    final totalSteps = steps.length;

    return DemoFrame(
      articleId: '002',
      title: 'macOS 开发环境搭建',
      description: '在 macOS 上搭建 Flutter 开发环境的步骤清单',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress indicator
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: CircularProgressIndicator(
                          value: completedCount / totalSteps,
                          strokeWidth: 4,
                        ),
                      ),
                      Text(
                        '$completedCount/$totalSteps',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '搭建进度',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        completedCount == totalSteps
                            ? '全部完成！可以开始开发了'
                            : '完成 ${totalSteps - completedCount} 项即可开始',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Steps checklist
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
              itemBuilder: (context, index) {
                final step = steps[index];
                final isChecked = _checked.containsKey(index);
                return Card(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: CheckboxListTile(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          _checked[index] = true;
                        } else {
                          _checked.remove(index);
                        }
                      });
                    },
                    secondary: Icon(
                      step.icon,
                      color: isChecked
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                    title: Text(
                      step.title,
                      style: TextStyle(
                        fontWeight:
                            isChecked ? FontWeight.w600 : FontWeight.normal,
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: theme.colorScheme.outline,
                      ),
                    ),
                    subtitle: Text(
                      step.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    activeColor: theme.colorScheme.primary,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _StepInfo {
  final IconData icon;
  final String title;
  final String subtitle;
  const _StepInfo(this.icon, this.title, this.subtitle);
}
