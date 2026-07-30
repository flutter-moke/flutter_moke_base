import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo127 extends StatefulWidget {
  const Demo127({super.key});
  @override
  State<Demo127> createState() => _Demo127State();
}

class _Demo127State extends State<Demo127> {
  bool _isChinese = true;

  static const Map<String, Map<String, String>> _strings = {
    'zh': {
      'title': '国际化与无障碍',
      'greeting': '你好，欢迎使用 Flutter Moke！',
      'description': '这是一个国际化演示，展示了中英文切换功能。',
      'button': '切换语言',
      'localeLabel': '当前语言：',
      'localeValue': '中文',
      'accessibility': '无障碍支持',
      'accessibilityDesc': 'Flutter 内置对屏幕阅读器（TalkBack / VoiceOver）的支持。',
      'semantics': '使用 Semantics widget 可自定义无障碍语义。',
    },
    'en': {
      'title': 'Internationalization & Accessibility',
      'greeting': 'Hello, welcome to Flutter Moke!',
      'description': 'This is an internationalization demo showing language switching.',
      'button': 'Switch Language',
      'localeLabel': 'Current Language: ',
      'localeValue': 'English',
      'accessibility': 'Accessibility Support',
      'accessibilityDesc':
          'Flutter has built-in support for screen readers (TalkBack / VoiceOver).',
      'semantics': 'Use Semantics widget to customize accessibility labels.',
    },
  };

  String tr(String key) {
    final lang = _isChinese ? 'zh' : 'en';
    return _strings[lang]?[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '127',
      title: tr('title'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 语言切换指示器
          Row(
            children: [
              Text(
                tr('localeLabel'),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tr('localeValue'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // 问候语
          Card(
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    Icons.language,
                    size: 48,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tr('greeting'),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr('description'),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // 无障碍部分
          Text(
            tr('accessibility'),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.accessibility_new,
                    color: theme.colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr('accessibility'),
                          style: theme.textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tr('accessibilityDesc'),
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
          const SizedBox(height: 8),
          Semantics(
            label: tr('semantics'),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  tr('semantics'),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // 切换按钮
          Center(
            child: FilledButton.icon(
              onPressed: () => setState(() => _isChinese = !_isChinese),
              icon: Icon(_isChinese ? Icons.flag : Icons.flag_circle),
              label: Text(tr('button')),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          Text('■ 国际化与无障碍双轨',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Left: i18n
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('国际化 (i18n)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                      const SizedBox(height: 6),
                      _TrackBox(label: 'ARB 文件', theme: theme),
                      Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _TrackBox(label: 'flutter gen-l10n', theme: theme),
                      Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _TrackBox(label: 'AppLocalizations\n.of(context)', theme: theme),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Right: a11y
                Flexible(fit: FlexFit.loose, child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('无障碍 (a11y)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 6),
                      _TrackBox(label: 'Semantics\nWidget', theme: theme),
                      Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _TrackBox(label: '标签 / 状态', theme: theme),
                      Icon(Icons.arrow_downward, size: 12, color: theme.colorScheme.onSurfaceVariant),
                      _TrackBox(label: '屏幕阅读器', theme: theme),
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

class _TrackBox extends StatelessWidget {
  const _TrackBox({required this.label, required this.theme});
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
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
