import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo009 extends StatefulWidget {
  const Demo009({super.key});

  @override
  State<Demo009> createState() => _Demo009State();
}

class _Demo009State extends State<Demo009> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final modeLabel = _isDark ? '深色模式' : '浅色模式';
    final modeIcon = _isDark ? Icons.dark_mode : Icons.light_mode;

    return DemoFrame(
      articleId: '009',
      title: 'MaterialApp 深度解析',
      description: 'MaterialApp 配置与主题切换演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 当前模式显示 ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(modeIcon, size: 32, color: colorScheme.primary),
                  const SizedBox(width: 12),
                  Text(
                    '当前主题模式：$modeLabel',
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── 主题切换开关 ──
          SwitchListTile(
            title: const Text('深色模式'),
            subtitle: const Text('切换浅色 / 深色主题'),
            value: _isDark,
            onChanged: (v) => setState(() => _isDark = v),
            secondary: Icon(
              _isDark ? Icons.dark_mode : Icons.light_mode,
              color: colorScheme.primary,
            ),
          ),

          // ── 不同模式下的主题色预览 ──
          const SizedBox(height: 8),
          Text('主题色预览：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSwatch(colorScheme.primary, 'Primary'),
              _buildSwatch(colorScheme.secondary, 'Secondary'),
              _buildSwatch(colorScheme.tertiary, 'Tertiary'),
              _buildSwatch(colorScheme.error, 'Error'),
              _buildSwatch(colorScheme.surface, 'Surface'),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '注：此处为概念演示，实际主题切换需在 MaterialApp 中配置 theme 与 darkTheme',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text('Material 3 配色系统', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                // Radiating from center
                Wrap(
                  spacing: 24,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    // Left side swatches
                    Column(
                      children: [
                        _buildSwatch(colorScheme.primary, 'Primary'),
                        const SizedBox(height: 6),
                        _buildSwatch(colorScheme.primaryContainer, 'Primary\nContainer'),
                      ],
                    ),
                    // Center seed
                    Column(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withValues(alpha: 0.4),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text('Seed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                        ),
                        const SizedBox(height: 4),
                        Text('种子色', style: TextStyle(fontSize: 9, color: Colors.grey.shade600)),
                      ],
                    ),
                    // Right side swatches
                    Column(
                      children: [
                        _buildSwatch(colorScheme.secondary, 'Secondary'),
                        const SizedBox(height: 6),
                        _buildSwatch(colorScheme.tertiary, 'Tertiary'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildSwatch(colorScheme.surface, 'Surface'),
                    _buildSwatch(colorScheme.onSurface, 'OnSurface'),
                    _buildSwatch(colorScheme.error, 'Error'),
                    _buildSwatch(colorScheme.onPrimary, 'OnPrimary'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwatch(Color color, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
