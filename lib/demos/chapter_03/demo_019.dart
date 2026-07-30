import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo019 extends StatefulWidget {
  const Demo019({super.key});
  @override
  State<Demo019> createState() => _Demo019State();
}

class _Demo019State extends State<Demo019> {
  double _aspectRatio = 1.0;
  double _minWidth = 80;
  double _maxWidth = 200;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '019',
      title: 'AspectRatio 与 ConstrainedBox',
      description: '宽高比与约束交互演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── AspectRatio Demo ──
          Text('AspectRatio — 宽高比', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: AspectRatio(
              aspectRatio: _aspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  '宽高比 ${_aspectRatio.toStringAsFixed(1)}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('宽高比: ${_aspectRatio.toStringAsFixed(1)}',
              style: theme.textTheme.bodySmall),
          Slider(
            value: _aspectRatio,
            min: 0.5,
            max: 3.0,
            divisions: 25,
            label: _aspectRatio.toStringAsFixed(1),
            onChanged: (v) => setState(() => _aspectRatio = v),
          ),

          const Divider(height: 24),

          // ── ConstrainedBox Demo ──
          Text('ConstrainedBox — 约束范围', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: _minWidth,
                maxWidth: _maxWidth,
                minHeight: 40,
                maxHeight: 80,
              ),
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  '约束 ${_minWidth.toInt()}-${_maxWidth.toInt()} x 40-80',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          Text('最小宽度: ${_minWidth.toInt()}',
              style: theme.textTheme.bodySmall),
          Slider(
            value: _minWidth,
            min: 40,
            max: 150,
            divisions: 22,
            label: '${_minWidth.toInt()}',
            onChanged: (v) => setState(() => _minWidth = v),
          ),

          Text('最大宽度: ${_maxWidth.toInt()}',
              style: theme.textTheme.bodySmall),
          Slider(
            value: _maxWidth,
            min: 100,
            max: 300,
            divisions: 20,
            label: '${_maxWidth.toInt()}',
            onChanged: (v) => setState(() => _maxWidth = v),
          ),
          const SizedBox(height: 24),
          Text('AspectRatio 约束', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Column(
            children: [
              // Small parent
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text('16:9', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text('100x80 父容器', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
              const SizedBox(height: 12),
              // Medium parent
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text('16:9', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text('200x120 父容器', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
              const SizedBox(height: 12),
              // Large parent
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text('16:9', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text('infinity x 100 父容器（自适应宽度）', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }
}
