import 'package:flutter/material.dart';

extension WidgetList on List<Widget> {
  List<Widget> separatedBy(Widget separator) {
    if (isEmpty) return [];
    if (length == 1) return this;

    final List<Widget> result = [];

    for (int i = 0; i < length; i++) {
      result.add(this[i]);

      if (i < length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}
