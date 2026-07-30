/// Moke 排版系统 — 深度长文自媒体专用
///
/// ## 核心特性
/// - **黄金比例调阶**：以 1.25 为基准比例的模块化字阶（Major Third）
/// - **行距与行长**：针对移动端中文阅读优化（1.6-1.8 行高）
/// - **字重体系**：400-Regular / 500-Medium / 600-SemiBold / 700-Bold
/// - **Token 化**：所有尺寸通过 Token 映射，支持动态字号缩放（无障碍）
library;

import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════
// 1. Token 定义
// ═══════════════════════════════════════════════════════════════

/// 字号 Token (px)
class MokeFontSize {
  MokeFontSize._();

  static const double caption = 12;
  static const double bodySmall = 13;
  static const double body = 15;
  static const double bodyLarge = 17;
  static const double subtitle = 18;
  static const double title = 20;
  static const double headline = 24;
  static const double headlineLarge = 28;
  static const double display = 34;
  static const double displayLarge = 42;
}

/// 字重 Token
class MokeFontWeight {
  MokeFontWeight._();
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

/// 行高倍率（基于 fontSize）
class MokeLineHeight {
  MokeLineHeight._();

  /// 紧凑（标题、导航）
  static const double tight = 1.15;

  /// 默认（正文）
  static const double normal = 1.5;

  /// 宽松（长文、引文）
  static const double relaxed = 1.75;

  /// 极宽（展示型文字）
  static const double loose = 2.0;
}

// ═══════════════════════════════════════════════════════════════
// 2. TextTheme 工厂
// ═══════════════════════════════════════════════════════════════

/// 构建 Moke 排版主题
///
/// [baseline] 为基础字号倍率（无障碍缩放用），默认 1.0
/// [colorScheme] 可选，用于动态派生文字色
TextTheme mokeTextTheme({
  double baseline = 1.0,
  Color? primary,
  Color? secondary,
}) {
  // 字体缩放
  double s(double px) => px * baseline;

  // 默认文字色
  final Color textPrimary = primary ?? const Color(0xFF1A1A1A);
  final Color textSecondary = secondary ?? const Color(0xFF757575);

  return TextTheme(
    // ── Display / 大标题 ──
    displayLarge: TextStyle(
      fontSize: s(MokeFontSize.displayLarge),
      fontWeight: MokeFontWeight.bold,
      height: MokeLineHeight.tight,
      letterSpacing: -0.5,
      color: textPrimary,
    ),
    displayMedium: TextStyle(
      fontSize: s(MokeFontSize.display),
      fontWeight: MokeFontWeight.bold,
      height: MokeLineHeight.tight,
      letterSpacing: -0.3,
      color: textPrimary,
    ),

    // ── Headline / 章节标题 ──
    headlineLarge: TextStyle(
      fontSize: s(MokeFontSize.headlineLarge),
      fontWeight: MokeFontWeight.semiBold,
      height: MokeLineHeight.tight,
      color: textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: s(MokeFontSize.headline),
      fontWeight: MokeFontWeight.semiBold,
      height: MokeLineHeight.tight,
      color: textPrimary,
    ),

    // ── Title / 标题 ──
    titleLarge: TextStyle(
      fontSize: s(MokeFontSize.title),
      fontWeight: MokeFontWeight.medium,
      height: MokeLineHeight.normal,
      color: textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: s(MokeFontSize.subtitle),
      fontWeight: MokeFontWeight.medium,
      height: MokeLineHeight.normal,
      color: textPrimary,
    ),

    // ── Body / 正文 ──
    bodyLarge: TextStyle(
      fontSize: s(MokeFontSize.bodyLarge),
      fontWeight: MokeFontWeight.regular,
      height: MokeLineHeight.relaxed,
      letterSpacing: 0.15,
      color: textPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: s(MokeFontSize.body),
      fontWeight: MokeFontWeight.regular,
      height: MokeLineHeight.relaxed,
      letterSpacing: 0.1,
      color: textPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: s(MokeFontSize.bodySmall),
      fontWeight: MokeFontWeight.regular,
      height: MokeLineHeight.normal,
      letterSpacing: 0.05,
      color: textSecondary,
    ),

    // ── Label / 标签、按钮 ──
    labelLarge: TextStyle(
      fontSize: s(MokeFontSize.body),
      fontWeight: MokeFontWeight.medium,
      height: MokeLineHeight.tight,
      letterSpacing: 0.5,
      color: textPrimary,
    ),
    labelMedium: TextStyle(
      fontSize: s(MokeFontSize.bodySmall),
      fontWeight: MokeFontWeight.medium,
      height: MokeLineHeight.tight,
      letterSpacing: 0.3,
      color: textSecondary,
    ),
    labelSmall: TextStyle(
      fontSize: s(MokeFontSize.caption),
      fontWeight: MokeFontWeight.regular,
      height: MokeLineHeight.tight,
      letterSpacing: 0.2,
      color: textSecondary,
    ),
  );
}

// ═══════════════════════════════════════════════════════════════
// 3. 便捷扩展
// ═══════════════════════════════════════════════════════════════

extension MokeTypographyContext on BuildContext {
  /// 获取当前主题文本样式，为空时 fallback 到默认 Theme 的 TextTheme
  TextTheme get mokeTextTheme =>
      Theme.of(this).extension<MokeTextThemeExtension>()?.textTheme ??
      Theme.of(this).textTheme;
}

/// ThemeExtension 注册用（见 [MokeTheme]）
class MokeTextThemeExtension extends ThemeExtension<MokeTextThemeExtension> {
  const MokeTextThemeExtension({required this.textTheme});

  final TextTheme textTheme;

  @override
  MokeTextThemeExtension copyWith({TextTheme? textTheme}) =>
      MokeTextThemeExtension(textTheme: textTheme ?? this.textTheme);

  @override
  MokeTextThemeExtension lerp(
    covariant MokeTextThemeExtension? other,
    double t,
  ) =>
      MokeTextThemeExtension(
        textTheme: TextTheme.lerp(textTheme, other?.textTheme, t),
      );
}
