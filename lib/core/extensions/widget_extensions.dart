import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget loading(bool showCondition) =>
      showCondition ? this : const Center(child: CircularProgressIndicator());
}
