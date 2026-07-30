import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo029 extends StatelessWidget {
  const Demo029({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '029',
      title: 'TextButton 文字按钮',
      description: 'TextButton 所有变体演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Normal TextButton'),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {},
            child: const Text('Normal TextButton'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Disabled TextButton (onPressed: null)'),
          const SizedBox(height: 4),
          const TextButton(
            onPressed: null,
            child: Text('Disabled'),
          ),
          const SizedBox(height: 20),
          _buildLabel('TextButton.icon'),
          const SizedBox(height: 4),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            label: const Text('Like'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Custom Style TextButton'),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
