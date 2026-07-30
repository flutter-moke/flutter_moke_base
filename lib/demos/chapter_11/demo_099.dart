import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo099 extends StatefulWidget {
  const Demo099({super.key});

  @override
  State<Demo099> createState() => _Demo099State();
}

class _Demo099State extends State<Demo099> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: now.subtract(const Duration(days: 365 * 5)),
      lastDate: now.add(const Duration(days: 365 * 5)),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  String get _formattedDate {
    final d = _selectedDate;
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '099',
      title: 'showDatePicker 日期选择',
      description:
          '调用 showDatePicker 弹出系统日期选择对话框，选择后回显日期。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 当前选中日期展示
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.calendar_today,
                      color: theme.colorScheme.primary, size: 28),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('已选日期',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      const SizedBox(height: 4),
                      Text(
                        _formattedDate,
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

          // 选择日期按钮
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.date_range),
              label: const Text('选择日期'),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            '提示：选择日期后会自动更新上方显示。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ showDatePicker 调用链路',
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
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child: _CallStep(label: '按钮\n点击', color: theme.colorScheme.primary, theme: theme),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.arrow_forward, size: 14, color: theme.colorScheme.onSurfaceVariant),
                    ),
                    Flexible(fit: FlexFit.loose, child: _CallStep(label: 'showDatePicker\n()', color: theme.colorScheme.secondary, theme: theme),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.arrow_forward, size: 14, color: theme.colorScheme.onSurfaceVariant),
                    ),
                    Flexible(fit: FlexFit.loose, child: _CallStep(label: 'DatePicker\nDialog', color: theme.colorScheme.tertiary, theme: theme),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child: _CallStep(label: 'CalendarDate\nPicker', color: Colors.orange, theme: theme),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(Icons.arrow_forward, size: 14, color: theme.colorScheme.onSurfaceVariant),
                    ),
                    Flexible(fit: FlexFit.loose, child: _CallStep(label: '返回\n日期', color: Colors.green, theme: theme),
                    ),
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

class _CallStep extends StatelessWidget {
  const _CallStep({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
    );
  }
}
