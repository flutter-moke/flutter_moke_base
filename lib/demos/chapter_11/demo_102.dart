import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo102 extends StatefulWidget {
  const Demo102({super.key});

  @override
  State<Demo102> createState() => _Demo102State();
}

class _Demo102State extends State<Demo102> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  String get _formattedTime {
    final t = _selectedTime;
    final hour = t.hourOfPeriod.toString().padLeft(2, '0');
    final minute = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '102',
      title: 'showTimePicker 时间选择',
      description:
          '调用 showTimePicker 弹出时间选择对话框，选择后回显时间。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 当前选中时间展示
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.access_time,
                      color: theme.colorScheme.primary, size: 28),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('已选时间',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      const SizedBox(height: 4),
                      Text(
                        _formattedTime,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 选择时间按钮
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _pickTime,
              icon: const Icon(Icons.watch_later),
              label: const Text('选择时间'),
            ),
          ),
        ],
      ),
    );
  }
}
