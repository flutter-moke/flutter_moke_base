import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo030 extends StatelessWidget {
  const Demo030({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '030',
      title: 'OutlinedButton 描边按钮',
      description: 'OutlinedButton 所有变体演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Normal OutlinedButton'),
          const SizedBox(height: 4),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Normal OutlinedButton'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Disabled OutlinedButton (onPressed: null)'),
          const SizedBox(height: 4),
          const OutlinedButton(
            onPressed: null,
            child: Text('Disabled'),
          ),
          const SizedBox(height: 20),
          _buildLabel('OutlinedButton.icon'),
          const SizedBox(height: 4),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Add to Cart'),
          ),
          const SizedBox(height: 20),
          _buildLabel('Custom Style OutlinedButton'),
          const SizedBox(height: 4),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepOrange,
              side: const BorderSide(color: Colors.deepOrange, width: 2),
            ),
            child: const Text('Custom Style'),
          ),
          const SizedBox(height: 24),
          Text('按钮视觉层级', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const TextButton(onPressed: null, child: Text('TextButton')),
                  const SizedBox(height: 4),
                  Text('无背景无阴影', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
                  const SizedBox(height: 4),
                  Text('有边框', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
                  const SizedBox(height: 4),
                  Text('有阴影和填充', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('OutlinedButton 居中位置，介于 TextButton 和 ElevatedButton 之间', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
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
