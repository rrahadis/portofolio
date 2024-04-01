import 'package:flutter/material.dart';

class DeviceSize {
  // This snippet creates a media query that can be used to customize the layout of your app based on the size of the device.
  MediaQueryData getMediaQueryData(BuildContext context) {
    return MediaQuery.of(context);
  }

  double getScreenWidth(BuildContext context) {
    return getMediaQueryData(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return getMediaQueryData(context).size.height;
  }

  bool isSmallScreen(BuildContext context) {
    return getScreenWidth(context) < 600;
  }

  bool isMediumScreen(BuildContext context) {
    return getScreenWidth(context) >= 600 && getScreenWidth(context) < 1025;
  }

  bool isLargeScreen(BuildContext context) {
    return getScreenWidth(context) >= 1025;
  }
}
