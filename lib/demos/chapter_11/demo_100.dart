import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo100 extends StatefulWidget {
  const Demo100({super.key});

  @override
  State<Demo100> createState() => _Demo100State();
}

class _Demo100State extends State<Demo100> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '100',
      title: 'DatePickerDialog 与 CalendarDatePicker',
      description: '内联展示 CalendarDatePicker 组件，交互选取日期。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 选中日期
          Text(
            '已选日期：${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 12),

          // 内联日历选择器
          SizedBox(
            height: 400,
            child: CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 365 * 5)),
              lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
              onDateChanged: (date) {
                setState(() => _selectedDate = date);
              },
            ),
          ),
        ],
      ),
    );
  }
}
