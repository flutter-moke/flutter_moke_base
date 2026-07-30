import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo001 extends StatelessWidget {
  const Demo001({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    const advantages = [
      _Advantage(Icons.flash_on, 'Hot Reload', '亚秒级热重载，实时预览 UI 变更'),
      _Advantage(Icons.devices, 'Single Codebase', '一套代码同时构建 iOS、Android、Web 与桌面'),
      _Advantage(Icons.speed, 'Native Performance', '直接编译为原生 ARM 代码，性能接近原生'),
      _Advantage(Icons.code, 'Open Source', '完全开源，由 Google 与社区共同维护'),
      _Advantage(Icons.eco, 'Growing Ecosystem', '丰富的第三方包生态（pub.dev）'),
    ];

    return DemoFrame(
      articleId: '001',
      title: 'Flutter 概述与市场前景',
      description: 'Flutter 跨平台框架的优势与应用场景概览',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats overview card
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.flutter_dash,
                      size: 32,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter 3.x',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Google 开源跨平台 UI 框架',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'v3.x',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Stats row
          Row(
            children: [
              _StatCard(
                icon: Icons.phone_android,
                label: '平台支持',
                value: '6+',
                colorScheme: colorScheme,
              ),
              const SizedBox(width: 8),
              _StatCard(
                icon: Icons.store,
                label: '应用数量',
                value: '500k+',
                colorScheme: colorScheme,
              ),
              const SizedBox(width: 8),
              _StatCard(
                icon: Icons.people,
                label: '社区开发者',
                value: '200万+',
                colorScheme: colorScheme,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Advantages title
          Text(
            '核心优势',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // Advantages list
          ...advantages.map(
            (adv) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(adv.icon, size: 20, color: colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adv.title,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          adv.subtitle,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Flutter vs React Native 架构对比', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('React Native', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade700)),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.blueGrey.shade200),
                      ),
                      child: Text('JS Code', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.blueGrey.shade900)),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.arrow_downward, size: 14, color: Colors.grey),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.blueGrey.shade300),
                      ),
                      child: Text('JS Bridge', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.blueGrey.shade900)),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.arrow_downward, size: 14, color: Colors.grey),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('Native Widgets', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white)),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Text('桥接模式', style: TextStyle(fontSize: 11, color: Colors.orange.shade800)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text('Flutter', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700)),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Text('Dart Code', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.blue.shade900)),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.arrow_downward, size: 14, color: Colors.grey),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('Skia', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white)),
                    ),
                    const SizedBox(height: 4),
                    const Icon(Icons.arrow_downward, size: 14, color: Colors.grey),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('GPU', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white)),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Text('自绘引擎', style: TextStyle(fontSize: 11, color: Colors.green.shade800)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Advantage {
  final IconData icon;
  final String title;
  final String subtitle;
  const _Advantage(this.icon, this.title, this.subtitle);
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final ColorScheme colorScheme;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Icon(icon, size: 24, color: colorScheme.primary),
              const SizedBox(height: 6),
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
