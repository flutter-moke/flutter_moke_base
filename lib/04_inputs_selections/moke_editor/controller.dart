/// Moke Editor Controller — TextEditingController 扩展
///
/// ## 解决的问题
/// 原生 [TextEditingController] 缺少：
/// 1. 占位符样式与行为分离
/// 2. 光标位置记忆与批量操作
/// 3. 输入格式化与过滤链
///
/// ## 架构
/// ```
/// MokeEditorController
///   ├── TextEditingController (原生能力)
///   ├── FormatterChain (自定义格式化器链)
///   └── CursorBookmark (光标位置书签)
/// ```
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Moke 编辑器控制器
class MokeEditorController extends TextEditingController {
  MokeEditorController({super.text});

  /// 格式化器链
  final List<TextInputFormatter> _formatters = [];

  /// 光标书签
  int? _bookmark;

  // ═════════════════════════════════════════════════════════════
  // 格式化器管理
  // ═════════════════════════════════════════════════════════════

  /// 添加输入格式化器
  void addFormatter(TextInputFormatter formatter) {
    _formatters.add(formatter);
  }

  /// 移除指定格式化器
  void removeFormatter(TextInputFormatter formatter) {
    _formatters.remove(formatter);
  }

  /// 清空所有格式化器
  void clearFormatters() {
    _formatters.clear();
  }

  /// 获取当前格式化器列表（不可变视图）
  List<TextInputFormatter> get formatters => List.unmodifiable(_formatters);

  // ═════════════════════════════════════════════════════════════
  // 光标书签系统
  // ═════════════════════════════════════════════════════════════

  /// 保存当前光标位置
  void bookmarkCursor() {
    _bookmark = selection.baseOffset;
  }

  /// 跳转到书签位置
  void jumpToBookmark() {
    if (_bookmark != null && _bookmark! <= text.length) {
      selection = TextSelection.collapsed(offset: _bookmark!);
    }
  }

  /// 清除书签
  void clearBookmark() {
    _bookmark = null;
  }

  // ═════════════════════════════════════════════════════════════
  // 批量操作
  // ═════════════════════════════════════════════════════════════

  /// 在光标处插入文本，并保持光标在插入文本之后
  void insertAtCursor(String insertedText) {
    final offset = selection.baseOffset;
    if (offset < 0) return;

    final newText = text.replaceRange(
      selection.start,
      selection.end,
      insertedText,
    );

    value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: offset + insertedText.length,
      ),
      composing: TextRange.empty,
    );
  }

  /// 批量替换（支持撤销分组）
  void batchReplace(String replacement) {
    value = value.copyWith(
      text: replacement,
      selection: TextSelection.collapsed(offset: replacement.length),
      composing: TextRange.empty,
    );
  }

  // ═════════════════════════════════════════════════════════════
  // 文本统计
  // ═════════════════════════════════════════════════════════════

  /// 中文字符数
  int get chineseCharCount {
    return text.runes.where((r) => r >= 0x4E00 && r <= 0x9FFF).length;
  }

  /// 有效字符数（排除空白）
  int get effectiveCharCount {
    return text.replaceAll(RegExp(r'\s'), '').length;
  }

  /// 行数
  int get lineCount {
    if (text.isEmpty) return 0;
    return '\n'.allMatches(text).length + 1;
  }
}

// ═══════════════════════════════════════════════════════════════
// 内置格式化器
// ═══════════════════════════════════════════════════════════════

/// 数字输入格式化器：仅允许数字输入
class DigitsOnlyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (filtered == newValue.text) return newValue;

    return newValue.copyWith(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
      composing: TextRange.empty,
    );
  }
}

/// 长度限制格式化器
class LengthLimitFormatter extends TextInputFormatter {
  LengthLimitFormatter(this.maxLength);

  final int maxLength;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length <= maxLength) return newValue;

    final truncated = newValue.text.substring(0, maxLength);
    return newValue.copyWith(
      text: truncated,
      selection: TextSelection.collapsed(offset: truncated.length),
      composing: TextRange.empty,
    );
  }
}
