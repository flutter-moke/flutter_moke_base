/// DemoFrame — 演示组件通用包装
///
/// 每篇文章的交互演示使用此组件包裹，提供一致的文章编号标签、
/// 标题栏和布局框架。
library;

import 'package:flutter/material.dart';

import '../data/chapter_manifest.dart';

/// 演示组件通用包装
class DemoFrame extends StatelessWidget {
  const DemoFrame({
    super.key,
    required this.articleId,
    required this.title,
    this.description,
    required this.child,
  });

  /// 文章三位编号
  final String articleId;

  /// 文章标题
  final String title;

  /// 简短说明（optional）
  final String? description;

  /// 演示内容
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── 文章编号标签 ──
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            '#$articleId',
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // ── 文章标题 ──
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        // ── 描述文字 ──
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(
            description!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],

        // ── 装饰分隔线 ──
        const SizedBox(height: 12),
        Divider(height: 1, color: colorScheme.outlineVariant),
        const SizedBox(height: 16),

        // ── 演示内容 ──
        child,

        // ── 底部留白 ──
        const SizedBox(height: 40),
      ],
    );
  }

  /// 构建"相关文章"跳转按钮
  static Widget relatedArticleButton({
    required BuildContext context,
    required String targetId,
    required String label,
  }) {
    final article = findArticleById(targetId);
    if (article == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: OutlinedButton.icon(
        onPressed: () => Navigator.of(context).pushNamed('/demo/$targetId'),
        icon: const Icon(Icons.arrow_forward, size: 16),
        label: Text('相关：$label'),
      ),
    );
  }

  /// 构建章节占位信息（用于环境搭建等无具体组件的文章）
  static Widget placeholderInfo({
    required BuildContext context,
    required IconData icon,
    required String message,
  }) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
