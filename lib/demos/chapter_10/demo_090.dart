import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo090 extends StatefulWidget {
  const Demo090({super.key});

  @override
  State<Demo090> createState() => _Demo090State();
}

class _Demo090State extends State<Demo090> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Color> _pageColors = const [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '090',
      title: 'PageView 页面视图',
      description: 'PageView 滑动翻页，配合圆点指示器。',
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              controller: _controller,
              onPageChanged: (i) => setState(() => _currentPage = i),
              children: List.generate(
                _pageColors.length,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: _pageColors[i],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      '页面 ${i + 1}',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pageColors.length,
              (i) => Container(
                width: _currentPage == i ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentPage == i
                      ? theme.colorScheme.primary
                      : theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
