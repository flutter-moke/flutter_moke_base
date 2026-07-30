import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo045 extends StatefulWidget {
  const Demo045({super.key});
  @override
  State<Demo045> createState() => _Demo045State();
}

class _Demo045State extends State<Demo045> {
  double _continuousValue = 0.5;
  double _discreteValue = 50;
  RangeValues _rangeValue = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '045',
      title: 'Slider 滑块',
      description: '连续滑块、离散滑块与范围滑块演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('连续滑块:', style: TextStyle(fontWeight: FontWeight.w600)),
          Slider(
            value: _continuousValue,
            onChanged: (v) => setState(() => _continuousValue = v),
          ),
          Text('  值: ${_continuousValue.toStringAsFixed(2)}',
               style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),

          const Text('离散滑块 (0-100, 步长10):', style: TextStyle(fontWeight: FontWeight.w600)),
          Slider(
            value: _discreteValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: _discreteValue.round().toString(),
            onChanged: (v) => setState(() => _discreteValue = v),
          ),
          Text('  值: ${_discreteValue.round()}',
               style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),

          const Text('RangeSlider 范围滑块:', style: TextStyle(fontWeight: FontWeight.w600)),
          RangeSlider(
            values: _rangeValue,
            min: 0,
            max: 100,
            divisions: 10,
            labels: RangeLabels(
              _rangeValue.start.round().toString(),
              _rangeValue.end.round().toString(),
            ),
            onChanged: (v) => setState(() => _rangeValue = v),
          ),
          Text('  范围: ${_rangeValue.start.round()} - ${_rangeValue.end.round()}',
               style: Theme.of(context).textTheme.bodySmall),
          // ── 架构图：Slider 轨道截面 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：Slider 轨道截面',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _SliderTrackSection(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _SliderTrackSection extends StatelessWidget {
  const _SliderTrackSection();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          // Track visualization
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                // Inactive track (full width)
                Positioned.fill(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                // Secondary active
                Positioned(
                  left: 0, right: 80, top: 24, bottom: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                // Active track
                Positioned(
                  left: 0, right: 150, top: 24, bottom: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [cs.primary, cs.primary.withValues(alpha: 0.6)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                // Thumb
                Positioned(
                  left: 105, top: 16,
                  child: Container(
                    width: 28, height: 28,
                    decoration: BoxDecoration(
                      color: cs.primary,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: cs.primary.withValues(alpha: 0.4), blurRadius: 6)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Labels row
          Row(
            children: [
              _bandLabel(cs, 'activeTrack', cs.primary),
              _bandLabel(cs, 'secondaryActive', Colors.lightBlue),
              const Spacer(),
              _bandLabel(cs, 'thumb', cs.primary),
            ],
          ),
          Row(
            children: [
              _bandLabel(cs, 'inactiveTrack', Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Flexible(fit: FlexFit.loose, child: Text(
                    '从左到右：inactiveTrack（灰） → secondaryActive（浅） → active（主色） → thumb（滑块）',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bandLabel(ColorScheme cs, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 9, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}
