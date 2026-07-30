/// Moke Chapter Manifest — 15 章元数据与 128 篇文章清单
///
/// 本文档是 flutter_moke 应用的核心数据源，每条记录对应 articles/ 下的一篇文章。
/// 维护提示：增删文章时同步更新此处和 demo 注册。
library;

import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════
// 单篇文章元数据
// ═══════════════════════════════════════════════════════════════

class ArticleInfo {
  const ArticleInfo({
    required this.id,
    required this.title,
    this.icon = Icons.article_outlined,
    this.subtitle,
  });

  /// 三位数字编号，如 '001', '128'
  final String id;

  /// 文章标题
  final String title;

  /// 列表图标
  final IconData icon;

  /// 一句简述（可选）
  final String? subtitle;
}

// ═══════════════════════════════════════════════════════════════
// 章节元数据
// ═══════════════════════════════════════════════════════════════

class ChapterInfo {
  const ChapterInfo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.articles,
  });

  /// 两位数字编号，如 '01', '15'
  final String id;

  /// 章节标题
  final String title;

  /// 简短描述
  final String subtitle;

  /// 章节图标
  final IconData icon;

  /// 文章列表
  final List<ArticleInfo> articles;

  int get articleCount => articles.length;
}

// ═══════════════════════════════════════════════════════════════
// 全 15 章数据
// ═══════════════════════════════════════════════════════════════

final List<ChapterInfo> chapters = [
  // ── 01-开发环境搭建 ──
  const ChapterInfo(
    id: '01',
    title: '开发环境搭建',
    subtitle: '从零开始，准备好你的 Flutter 工坊',
    icon: Icons.build_outlined,
    articles: [
      ArticleInfo(id: '001', title: 'Flutter 概述与市场前景', icon: Icons.trending_up),
      ArticleInfo(id: '002', title: 'macOS 开发环境搭建', icon: Icons.computer),
      ArticleInfo(id: '003', title: 'Windows 开发环境搭建', icon: Icons.computer),
      ArticleInfo(id: '004', title: 'VS Code 与 Android Studio 配置', icon: Icons.code),
      ArticleInfo(id: '005', title: 'Dart 语言快速入门', icon: Icons.language),
      ArticleInfo(id: '006', title: '创建并运行第一个 Flutter 项目', icon: Icons.rocket_launch),
      ArticleInfo(id: '007', title: 'Flutter 项目结构详解', icon: Icons.folder_open),
    ],
  ),

  // ── 02-框架与结构 ──
  const ChapterInfo(
    id: '02',
    title: '框架与结构',
    subtitle: '理解 Widget 树与 Material 设计体系',
    icon: Icons.account_tree_outlined,
    articles: [
      ArticleInfo(id: '008', title: 'Widget 核心概念', icon: Icons.widgets),
      ArticleInfo(id: '009', title: 'MaterialApp 深度解析', icon: Icons.app_settings_alt),
      ArticleInfo(id: '010', title: 'Scaffold 结构化布局', icon: Icons.grid_view),
      ArticleInfo(id: '011', title: 'Theme 主题系统与 Material 3', icon: Icons.palette),
      ArticleInfo(id: '012', title: 'ScaffoldMessenger 全局通知', icon: Icons.notifications),
    ],
  ),

  // ── 03-布局组件 ──
  const ChapterInfo(
    id: '03',
    title: '布局组件',
    subtitle: '从 Container 到 Flex，掌控页面每一寸空间',
    icon: Icons.space_dashboard_outlined,
    articles: [
      ArticleInfo(id: '013', title: 'Container 万能容器', icon: Icons.crop_square),
      ArticleInfo(id: '014', title: 'Row 与 Column 线性布局', icon: Icons.view_column),
      ArticleInfo(id: '015', title: 'Stack 层叠布局', icon: Icons.layers),
      ArticleInfo(id: '016', title: 'Expanded 与 Flexible', icon: Icons.straighten),
      ArticleInfo(id: '017', title: 'SizedBox / Padding / Align / Center', icon: Icons.square),
      ArticleInfo(id: '018', title: 'Wrap 与 Flow 流式布局', icon: Icons.wrap_text),
      ArticleInfo(id: '019', title: 'AspectRatio 与 ConstrainedBox', icon: Icons.aspect_ratio),
      ArticleInfo(id: '020', title: 'Card 卡片组件', icon: Icons.credit_card),
      ArticleInfo(id: '021', title: 'ListTile 列表图块', icon: Icons.list_alt),
      ArticleInfo(id: '022', title: 'GridTile 网格图块', icon: Icons.grid_on),
      ArticleInfo(id: '023', title: 'GridTileBar 网格图块栏', icon: Icons.grid_view),
      ArticleInfo(id: '024', title: 'Divider 分割线', icon: Icons.horizontal_rule),
      ArticleInfo(id: '025', title: 'ButtonBar 按钮组', icon: Icons.auto_awesome_mosaic),
      ArticleInfo(id: '026', title: 'BottomAppBar 底部应用栏', icon: Icons.view_agenda),
      ArticleInfo(id: '027', title: 'FlexibleSpaceBar 弹性空间栏', icon: Icons.vertical_align_top),
    ],
  ),

  // ── 04-按钮组件 ──
  const ChapterInfo(
    id: '04',
    title: '按钮组件',
    subtitle: '从点击到反馈，掌握 Flutter 按钮全家桶',
    icon: Icons.smart_button_outlined,
    articles: [
      ArticleInfo(id: '028', title: 'ElevatedButton 填充按钮', icon: Icons.smart_button),
      ArticleInfo(id: '029', title: 'TextButton 文字按钮', icon: Icons.text_fields),
      ArticleInfo(id: '030', title: 'OutlinedButton 描边按钮', icon: Icons.border_style),
      ArticleInfo(id: '031', title: 'FilledButton 填充按钮 (M3)', icon: Icons.smart_button),
      ArticleInfo(id: '032', title: 'IconButton 图标按钮', icon: Icons.touch_app),
      ArticleInfo(id: '033', title: 'FloatingActionButton 浮动按钮', icon: Icons.add_circle),
      ArticleInfo(id: '034', title: 'SegmentedButton 分段按钮', icon: Icons.segment),
      ArticleInfo(id: '035', title: 'ToggleButtons 切换按钮组', icon: Icons.toggle_off),
      ArticleInfo(id: '036', title: '按钮样式体系详解', icon: Icons.style),
    ],
  ),

  // ── 05-输入与表单 ──
  const ChapterInfo(
    id: '05',
    title: '输入与表单',
    subtitle: '文本输入、选择器与表单验证',
    icon: Icons.edit_note_outlined,
    articles: [
      ArticleInfo(id: '037', title: 'TextField 文本输入框', icon: Icons.text_fields),
      ArticleInfo(id: '038', title: 'TextFormField 表单输入框', icon: Icons.text_format),
      ArticleInfo(id: '039', title: 'InputDecoration 输入装饰', icon: Icons.palette_outlined),
      ArticleInfo(id: '040', title: 'Form 与 FormState', icon: Icons.description),
      ArticleInfo(id: '041', title: 'Checkbox 复选框', icon: Icons.check_box),
      ArticleInfo(id: '042', title: 'Radio 单选按钮', icon: Icons.radio_button_checked),
      ArticleInfo(id: '043', title: 'RadioListTile 单选列表', icon: Icons.list_alt),
      ArticleInfo(id: '044', title: 'Switch 开关', icon: Icons.toggle_on),
      ArticleInfo(id: '045', title: 'Slider 滑块', icon: Icons.slideshow),
      ArticleInfo(id: '046', title: 'DropdownButton 下拉按钮', icon: Icons.arrow_drop_down),
      ArticleInfo(id: '047', title: 'Autocomplete 自动补全', icon: Icons.auto_fix_high),
      ArticleInfo(id: '048', title: 'SelectableText 可选文本', icon: Icons.text_snippet),
      ArticleInfo(id: '049', title: 'InputDecorator 与 DatePicker', icon: Icons.calendar_month),
    ],
  ),

  // ── 06-导航组件 ──
  const ChapterInfo(
    id: '06',
    title: '导航组件',
    subtitle: 'AppBar、TabBar、Drawer 与路由体系',
    icon: Icons.navigation_outlined,
    articles: [
      ArticleInfo(id: '050', title: 'AppBar 顶部应用栏', icon: Icons.web_asset),
      ArticleInfo(id: '051', title: 'SliverAppBar 可折叠顶栏', icon: Icons.vertical_distribute),
      ArticleInfo(id: '052', title: 'NavigationBar 底部导航 (M3)', icon: Icons.navigation),
      ArticleInfo(id: '053', title: 'BottomNavigationBar 传统底部导航', icon: Icons.navigation),
      ArticleInfo(id: '054', title: 'NavigationRail 侧边导航', icon: Icons.railway_alert),
      ArticleInfo(id: '055', title: 'TabBar 标签栏', icon: Icons.tab),
      ArticleInfo(id: '056', title: 'Drawer 抽屉导航', icon: Icons.draw),
      ArticleInfo(id: '057', title: 'NavigationDrawer 导航抽屉 (M3)', icon: Icons.draw),
      ArticleInfo(id: '058', title: 'SearchBar 搜索栏', icon: Icons.search),
      ArticleInfo(id: '059', title: '导航体系与路由', icon: Icons.alt_route),
    ],
  ),

  // ── 07-信息展示组件 ──
  const ChapterInfo(
    id: '07',
    title: '信息展示组件',
    subtitle: '文本、图片、图标、Chip、表格与徽章',
    icon: Icons.info_outline,
    articles: [
      ArticleInfo(id: '060', title: 'Text 与 RichText', icon: Icons.text_fields),
      ArticleInfo(id: '061', title: 'Image 图片加载', icon: Icons.image),
      ArticleInfo(id: '062', title: 'Icon 图标', icon: Icons.emoji_symbols),
      ArticleInfo(id: '063', title: 'Chip 标签', icon: Icons.label),
      ArticleInfo(id: '064', title: 'ActionChip 动作标签', icon: Icons.flash_on),
      ArticleInfo(id: '065', title: 'ChoiceChip 选择标签', icon: Icons.toggle_off),
      ArticleInfo(id: '066', title: 'FilterChip 筛选标签', icon: Icons.filter_alt),
      ArticleInfo(id: '067', title: 'InputChip 输入标签', icon: Icons.input),
      ArticleInfo(id: '068', title: 'Badge 徽章', icon: Icons.badge),
      ArticleInfo(id: '069', title: 'CircleAvatar 圆形头像', icon: Icons.account_circle),
      ArticleInfo(id: '070', title: 'DataTable 数据表格', icon: Icons.table_chart),
      ArticleInfo(id: '071', title: 'PaginatedDataTable 分页表格', icon: Icons.table_rows),
      ArticleInfo(id: '072', title: 'Tooltip 提示工具', icon: Icons.tips_and_updates),
      ArticleInfo(id: '073', title: 'CarouselView 轮播视图', icon: Icons.view_carousel),
      ArticleInfo(id: '074', title: 'AboutDialog 与 LicensePage', icon: Icons.info),
    ],
  ),

  // ── 08-反馈与弹窗 ──
  const ChapterInfo(
    id: '08',
    title: '反馈与弹窗',
    subtitle: 'Dialog、SnackBar、BottomSheet 与 Banner',
    icon: Icons.feedback_outlined,
    articles: [
      ArticleInfo(id: '075', title: 'AlertDialog 警告弹窗', icon: Icons.warning_amber),
      ArticleInfo(id: '076', title: 'SimpleDialog 简单弹窗', icon: Icons.widgets),
      ArticleInfo(id: '077', title: 'Dialog 自定义弹窗', icon: Icons.widgets),
      ArticleInfo(id: '078', title: 'BottomSheet 底部面板', icon: Icons.vertical_align_bottom),
      ArticleInfo(id: '079', title: 'SnackBar 消息条', icon: Icons.notifications),
      ArticleInfo(id: '080', title: 'MaterialBanner 横幅通知', icon: Icons.flag),
    ],
  ),

  // ── 09-菜单与选择 ──
  const ChapterInfo(
    id: '09',
    title: '菜单与选择',
    subtitle: '下拉菜单、右键菜单与选择器',
    icon: Icons.menu_outlined,
    articles: [
      ArticleInfo(id: '081', title: 'PopupMenuButton 弹出菜单', icon: Icons.more_vert),
      ArticleInfo(id: '082', title: 'MenuAnchor 菜单锚点', icon: Icons.anchor),
      ArticleInfo(id: '083', title: 'MenuBar 菜单栏', icon: Icons.menu),
      ArticleInfo(id: '084', title: 'MenuItemButton 与 SubmenuButton', icon: Icons.menu_open),
      ArticleInfo(id: '085', title: 'CheckboxMenuButton 勾选菜单', icon: Icons.checklist),
    ],
  ),

  // ── 10-列表与滚动 ──
  const ChapterInfo(
    id: '10',
    title: '列表与滚动',
    subtitle: 'ListView、GridView、Sliver 与滚动控制',
    icon: Icons.list_alt_outlined,
    articles: [
      ArticleInfo(id: '086', title: 'ListView 列表', icon: Icons.list),
      ArticleInfo(id: '087', title: 'GridView 网格', icon: Icons.grid_view),
      ArticleInfo(id: '088', title: 'CustomScrollView 与 Sliver', icon: Icons.auto_stories),
      ArticleInfo(id: '089', title: 'SingleChildScrollView 单子滚动', icon: Icons.swipe_vertical),
      ArticleInfo(id: '090', title: 'PageView 页面视图', icon: Icons.swipe),
      ArticleInfo(id: '091', title: 'NestedScrollView 嵌套滚动', icon: Icons.layers),
      ArticleInfo(id: '092', title: 'ScrollController 与 ScrollPhysics', icon: Icons.tune),
      ArticleInfo(id: '093', title: 'RefreshIndicator 下拉刷新', icon: Icons.refresh),
      ArticleInfo(id: '094', title: 'ExpansionTile 可展开列表', icon: Icons.expand_more),
      ArticleInfo(id: '095', title: 'ExpansionPanelList 面板列表', icon: Icons.extension),
      ArticleInfo(id: '096', title: 'Stepper 步骤条', icon: Icons.linear_scale),
      ArticleInfo(id: '097', title: 'ReorderableListView 拖拽排序', icon: Icons.drag_indicator),
      ArticleInfo(id: '098', title: 'Scrollbar 滚动条', icon: Icons.swipe_vertical),
    ],
  ),

  // ── 11-日期与时间 ──
  const ChapterInfo(
    id: '11',
    title: '日期与时间',
    subtitle: '日期选择器、时间选择器与日历',
    icon: Icons.calendar_month_outlined,
    articles: [
      ArticleInfo(id: '099', title: 'showDatePicker 日期选择', icon: Icons.calendar_today),
      ArticleInfo(id: '100', title: 'DatePickerDialog 与 CalendarDatePicker', icon: Icons.calendar_month),
      ArticleInfo(id: '101', title: 'DateRangePickerDialog 范围选择', icon: Icons.date_range),
      ArticleInfo(id: '102', title: 'showTimePicker 时间选择', icon: Icons.access_time),
    ],
  ),

  // ── 12-进度指示 ──
  const ChapterInfo(
    id: '12',
    title: '进度指示',
    subtitle: '圆形进度、线性进度与加载动画',
    icon: Icons.hourglass_bottom,
    articles: [
      ArticleInfo(id: '103', title: 'CircularProgressIndicator 圆形进度', icon: Icons.radar),
      ArticleInfo(id: '104', title: 'LinearProgressIndicator 线性进度', icon: Icons.show_chart),
    ],
  ),

  // ── 13-装饰与样式 ──
  const ChapterInfo(
    id: '13',
    title: '装饰与样式',
    subtitle: 'InkWell、BoxDecoration、渐变与阴影',
    icon: Icons.format_paint_outlined,
    articles: [
      ArticleInfo(id: '105', title: 'InkWell 与 InkResponse', icon: Icons.touch_app),
      ArticleInfo(id: '106', title: 'Ink 墨迹绘制', icon: Icons.brush),
      ArticleInfo(id: '107', title: 'Material 组件基底', icon: Icons.view_quilt),
      ArticleInfo(id: '108', title: 'BoxDecoration 盒子装饰', icon: Icons.design_services),
      ArticleInfo(id: '109', title: 'Border / BorderRadius / ShapeBorder', icon: Icons.border_style),
      ArticleInfo(id: '110', title: 'BoxShadow 盒子阴影', icon: Icons.blur_on),
      ArticleInfo(id: '111', title: 'Gradient 渐变', icon: Icons.gradient),
    ],
  ),

  // ── 14-动画系统 ──
  const ChapterInfo(
    id: '14',
    title: '动画系统',
    subtitle: 'AnimationController、Tween、Hero 与隐式动画',
    icon: Icons.animation_outlined,
    articles: [
      ArticleInfo(id: '112', title: 'AnimationController 指南', icon: Icons.play_circle),
      ArticleInfo(id: '113', title: 'Tween 补间动画', icon: Icons.compare_arrows),
      ArticleInfo(id: '114', title: 'Curves 缓动曲线', icon: Icons.timeline),
      ArticleInfo(id: '115', title: 'AnimatedBuilder 与显式动画', icon: Icons.build),
      ArticleInfo(id: '116', title: 'AnimatedSwitcher 与 AnimatedCrossFade', icon: Icons.swap_horiz),
      ArticleInfo(id: '117', title: '隐式动画系列 AnimatedContainer', icon: Icons.animation),
      ArticleInfo(id: '118', title: 'Hero 共享元素过渡', icon: Icons.flight),
      ArticleInfo(id: '119', title: 'TweenAnimationBuilder 自动动画', icon: Icons.auto_awesome),
    ],
  ),

  // ── 15-实战与进阶 ──
  const ChapterInfo(
    id: '15',
    title: '实战与进阶',
    subtitle: '完整 App、状态管理、性能优化与发布上架',
    icon: Icons.rocket_outlined,
    articles: [
      ArticleInfo(id: '120', title: '待办清单 App', icon: Icons.checklist),
      ArticleInfo(id: '121', title: '记账 App', icon: Icons.account_balance),
      ArticleInfo(id: '122', title: '状态管理方案对比', icon: Icons.compare_arrows),
      ArticleInfo(id: '123', title: '网络请求与 API 调用', icon: Icons.cloud),
      ArticleInfo(id: '124', title: '本地存储方案对比', icon: Icons.storage),
      ArticleInfo(id: '125', title: 'Flutter 性能优化', icon: Icons.speed),
      ArticleInfo(id: '126', title: 'Material 3 主题定制', icon: Icons.palette),
      ArticleInfo(id: '127', title: '国际化与无障碍', icon: Icons.language),
      ArticleInfo(id: '128', title: '打包发布上架指南', icon: Icons.publish),
    ],
  ),
];

/// 根据文章 ID 查找章节
ChapterInfo? findChapterByArticleId(String articleId) {
  for (final chapter in chapters) {
    for (final article in chapter.articles) {
      if (article.id == articleId) return chapter;
    }
  }
  return null;
}

/// 根据文章 ID 查找文章信息
ArticleInfo? findArticleById(String articleId) {
  for (final chapter in chapters) {
    for (final article in chapter.articles) {
      if (article.id == articleId) return article;
    }
  }
  return null;
}
