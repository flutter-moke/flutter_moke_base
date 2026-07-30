import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo032 extends StatelessWidget {
  const Demo032({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '032',
      title: 'IconButton 图标按钮',
      description: '不同样式与 tooltip 的图标按钮',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Default IconButton'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                tooltip: 'Default',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star_border),
                tooltip: 'Default',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
                tooltip: 'Default',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Filled Style (Material 3)'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                tooltip: 'Filled',
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.star),
                tooltip: 'Filled',
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.bookmark),
                tooltip: 'Filled',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Outlined Style'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                tooltip: 'Outlined',
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.star_border),
                tooltip: 'Outlined',
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
                tooltip: 'Outlined',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Custom Color & Size'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.brush),
                tooltip: 'Custom',
                color: Colors.deepPurple,
                iconSize: 32,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.palette),
                tooltip: 'Custom',
                color: Colors.teal,
                iconSize: 32,
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Disabled IconButton'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              IconButton(
                onPressed: null,
                icon: const Icon(Icons.favorite),
                tooltip: 'Disabled',
              ),
              IconButton.filled(
                onPressed: null,
                icon: const Icon(Icons.star),
                tooltip: 'Disabled Filled',
              ),
            ],
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
