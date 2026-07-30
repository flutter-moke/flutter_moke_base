import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo028 extends StatelessWidget {
  const Demo028({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DemoFrame(
      articleId: '028',
      title: 'ElevatedButton 填充按钮',
      description: 'ElevatedButton 所有变体演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Normal ElevatedButton'),
          const SizedBox(height: 4),
          const ElevatedButton(
            onPressed: null,
            child: Text('Normal ElevatedButton'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Disabled ElevatedButton (onPressed: null)'),
          const SizedBox(height: 4),
          const ElevatedButton(
            onPressed: null,
            child: Text('Disabled'),
          ),
          const SizedBox(height: 20),
          _buildLabel('ElevatedButton.icon'),
          const SizedBox(height: 4),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send),
            label: const Text('Send'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Custom Style ElevatedButton'),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Custom Style'),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
