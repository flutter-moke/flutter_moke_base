/// ChapterPage — 章节内文章列表
///
/// 展示某一章节下的所有文章项，点击跳转到对应的演示页面。
library;

import 'package:flutter/material.dart';

import '../data/chapter_manifest.dart';
import 'demo_page.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key, required this.chapter});

  final ChapterInfo chapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: chapter.articles.length,
        separatorBuilder: (_, _a) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, index) {
          final article = chapter.articles[index];
          return _ArticleTile(
            article: article,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DemoPage(articleId: article.id),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ArticleTile extends StatelessWidget {
  const _ArticleTile({required this.article, required this.onTap});

  final ArticleInfo article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              // 编号
              SizedBox(
                width: 44,
                child: Text(
                  '#${article.id}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontFamily: 'monospace',
                  ),
                ),
              ),

              // 图标
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(article.icon, size: 18, color: colorScheme.onSecondaryContainer),
              ),
              const SizedBox(width: 12),

              // 标题
              Expanded(
                child: Text(
                  article.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Icon(Icons.chevron_right, size: 18, color: colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
