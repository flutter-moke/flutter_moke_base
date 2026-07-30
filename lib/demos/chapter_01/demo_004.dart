import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo004 extends StatelessWidget {
  const Demo004({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '004',
      title: 'VS Code 与 Android Studio 配置',
      description: '推荐插件与配置项一览',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // VS Code section
          Text(
            'VS Code 插件',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _PluginCard(
            icon: Icons.flutter_dash,
            iconColor: Colors.blue,
            name: 'Flutter',
            publisher: 'Dart Code',
            description: 'Flutter 官方插件，提供项目创建、设备管理、热重载等核心功能',
          ),
          const SizedBox(height: 6),
          _PluginCard(
            icon: Icons.code,
            iconColor: Colors.teal,
            name: 'Dart',
            publisher: 'Dart Code',
            description: 'Dart 语言支持，提供代码补全、静态分析、调试等功能',
          ),
          const SizedBox(height: 6),
          _PluginCard(
            icon: Icons.palette,
            iconColor: Colors.purple,
            name: 'Material Icon Theme',
            publisher: 'Philipp Kief',
            description: '根据文件类型自动显示 Material Design 风格图标',
          ),
          const SizedBox(height: 6),
          _PluginCard(
            icon: Icons.format_paint,
            iconColor: Colors.orange,
            name: 'Error Lens',
            publisher: 'Alexander',
            description: '在代码行内高亮显示错误和警告信息',
          ),

          const SizedBox(height: 16),

          // Android Studio section
          Text(
            'Android Studio 插件',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _PluginCard(
            icon: Icons.flutter_dash,
            iconColor: Colors.blue,
            name: 'Flutter Plugin',
            publisher: 'JetBrains',
            description: 'Android Studio 的 Flutter 官方支持，含项目向导和 UI 预览',
          ),
          const SizedBox(height: 6),
          _PluginCard(
            icon: Icons.code,
            iconColor: Colors.teal,
            name: 'Dart Plugin',
            publisher: 'JetBrains',
            description: 'Dart 语言支持，与 IntelliJ 平台深度集成',
          ),
          const SizedBox(height: 6),
          _PluginCard(
            icon: Icons.preview,
            iconColor: Colors.indigo,
            name: 'Flutter Widget Preview',
            publisher: 'Flutter Community',
            description: '在 IDE 中实时预览 Flutter Widget 效果',
          ),

          const SizedBox(height: 16),

          // Config tip
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: 18,
                  color: colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '提示：在 VS Code 中按 Ctrl+Shift+P 打开命令面板，输入 "Flutter: New Project" 快速创建新项目。',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                    ),
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

class _PluginCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String name;
  final String publisher;
  final String description;

  const _PluginCard({
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.publisher,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          publisher,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
