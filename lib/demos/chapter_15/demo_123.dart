import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo123 extends StatelessWidget {
  const Demo123({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DemoFrame(
      articleId: '123',
      title: '网络请求与 API 调用',
      description: 'HTTP 请求-响应周期的可视化展示（模拟）',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '一个典型的 HTTP 请求周期包含以下步骤：',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          // 请求流程
          _StepCard(
            step: '1',
            icon: Icons.send,
            title: '构建请求',
            subtitle: 'URL, Method, Headers, Body',
            color: Colors.blue,
            theme: theme,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 8),
          _ArrowDown(color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 8),
          _StepCard(
            step: '2',
            icon: Icons.wifi,
            title: '网络传输',
            subtitle: 'DNS 解析 -> TCP 连接 -> TLS 握手 -> 发送请求',
            color: Colors.indigo,
            theme: theme,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 8),
          _ArrowDown(color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 8),
          _StepCard(
            step: '3',
            icon: Icons.dns,
            title: '服务端处理',
            subtitle: '路由匹配 -> 业务逻辑 -> 数据库查询 -> 响应组装',
            color: Colors.orange,
            theme: theme,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 8),
          _ArrowDown(color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 8),
          _StepCard(
            step: '4',
            icon: Icons.reply,
            title: '接收响应',
            subtitle: 'Status Code, Response Body, Headers',
            color: Colors.green,
            theme: theme,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 8),
          _ArrowDown(color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 8),
          _StepCard(
            step: '5',
            icon: Icons.code,
            title: '数据解析',
            subtitle: 'JSON / XML 解码 -> Model 转换 -> UI 更新',
            color: Colors.purple,
            theme: theme,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 16),
          // 示例代码
          Card(
            color: colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '示例代码',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'import "package:http/http.dart" as http;\n'
                    '\n'
                    'Future<void> fetchData() async {\n'
                    '  final response = await http.get(\n'
                    '    Uri.parse("https://api.example.com/data"),\n'
                    '  );\n'
                    '  if (response.statusCode == 200) {\n'
                    '    // 解析数据\n'
                    '  }\n'
                    '}',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: colorScheme.onSurface,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 网络层四层架构',
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
                _NetLayer(
                  label: 'UI 层 — FutureBuilder\n(请求响应)',
                  color: theme.colorScheme.primary,
                  theme: theme,
                ),
                const SizedBox(height: 3),
                Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 3),
                _NetLayer(
                  label: 'Service 层 — API 调用\n(数据解析)',
                  color: theme.colorScheme.secondary,
                  theme: theme,
                ),
                const SizedBox(height: 3),
                Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 3),
                _NetLayer(
                  label: 'Interceptor — Token/Log/Error\n(拦截处理)',
                  color: Colors.orange,
                  theme: theme,
                ),
                const SizedBox(height: 3),
                Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 3),
                _NetLayer(
                  label: 'HttpClient — Dio\n(网络传输)',
                  color: theme.colorScheme.error,
                  theme: theme,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.autorenew, size: 10, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      Text('Token 过期 → Interceptor 拦截 → 刷新 Token → 重发请求',
                          style: TextStyle(fontSize: 8, color: theme.colorScheme.primary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NetLayer extends StatelessWidget {
  const _NetLayer({required this.label, required this.color, required this.theme});
  final String label;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: color)),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.step,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.theme,
    required this.colorScheme,
  });

  final String step;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final ThemeData theme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Text(
            step,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        title: Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(title, style: theme.textTheme.titleSmall),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _ArrowDown extends StatelessWidget {
  const _ArrowDown({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.arrow_downward, size: 18, color: color.withValues(alpha: 0.5)),
    );
  }
}
