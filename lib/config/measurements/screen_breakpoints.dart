import 'package:flutter/material.dart';

enum DeviceScreenType { desktop, tablet, mobile }

class ScreenBreakpoints {
  final double tablet;
  final double desktop;

  const ScreenBreakpoints({
    required this.desktop,
    required this.tablet,
  });

  @override
  String toString() {
    return "Desktop: $desktop, Tablet: $tablet";
  }
}

DeviceScreenType getDeviceType(
  Size size,
) {
  var breakpoint = const ScreenBreakpoints(
      desktop: 800, tablet: 400); //testing, should get from param
  double deviceWidth = size.width;

  if (deviceWidth > breakpoint.desktop) {
    return DeviceScreenType.desktop;
  }

  if (deviceWidth > breakpoint.tablet) {
    return DeviceScreenType.tablet;
  }

  return DeviceScreenType.mobile;
}

T getValueForScreenType<T>({
  required BuildContext context,
  required T mobile,
  T? tablet,
  T? desktop,
}) {
  var deviceScreenType = getDeviceType(MediaQuery.of(context).size);

  if (deviceScreenType == DeviceScreenType.desktop) {
    if (desktop != null) return desktop;
    if (tablet != null) return tablet;
  }

  if (deviceScreenType == DeviceScreenType.tablet) {
    if (tablet != null) return tablet;
  }

  return mobile;
}
