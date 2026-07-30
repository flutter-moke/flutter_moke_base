/// Moke ButtonStyle — WidgetStateProperty 状态按钮包
///
/// ## 设计目的
/// 基于 [ButtonStyle] 体系构建 Moke 专属按钮组件，覆盖：
/// - [MokeTextButton] — 文字按钮
/// - [MokeOutlinedButton] — 描边按钮
/// - [MokeFilledButton] — 填充按钮
/// - [MokeTonalButton] — 色调按钮
///
/// ## 核心机制
/// 所有按钮通过 [WidgetStateProperty] 实现状态映射，而非 if-else 分支。
/// 这使得按钮样式天然支持 hover / focus / pressed / disabled 四种状态。
library;

import 'package:flutter/material.dart';

import '../01_theme_tokens/moke_colors.dart';

// ═══════════════════════════════════════════════════════════════
// 1. 基础 Style 工厂
// ═══════════════════════════════════════════════════════════════

/// Moke 按钮主题 — 集中管理所有按钮样式
class MokeButtonTheme {
  MokeButtonTheme._();

  /// 生成全局按钮 [ButtonThemeData]
  static ButtonThemeData standard(BuildContext context) {
    final mokeColors = context.mokeColors;
    return ButtonThemeData(
      buttonColor: mokeColors.accent,
      disabledColor: mokeColors.divider,
      highlightColor: mokeColors.accent.withValues(alpha: 0.12),
      splashColor: mokeColors.accent.withValues(alpha: 0.24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 2. 具体按钮组件
// ═══════════════════════════════════════════════════════════════

/// Moke 填充按钮
class MokeFilledButton extends StatelessWidget {
  const MokeFilledButton({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final mokeColors = context.mokeColors;
    return FilledButton(
      onPressed: onPressed,
      style: style ??
          FilledButton.styleFrom(
            backgroundColor: mokeColors.accent,
            foregroundColor: Colors.white,
            disabledBackgroundColor: mokeColors.divider,
            disabledForegroundColor: mokeColors.textSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
      child: child,
    );
  }
}

/// Moke 描边按钮
class MokeOutlinedButton extends StatelessWidget {
  const MokeOutlinedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final mokeColors = context.mokeColors;
    return OutlinedButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return mokeColors.textSecondary;
              }
              return mokeColors.accent;
            }),
            side: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide(color: mokeColors.divider);
              }
              return BorderSide(color: mokeColors.accent);
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
      child: child,
    );
  }
}

/// Moke 文字按钮
class MokeTextButton extends StatelessWidget {
  const MokeTextButton({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final mokeColors = context.mokeColors;
    return TextButton(
      onPressed: onPressed,
      style: style ??
          TextButton.styleFrom(
            foregroundColor: mokeColors.accent,
            disabledForegroundColor: mokeColors.textSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
      child: child,
    );
  }
}

/// Moke 色调按钮
class MokeTonalButton extends StatelessWidget {
  const MokeTonalButton({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final mokeColors = context.mokeColors;
    return FilledButton.tonal(
      onPressed: onPressed,
      style: style ??
          FilledButton.styleFrom(
            backgroundColor: mokeColors.accent.withValues(alpha: 0.16),
            foregroundColor: mokeColors.accent,
            disabledBackgroundColor: mokeColors.divider,
            disabledForegroundColor: mokeColors.textSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
      child: child,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// 3. WidgetStateProperty 工具函数
// ═══════════════════════════════════════════════════════════════

/// 便捷：基于状态的 BorderSide 解析器
class WidgetStateBorderSide {
  WidgetStateBorderSide._();

  /// 创建一个 [WidgetStateProperty<BorderSide>] 带状态机
  static WidgetStateProperty<BorderSide> resolve({
    required BorderSide Function(Set<WidgetState> states) stateMachine,
  }) {
    return WidgetStateProperty.resolveWith(stateMachine);
  }
}
