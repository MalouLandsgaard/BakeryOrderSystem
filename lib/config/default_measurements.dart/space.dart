import 'package:flutter/cupertino.dart';

const double space = 16;

const double horizontalSpace = space;
const double verticalSpace = space;

class VerticalSpace extends SizedBox {
  const VerticalSpace({super.key}) : super(height: space);
  const VerticalSpace.small({super.key}) : super(height: space / 2);
}

class HorizontalSpace extends SizedBox {
  const HorizontalSpace({super.key}) : super(width: space);
  const HorizontalSpace.small({super.key}) : super(width: space / 2);
}

class CustomPadding extends EdgeInsets {
  const CustomPadding() : super.all(space);
}
