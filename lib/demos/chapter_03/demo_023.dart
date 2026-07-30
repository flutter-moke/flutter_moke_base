import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo023 extends StatelessWidget {
  const Demo023({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '023',
      title: 'GridTileBar 网格图块栏',
      description: 'GridTile 的 header 与 footer 演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Example 1: Only header ──
          Text('仅 header 的 GridTile', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: _buildGridTile(
                    color: Colors.blue,
                    body: 'Header Only',
                    header: const GridTileBar(
                      backgroundColor: Colors.black45,
                      leading: Icon(Icons.star, color: Colors.amber, size: 18),
                      title: Text('标题栏', style: TextStyle(fontSize: 12)),
                      trailing: Icon(Icons.more_vert, color: Colors.white, size: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildGridTile(
                    color: Colors.green,
                    body: 'Header Only',
                    header: const GridTileBar(
                      backgroundColor: Colors.black45,
                      leading: Icon(Icons.favorite, color: Colors.red, size: 18),
                      title: Text('收藏', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 20),

          // ── Example 2: Only footer ──
          Text('仅 footer 的 GridTile', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: _buildGridTile(
                    color: Colors.amber,
                    body: 'Footer Only',
                    footer: const GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text('页脚栏', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildGridTile(
                    color: Colors.purple,
                    body: 'Footer Only',
                    footer: const GridTileBar(
                      backgroundColor: Colors.black45,
                      leading: Icon(Icons.check_circle, color: Colors.white, size: 18),
                      title: Text('已完成', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 20),

          // ── Example 3: Both header and footer ──
          Text('同时拥有 header 和 footer 的 GridTile',
              style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(
                  child: _buildGridTile(
                    color: Colors.teal,
                    body: '中',
                    header: const GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text('顶部', style: TextStyle(fontSize: 12)),
                    ),
                    footer: const GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text('底部', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildGridTile(
                    color: Colors.indigo,
                    body: '中',
                    header: const GridTileBar(
                      backgroundColor: Colors.black45,
                      leading: Icon(Icons.arrow_upward, color: Colors.white, size: 16),
                      title: Text('Header', style: TextStyle(fontSize: 12)),
                    ),
                    footer: const GridTileBar(
                      backgroundColor: Colors.black45,
                      leading: Icon(Icons.arrow_downward, color: Colors.white, size: 16),
                      title: Text('Footer', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Text(
            'GridTileBar 提供 backgroundColor、leading、title、trailing',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridTile({
    required Color color,
    required String body,
    Widget? header,
    Widget? footer,
  }) {
    return GridTile(
      header: header,
      footer: footer,
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          body,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
