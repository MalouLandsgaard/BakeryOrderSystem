import 'package:flutter/material.dart';

const double DEFAULTPADDINGVALUE = 16;

class VerticalSpace extends SizedBox {
  const VerticalSpace({super.key}) : super(height: DEFAULTPADDINGVALUE);
  const VerticalSpace.small({super.key})
      : super(height: DEFAULTPADDINGVALUE / 2);
  const VerticalSpace.large({super.key})
      : super(height: DEFAULTPADDINGVALUE * 2);
}

class HorizontalSpace extends SizedBox {
  const HorizontalSpace({super.key}) : super(width: DEFAULTPADDINGVALUE);
  const HorizontalSpace.small({super.key})
      : super(width: DEFAULTPADDINGVALUE / 2);
  const HorizontalSpace.large({super.key})
      : super(width: DEFAULTPADDINGVALUE * 2);
}
