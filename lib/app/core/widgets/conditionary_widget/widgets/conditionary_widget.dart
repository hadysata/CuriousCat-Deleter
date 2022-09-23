import 'package:flutter/material.dart';

/// A widget that displays one of two widgets based on a condition
class ConditionaryWidget extends StatefulWidget {
  /// The condition that will decided which of the two widgets to display
  final bool condition;

  /// The widget that will be displayed if the [condition] is true
  final Widget trueWidget;

  /// The widget that will be displayed if the [condition] is false
  /// If this was null, the widget will display ```SizedBox.shrink()```
  final Widget? falseWidget;

  const ConditionaryWidget({
    Key? key,
    required this.condition,
    required this.trueWidget,
    this.falseWidget,
  }) : super(key: key);

  @override
  State<ConditionaryWidget> createState() => _ConditionaryWidgetState();
}

class _ConditionaryWidgetState extends State<ConditionaryWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.condition ? widget.trueWidget : widget.falseWidget ?? const SizedBox.shrink();
  }
}
