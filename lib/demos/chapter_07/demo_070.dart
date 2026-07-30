import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo070 extends StatefulWidget {
  const Demo070({super.key});

  @override
  State<Demo070> createState() => _Demo070State();
}

class _Demo070State extends State<Demo070> {
  bool _sortAscending = true;
  int? _sortColumnIndex;

  final List<Map<String, String>> _data = [
    {'name': 'Flutter', 'category': '框架', 'version': '3.22'},
    {'name': 'Dart', 'category': '语言', 'version': '3.4'},
    {'name': 'Firebase', 'category': '后端', 'version': '3.0'},
    {'name': 'Widget', 'category': '组件', 'version': '—'},
  ];

  void _sort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
      _data.sort((a, b) {
        final aVal = a.values.elementAt(columnIndex);
        final bVal = b.values.elementAt(columnIndex);
        return ascending ? aVal.compareTo(bVal) : bVal.compareTo(aVal);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '070',
      title: 'DataTable 数据表格',
      description: 'DataTable 展示行、列及排序交互。',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: const Text('名称'),
              onSort: (i, a) => _sort(i, a),
            ),
            DataColumn(
              label: const Text('分类'),
              onSort: (i, a) => _sort(i, a),
            ),
            DataColumn(
              label: const Text('版本'),
              numeric: true,
              onSort: (i, a) => _sort(i, a),
            ),
          ],
          rows: _data
              .map((row) => DataRow(cells: [
                    DataCell(Text(row['name']!)),
                    DataCell(Text(row['category']!)),
                    DataCell(Text(row['version']!)),
                  ]))
              .toList(),
        ),
      ),
    );
  }
}
