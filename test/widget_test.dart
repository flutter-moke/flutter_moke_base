/// Moke 组件冒烟测试
///
/// 验证所有核心组件能正常构建渲染。
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_moke/main.dart' as app;

void main() {
  testWidgets('应用启动冒烟测试', (WidgetTester tester) async {
    // 通过主入口启动
    app.main();
    await tester.pumpAndSettle();

    // 验证首页内容
    expect(find.text('Flutter Moke'), findsOneWidget);
    expect(find.text('专栏内容'), findsOneWidget);
  });

  testWidgets('页面切换不崩溃测试', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // 验证所有标签可切换
    const pages = ['主题', '按钮', '表单', '反馈', '路由'];
    for (final page in pages) {
      await tester.tap(find.text(page));
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
    }
  });
}
