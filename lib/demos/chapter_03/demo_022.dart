import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo022 extends StatelessWidget {
  const Demo022({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '022',
      title: 'GridTile 网格图块',
      description: 'GridView 中的 GridTile 示例',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2×2 GridView 网格布局',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),

          // Section 1: GridTile with header & footer
          Text('带 header 和 footer 的 GridTile',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.0,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _gridTile(
                  color: Colors.blue,
                  header: '标题 A',
                  body: 'A',
                  footer: '页脚 A',
                ),
                _gridTile(
                  color: Colors.green,
                  header: '标题 B',
                  body: 'B',
                  footer: '页脚 B',
                ),
                _gridTile(
                  color: Colors.amber,
                  header: '标题 C',
                  body: 'C',
                  footer: '页脚 C',
                ),
                _gridTile(
                  color: Colors.purple,
                  header: '标题 D',
                  body: 'D',
                  footer: '页脚 D',
                ),
              ],
            ),
          ),

          const Divider(height: 16),

          // Section 2: GridTile body only
          Text('仅 body 的 GridTile',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.0,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _simpleTile(Colors.red, '1'),
                _simpleTile(Colors.orange, '2'),
                _simpleTile(Colors.teal, '3'),
                _simpleTile(Colors.indigo, '4'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridTile({
    required Color color,
    required String header,
    required String body,
    required String footer,
  }) {
    return GridTile(
      header: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(header, style: const TextStyle(fontSize: 12)),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(footer, style: const TextStyle(fontSize: 12)),
      ),
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          body,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _simpleTile(Color color, String text) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
