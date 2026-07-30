import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo101 extends StatefulWidget {
  const Demo101({super.key});

  @override
  State<Demo101> createState() => _Demo101State();
}

class _Demo101State extends State<Demo101> {
  DateTimeRange? _selectedRange;

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: now.subtract(const Duration(days: 365 * 5)),
      lastDate: now.add(const Duration(days: 365 * 5)),
      initialDateRange: _selectedRange ??
          DateTimeRange(start: now, end: now.add(const Duration(days: 7))),
    );
    if (range != null) {
      setState(() => _selectedRange = range);
    }
  }

  String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final range = _selectedRange;
    return DemoFrame(
      articleId: '101',
      title: 'DateRangePickerDialog 范围选择',
      description:
          '调用 showDateRangePicker 弹出日期范围选择对话框，显示选中的起止日期。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 范围展示卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.date_range,
                      color: theme.colorScheme.primary, size: 28),
                  const SizedBox(width: 16),
                  Expanded(
                    child: range == null
                        ? Text('尚未选择范围',
                            style: theme.textTheme.bodyLarge)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_formatDate(range.start)} ~ ${_formatDate(range.end)}',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '共 ${range.end.difference(range.start).inDays + 1} 天',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
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

          // 选择按钮
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _pickRange,
              icon: const Icon(Icons.edit_calendar),
              label: Text(range == null ? '选择日期范围' : '重新选择'),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ predicate 禁用周末',
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
                Text('selectableDayPredicate 逻辑',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DayBox(day: '一', selectable: true, theme: theme),
                    _DayBox(day: '二', selectable: true, theme: theme),
                    _DayBox(day: '三', selectable: true, theme: theme),
                    _DayBox(day: '四', selectable: true, theme: theme),
                    _DayBox(day: '五', selectable: true, theme: theme),
                    _DayBox(day: '六', selectable: false, theme: theme),
                    _DayBox(day: '日', selectable: false, theme: theme),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('可选', style: TextStyle(fontSize: 11, color: Colors.green)),
                    const SizedBox(width: 24),
                    Text('禁用（周末）', style: TextStyle(fontSize: 11, color: Colors.red)),
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

class _DayBox extends StatelessWidget {
  const _DayBox({required this.day, required this.selectable, required this.theme});
  final String day;
  final bool selectable;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: selectable
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(day,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: selectable
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.onSurfaceVariant,
            decoration: selectable ? null : TextDecoration.lineThrough,
          )),
    );
  }
}
