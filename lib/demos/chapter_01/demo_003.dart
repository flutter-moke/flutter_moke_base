import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo003 extends StatefulWidget {
  const Demo003({super.key});

  @override
  State<Demo003> createState() => _Demo003State();
}

class _Demo003State extends State<Demo003> {
  final Map<int, bool> _checked = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const steps = [
      _StepInfo(Icons.download, '下载 Flutter SDK', '从官网获取 Windows 版 Flutter SDK'),
      _StepInfo(Icons.settings, '配置环境变量', '将 Flutter bin 路径添加到系统环境变量 Path'),
      _StepInfo(Icons.android, '安装 Android Studio', '安装 Android Studio 及 Android SDK'),
      _StepInfo(Icons.code, '安装 VS Code', '安装 Visual Studio Code 及 Flutter 插件'),
      _StepInfo(Icons.build, '安装 Windows 工具链', '安装 Visual Studio Build Tools 或 VS 2022'),
      _StepInfo(Icons.checklist, '运行 flutter doctor', '执行 flutter doctor 验证所有依赖'),
    ];

    final completedCount = _checked.length;
    final totalSteps = steps.length;

    return DemoFrame(
      articleId: '003',
      title: 'Windows 开发环境搭建',
      description: '在 Windows 上搭建 Flutter 开发环境的步骤清单',
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
                          color: Colors.lightBlue,
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
            physics: NeverScrollableScrollPhysics(),
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
                      color: isChecked ? Colors.lightBlue : theme.colorScheme.onSurfaceVariant,
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
                    activeColor: Colors.lightBlue,
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
