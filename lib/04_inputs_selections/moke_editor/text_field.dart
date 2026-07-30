/// Moke Text Field — TextField 深度定制与光标定位
///
/// ## 定制要点
/// 1. **装饰器体系**：统一 InputDecoration 配置，减少样板代码
/// 2. **光标控制**：精确光标定位与书签跳转
/// 3. **状态反馈**：错误/成功/警告三态视觉反馈
/// 4. **字数统计**：内置中英文混合字数统计
library;

import 'package:flutter/material.dart';

import 'controller.dart';

/// Moke 文本输入框
class MokeTextField extends StatefulWidget {
  const MokeTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.fillColor,
    this.borderRadius = 8,
    this.showCharCount = false,
    this.showCursor = true,
  });

  final MokeEditorController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Color? fillColor;
  final double borderRadius;
  final bool showCharCount;
  final bool showCursor;

  @override
  State<MokeTextField> createState() => _MokeTextFieldState();
}

class _MokeTextFieldState extends State<MokeTextField> {
  late MokeEditorController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? MokeEditorController();
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.colorScheme.outline;

    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      textAlign: widget.textAlign,
      showCursor: widget.showCursor,
      cursorColor: theme.colorScheme.primary,

      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,

      style: widget.textStyle ?? theme.textTheme.bodyLarge,

      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: widget.fillColor ?? theme.colorScheme.surface,
        counterText: widget.showCharCount ? null : '',

        // ── 边框 ──
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: borderColor.withValues(alpha: 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:
              BorderSide(color: theme.colorScheme.error, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: borderColor.withValues(alpha: 0.2)),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
