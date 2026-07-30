import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo061 extends StatelessWidget {
  const Demo061({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DemoFrame(
      articleId: '061',
      title: 'Image 图片加载',
      description:
          '使用 Icon 占位演示图片加载概念，包括 NetworkImage 与 AssetImage 示意。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('网络图片示意：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text('NetworkImage — 需要网络连接',
              style: theme.textTheme.bodySmall),
          const SizedBox(height: 20),
          Text('本地资源示意：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.folder_open_outlined,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text('AssetImage — 从本地 assets 加载',
              style: theme.textTheme.bodySmall),
          const SizedBox(height: 20),
          Text('占位符（加载失败）：', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.broken_image_outlined,
              size: 48,
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text('Image.network 失败时显示 errorBuilder',
              style: theme.textTheme.bodySmall),
          const SizedBox(height: 24),
          const Divider(),
          const Text('■ 架构图：Image 加载流程',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 12),
          // NetworkImage -> ImageCache (diamond) -> Decode -> Bitmap -> Canvas
          // Cache hit: direct to Bitmap
          Column(
            children: [
              // Step 1: NetworkImage
              _flowNode(context, 'NetworkImage', '网络请求\n图片 URL', Colors.blue, Icons.cloud_download),
              _flowDownArrow(context),
              // Step 2: ImageCache decision diamond
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.amber.withValues(alpha: 0.4)),
                ),
                child: Column(
                  children: [
                    Icon(Icons.help_outline, size: 18, color: Colors.amber.shade700),
                    const SizedBox(height: 2),
                    const Text('ImageCache\n缓存命中？',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Branch: hit and miss
              Row(
                children: [
                  // Cache HIT branch
                  Flexible(fit: FlexFit.loose, child: Column(
                      children: [
                        Text('命中',
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        _flowNode(context, 'Bitmap', '直接使用\n缓存图片', Colors.green, Icons.photo),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Cache MISS branch
                  Flexible(fit: FlexFit.loose, child: Column(
                      children: [
                        Text('未命中',
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.red.shade700,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        _flowNode(context, 'Decode', '解码图片\nBitmap 生成', Colors.orange, Icons.transform),
                        _flowDownArrow(context),
                        _flowNode(context, 'Bitmap', '内存中的\n位图数据', Colors.green, Icons.photo),
                      ],
                    ),
                  ),
                ],
              ),
              _flowDownArrow(context),
              // Step 5: Canvas
              _flowNode(context, 'Canvas', 'GPU 渲染\n显示到屏幕', Colors.purple, Icons.tv),
            ],
          ),
        ],
      ),
    );
  }

  Widget _flowNode(BuildContext context, String title, String desc, Color color, IconData icon) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(height: 2),
          Text(title,
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.bold, color: color)),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _flowDownArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Icon(Icons.arrow_downward, size: 14,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.35)),
    );
  }
}
