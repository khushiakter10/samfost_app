import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  get width => MediaQuery.sizeOf(this).width;
  get height => MediaQuery.sizeOf(this).height;
}
