import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo092 extends StatefulWidget {
  const Demo092({super.key});

  @override
  State<Demo092> createState() => _Demo092State();
}

class _Demo092State extends State<Demo092> {
  bool _useBouncing = true;
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '092',
      title: 'ScrollController 与 ScrollPhysics',
      description: '切换 BouncingScrollPhysics 与 ClampingScrollPhysics。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            children: [
              FilterChip(
                label: const Text('BouncingScrollPhysics'),
                selected: _useBouncing,
                onSelected: (v) => setState(() => _useBouncing = true),
              ),
              FilterChip(
                label: const Text('ClampingScrollPhysics'),
                selected: !_useBouncing,
                onSelected: (v) => setState(() => _useBouncing = false),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 280,
            child: ListView.builder(
              controller: _controller,
              physics: _useBouncing
                  ? const BouncingScrollPhysics()
                  : const ClampingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Text('${i + 1}'),
                ),
                title: Text('列表项 ${i + 1}'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton.icon(
              icon: const Icon(Icons.vertical_align_top, size: 18),
              label: const Text('滚动到顶部'),
              onPressed: () => _controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ ScrollController 数据流',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('ScrollController',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('ScrollPosition\n(存储 offset/pixels)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(fit: FlexFit.loose, child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('ScrollNotification\n(向上冒泡)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Tag(label: 'addListener', theme: theme),
                    const Icon(Icons.arrow_forward, size: 14),
                    _Tag(label: 'offset 变化', theme: theme),
                    const Icon(Icons.arrow_forward, size: 14),
                    _Tag(label: '触发回调', theme: theme),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.theme});
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11)),
    );
  }
}
