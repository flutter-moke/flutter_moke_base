/// Flutter Moke — 专栏演示 App 主入口
///
/// 导航结构：Drawer（15 章）→ ChapterPage（文章列表）→ DemoPage（交互演示）
/// 支持 /demo/[id] 命名路由直接跳转。
library;

import 'package:flutter/material.dart';

import '02_app_structure/moke_app_entry.dart';
import '02_app_structure/moke_scaffold.dart';
import 'data/chapter_manifest.dart';
import 'pages/home_page.dart';
import 'pages/demo_page.dart';

void main() {
  runApp(
    MokeAppEntry(
      app: const _MokeApp(),
    ),
  );
}

class _MokeApp extends StatelessWidget {
  const _MokeApp();

  @override
  Widget build(BuildContext context) {
    return const _MainShell();
  }
}

/// 主壳层 — Drawer 导航 + 页面路由
class _MainShell extends StatefulWidget {
  const _MainShell();

  @override
  State<_MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<_MainShell> {
  // 当前显示的章节索引（null = 首页）
  int? _selectedChapterIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MokeScaffold(
      header: AppBar(
        title: Text(
          _selectedChapterIndex != null
              ? chapters[_selectedChapterIndex!].title
              : 'Flutter Moke',
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
      drawer: _buildDrawer(theme),
    );
  }

  Widget _buildBody() {
    if (_selectedChapterIndex != null) {
      final chapter = chapters[_selectedChapterIndex!];
      return _ChapterListView(chapter: chapter);
    }
    return const HomePage();
  }

  /// 章节列表视图（内嵌在主页中）
  Widget _buildDrawer(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 头部
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/墨客_横幅.png'),
                fit: BoxFit.cover,
                onError: (_, __) {},
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/墨客_logo.png',
                    width: 40,
                    height: 40,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Flutter Moke',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${chapters.fold(0, (int sum, c) => sum + c.articleCount)} 篇文章',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 首页
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('首页'),
            selected: _selectedChapterIndex == null,
            onTap: () {
              setState(() => _selectedChapterIndex = null);
              Navigator.of(context).pop(); // 关闭 Drawer
            },
          ),
          const Divider(),

          // 15 个章节
          ...List.generate(chapters.length, (index) {
            final chapter = chapters[index];
            final isSelected = _selectedChapterIndex == index;
            return ListTile(
              leading: CircleAvatar(
                radius: 14,
                backgroundColor: isSelected
                    ? colorScheme.primaryContainer
                    : Colors.transparent,
                child: Text(
                  chapter.id,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                chapter.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              subtitle: Text(
                '${chapter.articleCount} 篇',
                style: theme.textTheme.bodySmall,
              ),
              selected: isSelected,
              onTap: () {
                setState(() => _selectedChapterIndex = index);
                Navigator.of(context).pop(); // 关闭 Drawer
              },
            );
          }),
        ],
      ),
    );
  }
}

/// 内嵌章节文章列表
class _ChapterListView extends StatelessWidget {
  const _ChapterListView({required this.chapter});

  final ChapterInfo chapter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: chapter.articles.length,
      separatorBuilder: (_, _x) => const Divider(height: 1, indent: 72),
      itemBuilder: (context, index) {
        final article = chapter.articles[index];
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DemoPage(articleId: article.id),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
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
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(article.icon, size: 18,
                        color: colorScheme.onSecondaryContainer),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      article.title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 18,
                      color: colorScheme.onSurfaceVariant),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
