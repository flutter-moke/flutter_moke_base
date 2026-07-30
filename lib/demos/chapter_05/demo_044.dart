import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo044 extends StatefulWidget {
  const Demo044({super.key});
  @override
  State<Demo044> createState() => _Demo044State();
}

class _Demo044State extends State<Demo044> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _wifi = true;
  bool _bluetooth = false;

  @override
  Widget build(BuildContext context) {
    final activeCount = [_notifications, _darkMode, _wifi, _bluetooth].where((v) => v).length;

    return DemoFrame(
      articleId: '044',
      title: 'Switch 开关',
      description: 'Switch 开关组件演示。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: const Text('通知'),
            subtitle: const Text('接收推送通知'),
            secondary: Icon(_notifications ? Icons.notifications_active : Icons.notifications_off),
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
            contentPadding: EdgeInsets.zero,
          ),
          SwitchListTile(
            title: const Text('深色模式'),
            subtitle: const Text('使用深色主题'),
            secondary: Icon(_darkMode ? Icons.dark_mode : Icons.light_mode),
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
            contentPadding: EdgeInsets.zero,
          ),
          SwitchListTile(
            title: const Text('Wi-Fi'),
            subtitle: const Text('无线网络连接'),
            secondary: Icon(_wifi ? Icons.wifi : Icons.wifi_off),
            value: _wifi,
            onChanged: (v) => setState(() => _wifi = v),
            contentPadding: EdgeInsets.zero,
          ),
          SwitchListTile(
            title: const Text('蓝牙'),
            subtitle: const Text('蓝牙设备连接'),
            secondary: Icon(_bluetooth ? Icons.bluetooth : Icons.bluetooth_disabled),
            value: _bluetooth,
            onChanged: (v) => setState(() => _bluetooth = v),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('已开启 $activeCount/4 项功能'),
          ),
          // ── 架构图：Switch 渲染层 ──
          const SizedBox(height: 24),
          const Text('■ 架构图：Switch 渲染层',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          const _SwitchLayers(),
        ],
      ),
    );
  }
}

// ── Visualization Helpers ──

class _SwitchLayers extends StatelessWidget {
  const _SwitchLayers();

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
          Row(
            children: [
              // Switch visual with 3 layers
              SizedBox(
                width: 100,
                height: 48,
                child: Stack(
                  children: [
                    // Layer 1: track (bottom)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
                        ),
                      ),
                    ),
                    // Layer 2: thumb (middle)
                    const Positioned(
                      left: 4, top: 4, bottom: 4,
                      child: SizedBox(
                        width: 36,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                          ),
                          child: Icon(Icons.circle, size: 16, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                    // Layer 3: overlay (top)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: cs.primary.withValues(alpha: 0.08),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Labels
              Flexible(fit: FlexFit.loose, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _layerLabel(cs, 'overlay', 'overlayColor / splashRadius', Colors.purple),
                    _layerLabel(cs, 'thumb', 'thumbColor / thumbIcon', Colors.blueGrey),
                    _layerLabel(cs, 'track', 'trackColor / trackOutlineColor', Colors.grey),
                  ],
                ),
              ),
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
                Icon(Icons.layers, size: 14, color: Colors.grey),
                SizedBox(width: 6),
                Text('Stack 从底到顶：track → thumb → overlay',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _layerLabel(ColorScheme cs, String layer, String params, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(layer,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: color)),
          const SizedBox(width: 6),
          Text(params, style: TextStyle(fontSize: 9, color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }
}
