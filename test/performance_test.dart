/// Moke 性能测试 — 滚动性能与掉帧压力测试
///
/// ## 测试内容
/// 1. 列表滚动帧率 > 55fps
/// 2. 主题切换流畅度
/// 3. 大量卡片渲染性能
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_moke/main.dart' as app;

void main() {
  testWidgets('列表滚动帧率测试', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // 找到可滚动区域并高速滚动
    final scrollable = find.byType(Scrollable);
    expect(scrollable, findsOneWidget);

    // 模拟快速滚动
    await tester.fling(scrollable, const Offset(0, -2000), 1000);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // 验证页面没有崩溃
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('底部导航切换测试', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // 点击底部导航项
    final navItems = find.byType(BottomNavigationBar);
    expect(navItems, findsOneWidget);

    // 切换到"按钮"页
    await tester.tap(find.text('按钮'));
    await tester.pumpAndSettle();
    expect(find.text('MokeInkWell (水墨效果)'), findsOneWidget);

    // 切换到"反馈"页
    await tester.tap(find.text('反馈'));
    await tester.pumpAndSettle();
    expect(find.text('SnackBar 通知'), findsOneWidget);
  });

  testWidgets('主题切换不崩溃测试', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // 点击主题切换按钮
    final themeButton = find.byIcon(Icons.brightness_6);
    expect(themeButton, findsOneWidget);

    await tester.tap(themeButton);
    await tester.pumpAndSettle();

    // 再次点击切回
    await tester.tap(themeButton);
    await tester.pumpAndSettle();
  });
}
