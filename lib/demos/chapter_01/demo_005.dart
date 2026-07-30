import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo005 extends StatelessWidget {
  const Demo005({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '005',
      title: 'Dart 语言快速入门',
      description: 'Dart 语法特性快速预览',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Variable declaration snippet
          Text(
            '变量声明',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          _CodeBlock(
            code: 'var name = \'Flutter\';\n'
                'final age = 10;\n'
                'const pi = 3.14159;\n'
                'String greeting = \'Hello\';',
          ),

          const SizedBox(height: 12),

          // Function snippet
          Text(
            '函数定义',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          _CodeBlock(
            code: 'int add(int a, int b) {\n'
                '  return a + b;\n'
                '}\n\n'
                '// 箭头函数简写\n'
                'int multiply(int a, int b) => a * b;',
          ),

          const SizedBox(height: 12),

          // Class snippet
          Text(
            '类定义',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          _CodeBlock(
            code: 'class Person {\n'
                '  final String name;\n'
                '  final int age;\n\n'
                '  Person(this.name, this.age);\n\n'
                '  void sayHello() {\n'
                "    print('Hi, I\\'m \$name');\n"
                '  }\n'
                '}',
          ),

          const SizedBox(height: 12),

          // Async snippet
          Text(
            '异步编程',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          _CodeBlock(
            code: 'Future<String> fetchData() async {\n'
                '  await Future.delayed(Duration(seconds: 1));\n'
                '  return \'Data loaded\';\n'
                '}\n\n'
                'Stream<int> countStream() async* {\n'
                '  for (int i = 1; i <= 3; i++) {\n'
                '    yield i;\n'
                '  }\n'
                '}',
          ),

          const SizedBox(height: 12),

          // Null safety tip
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.amber.shade700),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Dart 支持空安全（Null Safety），所有变量默认不可为 null，使用 ? 标记可空类型。',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.amber.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Future vs Stream', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.shade300),
                  ),
                  child: Column(
                    children: [
                      Text('Future', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange.shade700)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28, height: 28,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
                            alignment: Alignment.center,
                            child: const Icon(Icons.play_arrow, size: 16, color: Colors.white),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(Icons.arrow_forward, color: Colors.grey, size: 18),
                          ),
                          Container(
                            width: 28, height: 28,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
                            alignment: Alignment.center,
                            child: const Icon(Icons.check, size: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('1 个异步值', style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade300),
                  ),
                  child: Column(
                    children: [
                      Text('Stream', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 28, height: 28,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                            alignment: Alignment.center,
                            child: const Icon(Icons.play_arrow, size: 16, color: Colors.white),
                          ),
                          const SizedBox(width: 6),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _StreamLine(color: Colors.blue.shade300),
                              const SizedBox(height: 3),
                              _StreamLine(color: Colors.blue.shade400),
                              const SizedBox(height: 3),
                              _StreamLine(color: Colors.blue.shade500),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('多个异步值', style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StreamLine extends StatelessWidget {
  final Color color;
  const _StreamLine({required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.arrow_forward, size: 12, color: Colors.grey),
        const SizedBox(width: 4),
        Container(
          width: 16, height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _CodeBlock extends StatelessWidget {
  final String code;

  const _CodeBlock({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontFamilyFallback: ['Courier', 'Menlo'],
          fontSize: 13,
          height: 1.5,
          color: Color(0xFFD4D4D4),
        ),
      ),
    );
  }
}
