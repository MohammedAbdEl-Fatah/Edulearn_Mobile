import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double w(double px) => MediaQuery.sizeOf(this).width * px / 375;
  double h(double px) => MediaQuery.sizeOf(this).height * px / 812;
}
