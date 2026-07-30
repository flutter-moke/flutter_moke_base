/// Moke Switch & Checkbox — 性能调优交互项
///
/// ## 问题背景
/// 复杂表单中，每个 Switch/Checkbox 的 onChanged 都可能触发父级 Form 的
/// 重新验证，导致整个表单树重建。本组件通过 **局部状态缓存** 与 **去抖动**
/// 来解决。
///
/// ## 实现策略
/// 1. 组件内部维护一个轻量 _pending 状态，立即反映 UI 变化
/// 2. 通过 [WidgetsBinding.instance.addPostFrameCallback] 延迟通知父组件
/// 3. 避免在表单验证链中产生不必要的重建
library;

import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════════
// Moke Switch
// ═══════════════════════════════════════════════════════════════

/// 高性能 Switch 组件
class MokeSwitch extends StatefulWidget {
  const MokeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.title,
    this.subtitle,
    this.dense = false,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Widget? title;
  final Widget? subtitle;
  final bool dense;

  @override
  State<MokeSwitch> createState() => _MokeSwitchState();
}

class _MokeSwitchState extends State<MokeSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(MokeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  void _handleChanged(bool v) {
    // 立即更新本地状态（UI 即时响应）
    setState(() => _value = v);

    // 延迟通知父组件（避免表单验证风暴）
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final switchWidget = Switch(
      value: _value,
      onChanged: _handleChanged,
      activeTrackColor: widget.activeColor ?? theme.colorScheme.primary,
      inactiveTrackColor:
          widget.inactiveColor ?? theme.colorScheme.outline.withValues(alpha: 0.3),
      activeThumbColor: widget.activeThumbColor,
      inactiveThumbColor: widget.inactiveThumbColor,
    );

    // 紧凑模式：仅 Switch
    if (widget.dense) return switchWidget;

    // 带标题/副标题
    if (widget.title != null || widget.subtitle != null) {
      return ListTile(
        title: widget.title,
        subtitle: widget.subtitle,
        trailing: switchWidget,
        contentPadding: EdgeInsets.zero,
        onTap: () => _handleChanged(!_value),
      );
    }

    return switchWidget;
  }
}

// ═══════════════════════════════════════════════════════════════
// Moke Checkbox
// ═══════════════════════════════════════════════════════════════

/// 高性能 Checkbox 组件
class MokeCheckbox extends StatefulWidget {
  const MokeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.title,
    this.subtitle,
    this.dense = false,
  });

  final bool? value;
  final ValueChanged<bool?> onChanged;
  final bool tristate;
  final Color? activeColor;
  final Color? checkColor;
  final Widget? title;
  final Widget? subtitle;
  final bool dense;

  @override
  State<MokeCheckbox> createState() => _MokeCheckboxState();
}

class _MokeCheckboxState extends State<MokeCheckbox> {
  late bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(MokeCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  void _handleChanged(bool? v) {
    setState(() => _value = v);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final checkboxWidget = Checkbox(
      value: _value,
      tristate: widget.tristate,
      onChanged: _handleChanged,
      activeColor: widget.activeColor ?? theme.colorScheme.primary,
      checkColor: widget.checkColor ?? theme.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );

    if (widget.dense) return checkboxWidget;

    if (widget.title != null || widget.subtitle != null) {
      return ListTile(
        title: widget.title,
        subtitle: widget.subtitle,
        leading: checkboxWidget,
        contentPadding: EdgeInsets.zero,
        onTap: () => _handleChanged(
          widget.tristate ? _value != null ? (_value! ? null : false) : true : !(_value ?? false),
        ),
      );
    }

    return checkboxWidget;
  }
}
