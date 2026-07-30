import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo010 extends StatefulWidget {
  const Demo010({super.key});

  @override
  State<Demo010> createState() => _Demo010State();
}

class _Demo010State extends State<Demo010> {
  bool _showAppBar = true;
  bool _showFAB = true;
  bool _showBottomNav = true;
  bool _showDrawer = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '010',
      title: 'Scaffold 结构化布局',
      description: 'Scaffold 各部分组件交互演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Scaffold 部件可见性控制：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 4),

          // ── 切换选项 ──
          CheckboxListTile(
            title: const Text('AppBar（顶部应用栏）'),
            value: _showAppBar,
            onChanged: (v) => setState(() => _showAppBar = v!),
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: colorScheme.primary,
          ),
          CheckboxListTile(
            title: const Text('FAB（浮动操作按钮）'),
            value: _showFAB,
            onChanged: (v) => setState(() => _showFAB = v!),
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: colorScheme.primary,
          ),
          CheckboxListTile(
            title: const Text('BottomNavigationBar（底部导航栏）'),
            value: _showBottomNav,
            onChanged: (v) => setState(() => _showBottomNav = v!),
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: colorScheme.primary,
          ),
          CheckboxListTile(
            title: const Text('Drawer（侧边栏菜单按钮）'),
            value: _showDrawer,
            onChanged: (v) => setState(() => _showDrawer = v!),
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: colorScheme.primary,
          ),

          const SizedBox(height: 12),
          Text('预览示意图：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),

          // ── Scaffold 预览图 ──
          Container(
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // AppBar
                if (_showAppBar)
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(11),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        if (_showDrawer)
                          Icon(Icons.menu,
                              color: colorScheme.onPrimaryContainer),
                        const Spacer(),
                        Text(
                          'AppBar',
                          style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),

                // Body
                Expanded(
                  child: Container(
                    color: colorScheme.surface,
                    alignment: Alignment.center,
                    child: _showFAB
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FloatingActionButton.small(
                                onPressed: null,
                                backgroundColor: colorScheme.primary,
                                child: Icon(Icons.add,
                                    color: colorScheme.onPrimary),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'FAB',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            'Body 内容区域',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                  ),
                ),

                // BottomNavigationBar
                if (_showBottomNav)
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(11),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'BottomNavigationBar',
                      style: TextStyle(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
