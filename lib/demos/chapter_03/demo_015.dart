import 'dart:math';
import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo015 extends StatefulWidget {
  const Demo015({super.key});
  @override
  State<Demo015> createState() => _Demo015State();
}

class _Demo015State extends State<Demo015> {
  final _random = Random();
  double _offsetX = 0;
  double _offsetY = 0;

  void _randomize() {
    setState(() {
      _offsetX = _random.nextDouble() * 24 - 12;
      _offsetY = _random.nextDouble() * 24 - 12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '015',
      title: 'Stack 层叠布局',
      description: 'Stack 中 Positioned 组件的使用演示',
      child: Column(
        children: [
          // ── Stack Preview ──
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                // Background
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '背景层',
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontSize: 16,
                    ),
                  ),
                ),
                // top-left
                Positioned(
                  top: 10 + _offsetY,
                  left: 10 + _offsetX,
                  child: _smallBox(Colors.red, 'TL'),
                ),
                // top-right
                Positioned(
                  top: 10 + _offsetY,
                  right: 10 - _offsetX,
                  child: _smallBox(Colors.green, 'TR'),
                ),
                // bottom-left
                Positioned(
                  bottom: 10 - _offsetY,
                  left: 10 + _offsetX,
                  child: _smallBox(Colors.amber, 'BL'),
                ),
                // bottom-right
                Positioned(
                  bottom: 10 - _offsetY,
                  right: 10 - _offsetX,
                  child: _smallBox(Colors.purple, 'BR'),
                ),
                // center
                Positioned(
                  top: 125 + _offsetY,
                  left: 125 + _offsetX,
                  child: _smallBox(Colors.orange, 'CT'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Controls ──
          Center(
            child: FilledButton.icon(
              onPressed: _randomize,
              icon: const Icon(Icons.shuffle),
              label: const Text('随机偏移'),
            ),
          ),
          const SizedBox(height: 8),

          Center(
            child: Text(
              '偏移量: X=${_offsetX.toStringAsFixed(1)}, Y=${_offsetY.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),

          // ── Legend ──
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: [
              _legend(Colors.red, 'TL = 左上'),
              _legend(Colors.green, 'TR = 右上'),
              _legend(Colors.amber, 'BL = 左下'),
              _legend(Colors.purple, 'BR = 右下'),
              _legend(Colors.orange, 'CT = 居中'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallBox(Color color, String label) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _legend(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
