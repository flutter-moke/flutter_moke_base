import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo128 extends StatelessWidget {
  const Demo128({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '128',
      title: '打包发布上架指南',
      description: 'Flutter 应用打包发布完整步骤清单',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '按照以下步骤将您的 Flutter 应用发布到各大应用商店。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          _SectionTitle(title: 'Android 发布', theme: theme, color: Colors.green),
          const SizedBox(height: 8),
          _StepTile(
            number: 1,
            icon: Icons.key,
            title: '生成签名密钥',
            subtitle: 'keytool -genkey -v -keystore upload-keystore.jks',
            theme: theme,
          ),
          _StepTile(
            number: 2,
            icon: Icons.settings,
            title: '配置 key.properties',
            subtitle: '在项目 android/ 目录下配置签名信息',
            theme: theme,
          ),
          _StepTile(
            number: 3,
            icon: Icons.build,
            title: '构建发布版 APK / AAB',
            subtitle: 'flutter build appbundle 或 flutter build apk',
            theme: theme,
          ),
          _StepTile(
            number: 4,
            icon: Icons.storefront,
            title: '上传 Google Play Console',
            subtitle: '创建应用 > 填写信息 > 上传构建包 > 审核发布',
            theme: theme,
          ),
          const SizedBox(height: 20),
          _SectionTitle(title: 'iOS 发布', theme: theme, color: Colors.blue),
          const SizedBox(height: 8),
          _StepTile(
            number: 1,
            icon: Icons.apple,
            title: '配置 Xcode 项目',
            subtitle: '设置 Bundle ID、版本号、团队证书',
            theme: theme,
          ),
          _StepTile(
            number: 2,
            icon: Icons.fingerprint,
            title: '签名与 Capabilities',
            subtitle: '配置 Provisioning Profile 和所需权限',
            theme: theme,
          ),
          _StepTile(
            number: 3,
            icon: Icons.archive,
            title: 'Archive 构建',
            subtitle: 'Xcode -> Product -> Archive',
            theme: theme,
          ),
          _StepTile(
            number: 4,
            icon: Icons.cloud_upload,
            title: '上传 App Store Connect',
            subtitle: '通过 Xcode 或 Transporter 上传，填写元数据并提交审核',
            theme: theme,
          ),
          const SizedBox(height: 20),
          _SectionTitle(title: '发布前检查', theme: theme, color: Colors.orange),
          const SizedBox(height: 8),
          _CheckItem(
            text: '移除调试代码和 print 语句',
            done: false,
            theme: theme,
          ),
          _CheckItem(
            text: '更新应用图标和启动图',
            done: false,
            theme: theme,
          ),
          _CheckItem(
            text: '检查权限声明 (Privacy manifest)',
            done: false,
            theme: theme,
          ),
          _CheckItem(
            text: '测试 Release 构建的稳定性',
            done: false,
            theme: theme,
          ),
          _CheckItem(
            text: '准备应用商店截图和描述',
            done: false,
            theme: theme,
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 三路并行发布流程',
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
                // Pre-release phase
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PubStep(label: '代码\n冻结', theme: theme),
                    Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    _PubStep(label: '版本\n更新', theme: theme),
                    Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    _PubStep(label: '构建\nRelease', theme: theme),
                    Icon(Icons.arrow_forward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                    _PubStep(label: '签名', theme: theme),
                  ],
                ),
                const SizedBox(height: 8),
                // 3 parallel paths
                Row(
                  children: [
                    Flexible(fit: FlexFit.loose, child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Text('Google Play', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Colors.green)),
                            const SizedBox(height: 2),
                            Text('AAB 上传', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(fit: FlexFit.loose, child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Text('App Store', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Colors.blue)),
                            const SizedBox(height: 2),
                            Text('Archive+TestFlight', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(fit: FlexFit.loose, child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Text('国内商店', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: Colors.orange)),
                            const SizedBox(height: 2),
                            Text('各平台上传', style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
                          ],
                        ),
                      ),
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

class _PubStep extends StatelessWidget {
  const _PubStep({required this.label, required this.theme});
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurface)),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.theme,
    required this.color,
  });
  final String title;
  final ThemeData theme;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({
    required this.number,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.theme,
  });
  final int number;
  final IconData icon;
  final String title;
  final String subtitle;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: colorScheme.primaryContainer,
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Icon(icon, size: 20, color: colorScheme.primary),
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  const _CheckItem({
    required this.text,
    required this.done,
    required this.theme,
  });
  final String text;
  final bool done;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = theme.colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 4),
      child: CheckboxListTile(
        value: done,
        onChanged: null,
        dense: true,
        title: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: colorScheme.primary,
      ),
    );
  }
}
