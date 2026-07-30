import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo116 extends StatefulWidget {
  const Demo116({super.key});
  @override
  State<Demo116> createState() => _Demo116State();
}

class _Demo116State extends State<Demo116> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '116',
      title: 'AnimatedSwitcher 与 AnimatedCrossFade',
      description: '点击切换动画方式',
      child: Column(
        children: [
          // AnimatedSwitcher
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'AnimatedSwitcher',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, anim) {
                      return FadeTransition(
                        opacity: anim,
                        child: ScaleTransition(scale: anim, child: child),
                      );
                    },
                    child: _showFirst
                        ? Container(
                            key: const ValueKey('blue'),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Icon(Icons.light_mode, color: Colors.white, size: 40),
                            ),
                          )
                        : Container(
                            key: const ValueKey('orange'),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Icon(Icons.dark_mode, color: Colors.white, size: 40),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // AnimatedCrossFade
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'AnimatedCrossFade',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 400),
                    crossFadeState: _showFirst
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Container(
                      width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          '第一个组件',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    secondChild: Container(
                      width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          '第二个组件',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => setState(() => _showFirst = !_showFirst),
            icon: Icon(_showFirst ? Icons.swap_horiz : Icons.swap_horiz),
            label: const Text('切换显示'),
          ),
        ],
      ),
    );
  }
}
