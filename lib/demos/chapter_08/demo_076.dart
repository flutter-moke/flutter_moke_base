import 'package:flutter/material.dart';
import '../demo_frame.dart';

class Demo076 extends StatelessWidget {
  const Demo076({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoFrame(
      articleId: '076',
      title: 'SimpleDialog 简单弹窗',
      description: 'SimpleDialog 提供选项列表供用户选择。',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击按钮弹出 SimpleDialog 选择账号类型。',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.select_all, size: 18),
            label: const Text('选择账号类型'),
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => SimpleDialog(
                title: const Text('选择账号类型'),
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(ctx).pop('个人');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('已选择：个人账号')),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('个人账号'),
                      subtitle: Text('适合个人开发者'),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(ctx).pop('企业');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('已选择：企业账号')),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.business),
                      title: Text('企业账号'),
                      subtitle: Text('适合团队和组织'),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(ctx).pop('教育');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('已选择：教育账号')),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.school),
                      title: Text('教育账号'),
                      subtitle: Text('适合教育机构'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
