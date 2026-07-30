import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo049 extends StatefulWidget {
  const Demo049({super.key});
  @override
  State<Demo049> createState() => _Demo049State();
}

class _Demo049State extends State<Demo049> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 10, minute: 30);

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) setState(() => _selectedTime = time);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = '${_selectedDate.year}-'
        '${_selectedDate.month.toString().padLeft(2, '0')}-'
        '${_selectedDate.day.toString().padLeft(2, '0')}';
    final timeStr = '${_selectedTime.hour.toString().padLeft(2, '0')}:'
        '${_selectedTime.minute.toString().padLeft(2, '0')}';

    return DemoFrame(
      articleId: '049',
      title: 'InputDecorator 与 DatePicker',
      description: '使用 DatePicker/TimePicker 选择日期和时间。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('InputDecorator 展示:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          InputDecorator(
            decoration: const InputDecoration(
              labelText: '已选日期',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today),
            ),
            child: Text(dateStr),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.date_range),
            label: const Text('选择日期'),
          ),
          const SizedBox(height: 20),

          InputDecorator(
            decoration: const InputDecoration(
              labelText: '已选时间',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.access_time),
            ),
            child: Text(timeStr),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: _pickTime,
            icon: const Icon(Icons.schedule),
            label: const Text('选择时间'),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('完整日期时间:', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('$dateStr $timeStr',
                     style: theme.textTheme.titleMedium?.copyWith(
                       fontWeight: FontWeight.bold,
                     )),
              ],
            ),
          ),
          // ── 架构图：日期选择器流程 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：日期选择器流程',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _DatePickerFlow(),
          const SizedBox(height: 24),
          const Text('■ 架构图：InputDecorator 层级',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _InputDecoratorHierarchy(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _DatePickerFlow extends StatelessWidget {
  const _DatePickerFlow();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          // Path 1: Type date (blue)
          _pathRow(cs, '路径 1', Colors.blue, [
            _pathStep(cs, '输入日期', Colors.blue, Icons.keyboard),
            _arrow(cs),
            _pathStep(cs, '格式验证', Colors.blue, Icons.check_circle),
            _arrow(cs),
            _pathStep(cs, '显示/错误', Colors.blue, Icons.info),
          ]),
          const SizedBox(height: 12),
          // Path 2: Calendar dialog (green)
          _pathRow(cs, '路径 2', Colors.green, [
            _pathStep(cs, '点击日历', Colors.green, Icons.calendar_today),
            _arrow(cs),
            _pathStep(cs, 'DatePicker\nDialog', Colors.green, Icons.date_range),
            _arrow(cs),
            _pathStep(cs, '选择日期', Colors.green, Icons.touch_app),
            _arrow(cs),
            _pathStep(cs, '填充字段', Colors.green, Icons.edit),
          ]),
          const SizedBox(height: 12),
          // Path 3: Clear field (orange)
          _pathRow(cs, '路径 3', Colors.orange, [
            _pathStep(cs, '清空字段', Colors.orange, Icons.clear),
            _arrow(cs),
            _pathStep(cs, 'acceptEmpty\nDate = true', Colors.orange, Icons.toggle_on),
            _arrow(cs),
            _pathStep(cs, '值为空', Colors.orange, Icons.block),
          ]),
        ],
      ),
    );
  }

  Widget _pathRow(ColorScheme cs, String label, Color color, List<Widget> steps) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: color)),
          ),
          const SizedBox(width: 4),
          Flexible(fit: FlexFit.loose, child:  Row(children: steps)),
        ],
      ),
    );
  }

  Widget _pathStep(ColorScheme cs, String label, Color color, IconData icon) {
    return Flexible(fit: FlexFit.loose, child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Column(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(height: 2),
            Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _arrow(ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Icon(Icons.arrow_forward, size: 12, color: cs.onSurfaceVariant),
    );
  }
}

class _InputDecoratorHierarchy extends StatelessWidget {
  const _InputDecoratorHierarchy();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          _hierBox(cs, 'TextField', '顶层组件，提供用户交互', cs.primary, 0),
          _hierConnector(cs, '包裹'),
          _hierBox(cs, 'InputDecorator', '中间层，渲染装饰', cs.secondary, 24),
          _hierConnector(cs, '配置'),
          _hierBox(cs, 'InputDecoration', '底层，纯配置数据', cs.tertiary, 48),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Flexible(fit: FlexFit.loose, child: Text(
                    'TextField → InputDecorator → InputDecoration：装饰器模式，配置与渲染分离',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hierBox(ColorScheme cs, String name, String desc, Color color, double indent) {
    return Padding(
      padding: EdgeInsets.only(left: indent),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.35), width: 1.5),
        ),
        child: Row(
          children: [
            Container(width: 3, height: 24, color: color, margin: const EdgeInsets.only(right: 12)),
            Flexible(fit: FlexFit.loose, child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: color)),
                  Text(desc, style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hierConnector(ColorScheme cs, String label) {
    return SizedBox(
      height: 20,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_downward, size: 12, color: cs.outlineVariant),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 9, color: cs.outlineVariant)),
          ],
        ),
      ),
    );
  }
}
