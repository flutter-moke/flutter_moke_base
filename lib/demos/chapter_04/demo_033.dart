import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo033 extends StatelessWidget {
  const Demo033({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '033',
      title: 'FloatingActionButton 浮动按钮',
      description: 'FAB 的不同变体演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Regular FAB'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              FloatingActionButton(
                onPressed: () {},
                tooltip: 'Regular FAB',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                tooltip: 'Small FAB',
                child: const Icon(Icons.edit),
              ),
              FloatingActionButton.large(
                onPressed: () {},
                tooltip: 'Large FAB',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Mini FAB'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              FloatingActionButton.small(
                onPressed: () {},
                tooltip: 'Mini FAB',
                child: const Icon(Icons.favorite),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                tooltip: 'Mini FAB',
                child: const Icon(Icons.share),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                tooltip: 'Mini FAB',
                child: const Icon(Icons.delete),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Extended FAB (with label and icon)'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.email),
                label: const Text('Compose'),
                tooltip: 'Extended FAB',
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Upload'),
                tooltip: 'Upload',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('FAB with Custom Colors'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                tooltip: 'Custom Color',
                child: const Icon(Icons.flash_on),
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                icon: const Icon(Icons.map),
                label: const Text('Navigate'),
                tooltip: 'Custom Extended',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel('Disabled FAB'),
          const SizedBox(height: 4),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              FloatingActionButton(
                onPressed: null,
                tooltip: 'Disabled',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.extended(
                onPressed: null,
                icon: const Icon(Icons.send),
                label: const Text('Send'),
                tooltip: 'Disabled Extended',
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
