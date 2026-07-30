import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo054 extends StatefulWidget {
  const Demo054({super.key});
  @override
  State<Demo054> createState() => _Demo054State();
}

class _Demo054State extends State<Demo054> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '054',
      title: 'NavigationRail 侧边导航',
      description: 'NavigationRail 侧边导航栏与内容区域并排显示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350,
        child: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (i) => setState(() => _selectedIndex = i),
              labelType: NavigationRailLabelType.all,
              leading: const Icon(Icons.menu),
              trailing: const Icon(Icons.settings),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.inbox_outlined),
                  selectedIcon: Icon(Icons.inbox),
                  label: Text('收件箱'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_outline),
                  selectedIcon: Icon(Icons.star),
                  label: Text('星标'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.send_outlined),
                  selectedIcon: Icon(Icons.send),
                  label: Text('已发送'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.drafts_outlined),
                  selectedIcon: Icon(Icons.drafts),
                  label: Text('草稿箱'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        [Icons.inbox, Icons.star, Icons.send, Icons.drafts][_selectedIndex],
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        ['收件箱', '星标邮件', '已发送', '草稿箱'][_selectedIndex],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text('点击左侧导航栏切换',
                           style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：三屏自适应',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(fit: FlexFit.loose, child: _phoneFrame(
                  context,
                  label: '手机',
                  desc: '无 NavigationRail\n使用底部导航',
                  color: Colors.blue,
                  hasRail: false,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(fit: FlexFit.loose, child: _phoneFrame(
                  context,
                  label: '平板竖屏',
                  desc: '紧凑模式\n仅图标',
                  color: Colors.green,
                  hasRail: true,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(fit: FlexFit.loose, child: _phoneFrame(
                  context,
                  label: '桌面',
                  desc: '扩展模式\n图标+文字 256dp',
                  color: Colors.orange,
                  hasRail: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _phoneFrame(
    BuildContext context, {
    required String label,
    required String desc,
    required Color color,
    required bool hasRail,
  }) {
    final theme = Theme.of(context);
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(7)),
            ),
            alignment: Alignment.center,
            child: Text(label,
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: color)),
          ),
          Flexible(fit: FlexFit.loose, child: Row(
              children: [
                if (hasRail)
                  Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.08),
                      border: Border(
                          right: BorderSide(
                              color: color.withValues(alpha: 0.15))),
                    ),
                    child: Icon(Icons.navigation,
                        size: 18,
                        color: color.withValues(alpha: 0.5)),
                  ),
                Flexible(fit: FlexFit.loose, child: Center(
                    child: Text(desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 8,
                            color:
                                theme.colorScheme.onSurfaceVariant)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 16,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(7)),
            ),
          ),
        ],
      ),
    );
  }
}
