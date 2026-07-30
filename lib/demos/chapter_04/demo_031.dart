import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo031 extends StatelessWidget {
  const Demo031({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '031',
      title: 'FilledButton 填充按钮 (M3)',
      description: 'FilledButton 与 FilledButton.tonal 演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Normal FilledButton'),
          const SizedBox(height: 4),
          FilledButton(
            onPressed: () {},
            child: const Text('FilledButton'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Disabled FilledButton'),
          const SizedBox(height: 4),
          const FilledButton(
            onPressed: null,
            child: Text('Disabled'),
          ),
          const SizedBox(height: 20),
          _buildLabel('FilledButton.icon'),
          const SizedBox(height: 4),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Download'),
          ),
          const SizedBox(height: 20),
          _buildLabel('FilledButton.tonal'),
          const SizedBox(height: 4),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Tonal'),
          ),
          const SizedBox(height: 20),
          _buildLabel('FilledButton.tonal.icon'),
          const SizedBox(height: 4),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text('Edit'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Custom Style FilledButton'),
          const SizedBox(height: 4),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              minimumSize: const Size(180, 48),
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
