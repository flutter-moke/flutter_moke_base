import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo124 extends StatelessWidget {
  const Demo124({super.key});

  static const _storages = [
    _StorageInfo(
      name: 'SharedPreferences',
      icon: Icons.memory,
      color: Color(0xFF4CAF50),
      type: '键值对',
      persistence: '持久化',
      useCase: '用户偏好设置、登录 token',
      limit: '轻量 (< 1MB)',
    ),
    _StorageInfo(
      name: '文件 (File)',
      icon: Icons.folder,
      color: Color(0xFF2196F3),
      type: '二进制 / 文本',
      persistence: '持久化',
      useCase: '日志、缓存文件、导出数据',
      limit: '受磁盘空间限制',
    ),
    _StorageInfo(
      name: 'SQLite',
      icon: Icons.storage,
      color: Color(0xFF9C27B0),
      type: '关系型数据库',
      persistence: '持久化',
      useCase: '结构化数据、复杂查询',
      limit: '受磁盘空间限制',
    ),
    _StorageInfo(
      name: 'Hive',
      icon: Icons.hive,
      color: Color(0xFFFF9800),
      type: 'NoSQL 键值对',
      persistence: '持久化',
      useCase: '快速本地存储、离线数据',
      limit: '大型数据集',
    ),
    _StorageInfo(
      name: 'Isar',
      icon: Icons.bolt,
      color: Color(0xFFE91E63),
      type: 'NoSQL 文档型',
      persistence: '持久化',
      useCase: '高性能本地数据库',
      limit: '大型数据集',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '124',
      title: '本地存储方案对比',
      description: '五种常见 Flutter 本地存储方案的对比',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '选择存储方案时需考虑数据结构复杂度、读写频率和存储量级。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          ..._storages.map(
            (s) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: s.color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(s.icon, color: s.color, size: 20),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          s.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _PropRow(label: '类型', value: s.type, theme: theme),
                    const SizedBox(height: 4),
                    _PropRow(label: '持久性', value: s.persistence, theme: theme),
                    const SizedBox(height: 4),
                    _PropRow(label: '适用场景', value: s.useCase, theme: theme),
                    const SizedBox(height: 4),
                    _PropRow(label: '容量限制', value: s.limit, theme: theme),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 存储选型矩阵',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                border: TableBorder.all(
                  color: theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(6),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(70),
                  2: FixedColumnWidth(70),
                  3: FixedColumnWidth(70),
                  4: FixedColumnWidth(60),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: theme.colorScheme.surfaceContainerHighest),
                    children: ['方案', '数据类型', '性能', '易用性', '平台'].map((h) =>
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(h, textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ).toList(),
                  ),
                  _matrixRow('SharedPrefs', '键值对', '中', '高', '全平台'),
                  _matrixRow('File', '二进制', '高', '高', '全平台'),
                  _matrixRow('sqflite', '关系型', '高', '中', '全平台'),
                  _matrixRow('Hive', 'NoSQL', '高', '高', '全平台'),
                  _matrixRow('Isar', '文档型', '极高', '中', '全平台'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TableRow _matrixRow(String name, String type, String perf, String ease, String platform) {
  Color ratingColor(String rating) {
    switch (rating) {
      case '极高':
      case '高':
        return Colors.green;
      case '中':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(name, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
      ),
      _cell(type),
      _cell(perf, color: ratingColor(perf)),
      _cell(ease, color: ratingColor(ease)),
      _cell(platform),
    ],
  );
}

Widget _cell(String text, {Color? color}) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: color != null ? BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ) : null,
      child: Text(text, textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9, fontWeight: color != null ? FontWeight.w600 : null,
              color: color)),
    ),
  );
}

class _PropRow extends StatelessWidget {
  const _PropRow({
    required this.label,
    required this.value,
    required this.theme,
  });
  final String label;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 64,
          child: Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(fit: FlexFit.loose, child: Text(
            value,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _StorageInfo {
  const _StorageInfo({
    required this.name,
    required this.icon,
    required this.color,
    required this.type,
    required this.persistence,
    required this.useCase,
    required this.limit,
  });
  final String name;
  final IconData icon;
  final Color color;
  final String type;
  final String persistence;
  final String useCase;
  final String limit;
}
