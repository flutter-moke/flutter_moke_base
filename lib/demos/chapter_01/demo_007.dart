import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo007 extends StatelessWidget {
  const Demo007({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '007',
      title: 'Flutter 项目结构详解',
      description: 'Flutter 项目目录结构可视化',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Root folder
          _TreeNode(
            icon: Icons.folder,
            iconColor: Colors.amber,
            name: 'my_app/',
            bold: true,
            theme: theme,
          ),
          _TreeIndent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // android
                _TreeNode(
                  icon: Icons.folder,
                  iconColor: Colors.amber,
                  name: 'android/',
                  theme: theme,
                ),
                // ios
                _TreeNode(
                  icon: Icons.folder,
                  iconColor: Colors.amber,
                  name: 'ios/',
                  theme: theme,
                ),
                // lib (highlighted)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 24, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _TreeNode(
                    icon: Icons.folder,
                    iconColor: Colors.amber,
                    name: 'lib/',
                    theme: theme,
                  ),
                ),
                _TreeIndent(
                  child: _TreeNode(
                    icon: Icons.insert_drive_file,
                    iconColor: Colors.blue,
                    name: 'main.dart',
                    theme: theme,
                  ),
                ),
                // test
                _TreeNode(
                  icon: Icons.folder,
                  iconColor: Colors.amber,
                  name: 'test/',
                  theme: theme,
                ),
                _TreeIndent(
                  child: _TreeNode(
                    icon: Icons.insert_drive_file,
                    iconColor: Colors.blue,
                    name: 'widget_test.dart',
                    theme: theme,
                  ),
                ),
                // pubspec.yaml (highlighted)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 24, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _TreeNode(
                    icon: Icons.insert_drive_file,
                    iconColor: Colors.blue,
                    name: 'pubspec.yaml',
                    theme: theme,
                  ),
                ),
                // web
                _TreeNode(
                  icon: Icons.folder,
                  iconColor: Colors.amber,
                  name: 'web/',
                  theme: theme,
                ),
                // README
                _TreeNode(
                  icon: Icons.insert_drive_file,
                  iconColor: Colors.blue,
                  name: 'README.md',
                  theme: theme,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Legend card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '目录说明',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _LegendItem(
                    color: Colors.amber,
                    label: 'android/',
                    desc: 'Android 平台配置与原生代码',
                    theme: theme,
                  ),
                  _LegendItem(
                    color: Colors.amber,
                    label: 'ios/',
                    desc: 'iOS 平台配置与原生代码',
                    theme: theme,
                  ),
                  _LegendItem(
                    color: Colors.amber,
                    label: 'lib/',
                    desc: 'Dart 源码目录（主要开发目录）',
                    theme: theme,
                  ),
                  _LegendItem(
                    color: Colors.blue,
                    label: 'main.dart',
                    desc: '应用入口文件',
                    theme: theme,
                  ),
                  _LegendItem(
                    color: Colors.blue,
                    label: 'pubspec.yaml',
                    desc: '项目配置文件（依赖、资源等）',
                    theme: theme,
                  ),
                  _LegendItem(
                    color: Colors.amber,
                    label: 'test/',
                    desc: '测试代码目录',
                    theme: theme,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('项目目录树（颜色标注）', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          // Color-coded tree
          _TreeNode(icon: Icons.folder, iconColor: Colors.grey.shade400, name: 'my_app/', bold: true, theme: theme),
          _TreeIndent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TreeNode(icon: Icons.folder, iconColor: Colors.grey.shade400, name: 'android/', theme: theme),
                _TreeNode(icon: Icons.folder, iconColor: Colors.grey.shade400, name: 'ios/', theme: theme),
                _TreeNode(icon: Icons.folder, iconColor: Colors.blue, name: 'lib/', theme: theme),
                _TreeIndent(
                  child: _TreeNode(icon: Icons.insert_drive_file, iconColor: Colors.blue.shade300, name: 'main.dart', theme: theme),
                ),
                _TreeNode(icon: Icons.folder, iconColor: Colors.grey.shade400, name: 'test/', theme: theme),
                _TreeNode(icon: Icons.insert_drive_file, iconColor: Colors.green, name: 'pubspec.yaml', theme: theme),
                _TreeNode(icon: Icons.folder, iconColor: Colors.grey.shade400, name: 'web/', theme: theme),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _ColorDot(Colors.blue, 'lib/'),
              const SizedBox(width: 12),
              _ColorDot(Colors.grey.shade400, 'android/ios/'),
              const SizedBox(width: 12),
              _ColorDot(Colors.green, 'pubspec.yaml'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  final Color color;
  final String label;

  const _ColorDot(this.color, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 10, fontFamily: 'monospace', fontFamilyFallback: ['Courier', 'Menlo'])),
      ],
    );
  }
}

class _TreeNode extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String name;
  final bool bold;
  final ThemeData theme;

  const _TreeNode({
    required this.icon,
    required this.iconColor,
    required this.name,
    this.bold = false,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'monospace',
              fontFamilyFallback: ['Courier', 'Menlo'],
              fontSize: 13,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _TreeIndent extends StatelessWidget {
  final Widget child;

  const _TreeIndent({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: child,
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String desc;
  final ThemeData theme;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.desc,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(Icons.folder, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              desc,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
