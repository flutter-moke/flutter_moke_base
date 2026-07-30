/// Moke 调色板 — 自定义 [MaterialColor] 与语义色系统
///
/// ## 设计原则
/// - **墨水基调**：主色取自传统墨色，辅以朱砂、青花等东方色彩
/// - **语义明确**：每个色值名称即表意，避免"primary1"类模糊命名
/// - **Token 化**：所有色值通过 Token 映射，便于全局替换与暗黑适配
library;

import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════
// 1. 品牌主色调 — MaterialColor 定义
// ═══════════════════════════════════════════════════════════════

/// 墨黑 — 主品牌色（深灰偏暖，模拟墨色）
const MaterialColor mokeInkBlack = MaterialColor(
  0xFF2C2C2C,
  <int, Color>{
    50: Color(0xFFF5F5F5),
    100: Color(0xFFE0E0E0),
    200: Color(0xFFBDBDBD),
    300: Color(0xFF9E9E9E),
    400: Color(0xFF757575),
    500: Color(0xFF2C2C2C),
    600: Color(0xFF212121),
    700: Color(0xFF1A1A1A),
    800: Color(0xFF141414),
    900: Color(0xFF0D0D0D),
  },
);

/// 朱砂红 — 强调色/行动色（暖红偏橙）
const MaterialColor mokeCinnabar = MaterialColor(
  0xFFD35F3A,
  <int, Color>{
    50: Color(0xFFFDF3EF),
    100: Color(0xFFF9DBD0),
    200: Color(0xFFF4BFAE),
    300: Color(0xFFEEA38C),
    400: Color(0xFFE8886A),
    500: Color(0xFFD35F3A),
    600: Color(0xFFBF4E2C),
    700: Color(0xFFA33E22),
    800: Color(0xFF87301A),
    900: Color(0xFF6B2312),
  },
);

/// 青花蓝 — 辅助色/链接色
const MaterialColor mokeBlue = MaterialColor(
  0xFF3B6B8A,
  <int, Color>{
    50: Color(0xFFF0F5F8),
    100: Color(0xFFD4E3EE),
    200: Color(0xFFB5CFE2),
    300: Color(0xFF95BBD6),
    400: Color(0xFF7AA8C9),
    500: Color(0xFF3B6B8A),
    600: Color(0xFF2F5A75),
    700: Color(0xFF244960),
    800: Color(0xFF1A384B),
    900: Color(0xFF102736),
  },
);

/// 宣纸白 — 背景/表面色
const MaterialColor mokePaper = MaterialColor(
  0xFFF8F6F0,
  <int, Color>{
    50: Color(0xFFFEFDFB),
    100: Color(0xFFFCFAF6),
    200: Color(0xFFFAF8F2),
    300: Color(0xFFF8F6F0),
    400: Color(0xFFF0EDE4),
    500: Color(0xFFE8E4D8),
    600: Color(0xFFDDD8C9),
    700: Color(0xFFCEC8B5),
    800: Color(0xFFBFB8A1),
    900: Color(0xFFB0A88D),
  },
);

// ═══════════════════════════════════════════════════════════════
// 2. 语义色 Token — 暗黑模式就绪
// ═══════════════════════════════════════════════════════════════

/// Moke 语义色集合
///
/// 使用方式：`context.mokeColors?.surface ?? MokeSemanticColors.light.surface`
class MokeSemanticColors {
  const MokeSemanticColors._({
    required this.brand,
    required this.accent,
    required this.surface,
    required this.surfaceVariant,
    required this.textPrimary,
    required this.textSecondary,
    required this.textOnSurface,
    required this.divider,
    required this.error,
    required this.success,
    required this.warning,
  });

  // ── 核心色 ──
  final Color brand; // 品牌主色
  final Color accent; // 强调色
  final Color surface; // 表面背景
  final Color surfaceVariant; // 表面变体（卡片、弹窗）

  // ── 文字色 ──
  final Color textPrimary;
  final Color textSecondary;
  final Color textOnSurface;

  // ── 功能色 ──
  final Color divider;
  final Color error;
  final Color success;
  final Color warning;

  // ═════════════════════════════════════════════════════════════
  // 3. 预置实例
  // ═════════════════════════════════════════════════════════════

  /// 浅色模式语义色
  static const MokeSemanticColors light = MokeSemanticColors._(
    brand: Color(0xFF2C2C2C),
    accent: Color(0xFFD35F3A),
    surface: Color(0xFFF8F6F0),
    surfaceVariant: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF757575),
    textOnSurface: Color(0xFF2C2C2C),
    divider: Color(0x1A2C2C2C),
    error: Color(0xFFB3261E),
    success: Color(0xFF2E7D32),
    warning: Color(0xFFE65100),
  );

  /// 深色模式语义色
  static const MokeSemanticColors dark = MokeSemanticColors._(
    brand: Color(0xFFE0E0E0),
    accent: Color(0xFFEEA38C),
    surface: Color(0xFF1A1A1A),
    surfaceVariant: Color(0xFF2C2C2C),
    textPrimary: Color(0xFFF5F5F5),
    textSecondary: Color(0xFFBDBDBD),
    textOnSurface: Color(0xFFE0E0E0),
    divider: Color(0x33FFFFFF),
    error: Color(0xFFF2B8B5),
    success: Color(0xFF81C784),
    warning: Color(0xFFFFB74D),
  );

  /// 根据 Brightness 选择对应语义色
  factory MokeSemanticColors.of(Brightness brightness) =>
      brightness == Brightness.dark ? dark : light;
}

// ═══════════════════════════════════════════════════════════════
// 4. 扩展便捷访问
// ═══════════════════════════════════════════════════════════════

extension MokeColorsContext on BuildContext {
  /// 获取当前主题下的语义色
  MokeSemanticColors get mokeColors =>
      MokeSemanticColors.of(Theme.of(this).brightness);
}
