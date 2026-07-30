import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo121 extends StatelessWidget {
  const Demo121({super.key});

  static const _expenses = [
    _ExpenseItem('早餐', Icons.restaurant, 18.5, Colors.orange),
    _ExpenseItem('打车', Icons.directions_car, 35.0, Colors.blue),
    _ExpenseItem('咖啡', Icons.coffee, 32.0, Colors.brown),
    _ExpenseItem('购物', Icons.shopping_bag, 268.0, Colors.pink),
    _ExpenseItem('电影票', Icons.movie, 89.0, Colors.purple),
    _ExpenseItem('话费充值', Icons.phone_android, 50.0, Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = _expenses.fold(0.0, (sum, e) => sum + e.amount);

    return DemoFrame(
      articleId: '121',
      title: '记账 App',
      description: '简单支出卡片展示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 月度统计
          Card(
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Icon(Icons.account_balance_wallet,
                      color: theme.colorScheme.onPrimaryContainer),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '本月支出',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Text(
                        '¥${total.toStringAsFixed(1)}',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '明细',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ..._expenses.map(
            (e) => Card(
              margin: const EdgeInsets.only(bottom: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: e.color.withValues(alpha: 0.15),
                  child: Icon(e.icon, color: e.color, size: 20),
                ),
                title: Text(e.title),
                trailing: Text(
                  '-¥${e.amount.toStringAsFixed(1)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 记账 App 布局线框',
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
                // Header: monthly summary
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(width: 16, height: 16, color: theme.colorScheme.primary.withValues(alpha: 0.5)),
                      const SizedBox(width: 8),
                      Flexible(fit: FlexFit.loose, child:  Container(height: 8, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.2))),
                      const SizedBox(width: 12),
                      Container(width: 40, height: 8, color: Colors.green.withValues(alpha: 0.4)),
                      const SizedBox(width: 4),
                      Container(width: 40, height: 8, color: Colors.red.withValues(alpha: 0.4)),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                // Middle: chart area
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) => Container(
                      width: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: [
                          Colors.blue, Colors.orange, Colors.pink, Colors.purple, Colors.teal,
                        ][i].withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      height: [40, 30, 50, 25, 35][i].toDouble(),
                    )),
                  ),
                ),
                const SizedBox(height: 6),
                // Bottom: transaction list rows
                ...List.generate(3, (i) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 16, height: 16,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(fit: FlexFit.loose, child:  Container(height: 6, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.15))),
                        const SizedBox(width: 8),
                        Container(width: 40, height: 6, color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.2)),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseItem {
  const _ExpenseItem(this.title, this.icon, this.amount, this.color);
  final String title;
  final IconData icon;
  final double amount;
  final Color color;
}
