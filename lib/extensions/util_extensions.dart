import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExntesion on BuildContext {
  hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

pop() {
  Get.back();
}

extension Integer on int {
  horizontalSpace() => SizedBox(width: toDouble());

  verticalSpace() => SizedBox(height: toDouble());
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
