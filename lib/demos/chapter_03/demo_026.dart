import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo026 extends StatefulWidget {
  const Demo026({super.key});
  @override
  State<Demo026> createState() => _Demo026State();
}

class _Demo026State extends State<Demo026> {
  bool _showNotch = true;
  bool _centerDocked = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '026',
      title: 'BottomAppBar 底部应用栏',
      description: 'Scaffold 中的 BottomAppBar 与 FAB 演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Controls ──
          Row(
            children: [
              const Text('FAB 缺口 (Notch)'),
              const SizedBox(width: 8),
              Switch(
                value: _showNotch,
                onChanged: (v) => setState(() => _showNotch = v),
              ),
            ],
          ),
          Row(
            children: [
              const Text('FAB 居中'),
              const SizedBox(width: 8),
              Switch(
                value: _centerDocked,
                onChanged: (v) => setState(() => _centerDocked = v),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Simulated Phone Screen Preview ──
          Text('模拟屏幕预览:', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),

          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: Column(
              children: [
                // ── Simulated Status Bar ──
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '模拟状态栏',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ),

                // ── Simulated App Bar ──
                Container(
                  height: 40,
                  color: theme.colorScheme.primary,
                  alignment: Alignment.center,
                  child: const Text(
                    'AppBar',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),

                // ── Body content area ──
                const Expanded(
                  child: Center(
                    child: Text('页面主体内容区域', style: TextStyle(color: Colors.grey)),
                  ),
                ),

                // ── FAB (positioned above BottomAppBar) ──
                Stack(
                  clipBehavior: Clip.none,
                  alignment: _centerDocked ? Alignment.center : Alignment.centerRight,
                  children: [
                    // BottomAppBar
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.home),
                            onPressed: () {},
                            color: theme.colorScheme.primary,
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                          SizedBox(width: _centerDocked ? 56 : 0),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.person_outline),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    // FAB
                    Positioned(
                      top: -28,
                      left: _centerDocked ? null : null,
                      right: _centerDocked ? null : 16,
                      child: FloatingActionButton(
                        onPressed: () {},
                        shape: _showNotch
                            ? null
                            : const CircleBorder(),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // ── Legend ──
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('配置说明:',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 4),
                Text(
                  '- FAB 缺口 (Notch): BottomAppBar 是否为 FAB 留出弧形缺口\n'
                  '- FAB 居中: FAB 位于 BottomAppBar 正中央或右侧',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
