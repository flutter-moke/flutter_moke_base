import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo036 extends StatelessWidget {
  const Demo036({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '036',
      title: '按钮样式体系详解',
      description: 'Flutter 所有按钮类型的概览表',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          border: TableBorder.all(color: theme.colorScheme.outlineVariant),
          columnWidths: const {
            0: FixedColumnWidth(130),
            1: FixedColumnWidth(180),
            2: FixedColumnWidth(160),
            3: FixedColumnWidth(100),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              ),
              children: [
                _headerCell('按钮类型', theme),
                _headerCell('示例', theme),
                _headerCell('默认样式', theme),
                _headerCell('Material 版本', theme),
              ],
            ),
            _buildDataRow(
              'ElevatedButton',
              SizedBox(
                height: 36,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('填充', style: TextStyle(fontSize: 11)),
                ),
              ),
              '灰色填充 + 阴影',
              'M2',
              theme,
            ),
            _buildDataRow(
              'TextButton',
              SizedBox(
                height: 36,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('文字', style: TextStyle(fontSize: 11)),
                ),
              ),
              '无填充、无边框',
              'M2',
              theme,
            ),
            _buildDataRow(
              'OutlinedButton',
              SizedBox(
                height: 36,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('描边', style: TextStyle(fontSize: 11)),
                ),
              ),
              '透明 + 灰色边框',
              'M2',
              theme,
            ),
            _buildDataRow(
              'FilledButton',
              SizedBox(
                height: 36,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('填充', style: TextStyle(fontSize: 11)),
                ),
              ),
              'primary 填充',
              'M3',
              theme,
            ),
            _buildDataRow(
              'IconButton',
              SizedBox(
                height: 36,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star, size: 18),
                  tooltip: 'IconButton',
                ),
              ),
              '仅图标、无填充',
              'M2 / M3',
              theme,
            ),
            _buildDataRow(
              'FAB',
              SizedBox(
                height: 36,
                child: FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.add, size: 18),
                ),
              ),
              '圆形 + 阴影',
              'M2 / M3',
              theme,
            ),
            _buildDataRow(
              'SegmentedButton',
              SizedBox(
                height: 36,
                child: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'a', label: Text('A', style: TextStyle(fontSize: 10))),
                    ButtonSegment(value: 'b', label: Text('B', style: TextStyle(fontSize: 10))),
                  ],
                  selected: const {'a'},
                  onSelectionChanged: (_) {},
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              '分段选择',
              'M3',
              theme,
            ),
            _buildDataRow(
              'ToggleButtons',
              SizedBox(
                height: 36,
                child: ToggleButtons(
                  isSelected: const [true, false],
                  onPressed: (i) {},
                  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                  children: const [
                    Icon(Icons.format_bold, size: 14),
                    Icon(Icons.format_italic, size: 14),
                  ],
                ),
              ),
              '切换按钮组',
              'M2 / M3',
              theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCell(String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  TableRow _buildDataRow(
    String type,
    Widget example,
    String style,
    String version,
    ThemeData theme,
  ) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(type, style: theme.textTheme.bodyMedium),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Center(child: example),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(style, style: theme.textTheme.bodySmall),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(version, style: theme.textTheme.bodySmall),
        ),
      ],
    );
  }
}
