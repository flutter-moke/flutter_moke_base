/// Moke Theme — ThemeData 扩展与核心配置工程
///
/// ## 架构说明
/// 1. [MokeTheme] 是静态工厂，提供 `light` / `dark` 两个预置 [ThemeData]
/// 2. 通过 [ThemeExtension] 注册自定义 Token（色彩、排版），避免污染 Material 内建主题
/// 3. 所有配置均来自 [moke_colors.dart] 与 [moke_typography.dart]
///
/// ## 使用方式
/// ```dart
/// MaterialApp(
///   theme: MokeTheme.light,
///   darkTheme: MokeTheme.dark,
/// )
/// ```
library;

import 'package:flutter/material.dart';

import 'moke_colors.dart';
import 'moke_typography.dart';

/// Moke 主题工厂
class MokeTheme {
  MokeTheme._();

  /// 浅色主题
  static final ThemeData light = _build(_MokeThemeConfig.light());

  /// 深色主题
  static final ThemeData dark = _build(_MokeThemeConfig.dark());

  /// 核心构建方法
  static ThemeData _build(_MokeThemeConfig cfg) {
    final TextTheme textTheme = mokeTextTheme(
      primary: cfg.colors.textPrimary,
      secondary: cfg.colors.textSecondary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: cfg.brightness,

      // ── 色彩体系 ──
      colorScheme: cfg.colorScheme,
      scaffoldBackgroundColor: cfg.colors.surface,

      // ── 文字排版 ──
      textTheme: textTheme,
      primaryTextTheme: textTheme,

      // ── AppBar ──
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: true,
        backgroundColor: cfg.colors.surface,
        foregroundColor: cfg.colors.textPrimary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: MokeFontWeight.semiBold,
        ),
      ),

      // ── 卡片 ──
      cardTheme: CardThemeData(
        elevation: 0,
        color: cfg.colors.surfaceVariant,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: cfg.colors.divider),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),

      // ── 分割线 ──
      dividerTheme: DividerThemeData(
        color: cfg.colors.divider,
        thickness: 0.5,
        space: 1,
      ),

      // ── 底部导航 ──
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: cfg.colors.surface,
        selectedItemColor: cfg.colors.accent,
        unselectedItemColor: cfg.colors.textSecondary,
        type: BottomNavigationBarType.fixed,
      ),

      // ── FloatingActionButton ──
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: cfg.colors.accent,
        foregroundColor: Colors.white,
        elevation: 0,
        highlightElevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // ── 输入框 ──
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cfg.colors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: cfg.colors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: cfg.colors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: cfg.colors.accent, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // ── SnackBar ──
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),

      // ── 自定义 Token 扩展 ──
      extensions: [
        MokeSemanticColorsExtension(cfg.colors),
        MokeTextThemeExtension(textTheme: textTheme),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 内部：配置数据对象
// ═══════════════════════════════════════════════════════════════

class _MokeThemeConfig {
  _MokeThemeConfig({
    required this.brightness,
    required this.colors,
    required this.colorScheme,
  });

  final Brightness brightness;
  final MokeSemanticColors colors;
  final ColorScheme colorScheme;

  static _MokeThemeConfig light() {
    final colors = MokeSemanticColors.light;
    return _MokeThemeConfig(
      brightness: Brightness.light,
      colors: colors,
      colorScheme: ColorScheme.light(
        primary: colors.brand,
        secondary: colors.accent,
        surface: colors.surface,
        error: colors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: colors.textPrimary,
        outline: colors.divider,
      ),
    );
  }

  static _MokeThemeConfig dark() {
    final colors = MokeSemanticColors.dark;
    return _MokeThemeConfig(
      brightness: Brightness.dark,
      colors: colors,
      colorScheme: ColorScheme.dark(
        primary: colors.brand,
        secondary: colors.accent,
        surface: colors.surface,
        error: colors.error,
        onPrimary: const Color(0xFF1A1A1A),
        onSecondary: const Color(0xFF1A1A1A),
        onSurface: colors.textPrimary,
        outline: colors.divider,
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// ThemeExtension 注册
// ═══════════════════════════════════════════════════════════════

/// 语义色 [ThemeExtension]，注册到 ThemeData.extensions
class MokeSemanticColorsExtension
    extends ThemeExtension<MokeSemanticColorsExtension> {
  const MokeSemanticColorsExtension(this.colors);

  final MokeSemanticColors colors;

  @override
  MokeSemanticColorsExtension copyWith({MokeSemanticColors? colors}) =>
      MokeSemanticColorsExtension(colors ?? this.colors);

  @override
  MokeSemanticColorsExtension lerp(
    covariant MokeSemanticColorsExtension? other,
    double t,
  ) =>
      MokeSemanticColorsExtension(other?.colors ?? colors);
}
