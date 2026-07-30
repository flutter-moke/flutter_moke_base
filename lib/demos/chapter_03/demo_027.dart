import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo027 extends StatefulWidget {
  const Demo027({super.key});
  @override
  State<Demo027> createState() => _Demo027State();
}

class _Demo027State extends State<Demo027> {
  double _collapseProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '027',
      title: 'FlexibleSpaceBar 弹性空间栏',
      description: 'SliverAppBar 与 FlexibleSpaceBar 演示',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('模拟折叠进度', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),

          // ── Visual preview ──
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                // Background gradient (simulating FlexibleSpaceBar styling)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade700,
                          Colors.blue.shade400,
                          Colors.blue.shade200,
                        ],
                      ),
                    ),
                  ),
                ),

                // Space image overlay (simulating background image)
                Positioned.fill(
                  child: Opacity(
                    opacity: 1.0 - _collapseProgress * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withValues(alpha: 0.15),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Title that moves from center to appbar
                Positioned(
                  left: 16,
                  bottom: _collapseProgress < 0.5
                      ? 16 + (1 - _collapseProgress * 2) * 20
                      : 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main title (fades and shrinks)
                      Opacity(
                        opacity: 1.0 - _collapseProgress,
                        child: Transform.scale(
                          scale: 1.0 - _collapseProgress * 0.3,
                          child: Text(
                            '壮丽山川',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28 - _collapseProgress * 8,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Subtitle (appears at low collapse)
                      if (_collapseProgress < 0.7)
                        Padding(
                          padding: EdgeInsets.only(top: 4 * (1 - _collapseProgress / 0.7)),
                          child: Text(
                            '探索自然的魅力',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9 * (1 - _collapseProgress / 0.7)),
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Collapsed title (appears as collapse progresses)
                if (_collapseProgress > 0.5)
                  Positioned(
                    left: 16,
                    top: 12,
                    child: Opacity(
                      opacity: (_collapseProgress - 0.5) * 2,
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '壮丽山川',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Slider ──
          const SizedBox(height: 4),
          Text(
            '折叠进度: ${(_collapseProgress * 100).toInt()}%',
            style: theme.textTheme.bodySmall,
          ),
          Slider(
            value: _collapseProgress,
            min: 0.0,
            max: 1.0,
            divisions: 20,
            label: '${(_collapseProgress * 100).toInt()}%',
            onChanged: (v) => setState(() => _collapseProgress = v),
          ),

          // ── State labels ──
          Row(
            children: [
              _stateChip(
                '展开状态 (0%)',
                _collapseProgress < 0.3,
                Colors.green,
              ),
              const SizedBox(width: 8),
              _stateChip(
                '过渡状态 (30-70%)',
                _collapseProgress >= 0.3 && _collapseProgress <= 0.7,
                Colors.orange,
              ),
              const SizedBox(width: 8),
              _stateChip(
                '折叠状态 (70%+)',
                _collapseProgress > 0.7,
                Colors.blue,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            'FlexibleSpaceBar 通常用于 SliverAppBar 中，'
            '在滚动时产生折叠/展开的视差效果。'
            '标题在展开时居中显示，折叠时缩小并移至 AppBar 位置。',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _stateChip(String label, bool active, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: active ? color.withValues(alpha: 0.2) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: active ? color : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
          color: active ? color : Colors.grey,
        ),
      ),
    );
  }
}
