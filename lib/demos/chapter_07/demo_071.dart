import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo071 extends StatelessWidget {
  Demo071({super.key});

  final List<Map<String, String>> _data = List.generate(
    30,
    (i) => {
      'id': '${i + 1}',
      'name': '项目 ${i + 1}',
      'status': i % 3 == 0 ? '进行中' : (i % 3 == 1 ? '已完成' : '待开始'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '071',
      title: 'PaginatedDataTable 分页表格',
      description: 'PaginatedDataTable 搭配 DataTableSource 实现分页。',
      child: SizedBox(
        height: 400,
        child: PaginatedDataTable(
          header: const Text('项目列表'),
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('名称')),
            DataColumn(label: Text('状态')),
          ],
          source: _MyDataTableSource(_data),
          rowsPerPage: 8,
        ),
      ),
    );
  }
}

class _MyDataTableSource extends DataTableSource {
  final List<Map<String, String>> _data;

  _MyDataTableSource(this._data);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final row = _data[index];
    return DataRow(cells: [
      DataCell(Text(row['id']!)),
      DataCell(Text(row['name']!)),
      DataCell(Text(row['status']!)),
    ]);
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
