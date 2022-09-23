import 'package:curiouscat_deleter/app/core/widgets/conditionary_widget/widgets/widgets.dart';
import 'package:flutter/material.dart';

extension ConditionaryWidgetOnList<T> on List<T> {
  /// If the [List] is empty, show the empty widget, otherwise show the notEmpty widget.
  ///
  /// Args:
  ///   empty (Widget): The widget to show when the [List] is empty.
  ///   notEmpty (Widget): The widget to show when the [List] is not empty.
  ///
  /// Returns:
  ///   A widget that will show the empty widget if the [List] is empty, and the notEmpty widget if the [List]
  /// is not empty.
  Widget showWhen({required Widget empty, required Widget notEmpty}) {
    return ConditionaryWidget(
      condition: isEmpty,
      trueWidget: empty,
      falseWidget: notEmpty,
    );
  }
}

/// If the [String] is empty, show the empty widget, otherwise show the notEmpty widget.
///
/// Args:
///   empty (Widget): The widget to show when the [String] is empty.
///   notEmpty (Widget): The widget to show when the [String] is not empty.
///
/// Returns:
///   A widget that will show the empty widget if the [String] is empty, and the notEmpty widget if the [String]
/// is not empty.
extension ConditionaryWidgetOnString<T> on String {
  Widget showWhen({required Widget empty, required Widget notEmpty}) {
    return ConditionaryWidget(
      condition: isEmpty,
      trueWidget: empty,
      falseWidget: notEmpty,
    );
  }
}
