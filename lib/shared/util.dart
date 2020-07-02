//import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';

enum DeviceType { phone, tablet, other }

DeviceType deviceType(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
//  final double devicePixelRatio = ui.window.devicePixelRatio;
  //  if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
//    return DeviceType.TABLET;
//  } else if (devicePixelRatio <= 2 && (width >= 1920 || height >= 1920)) {
//    return DeviceType.TABLET;
//  } else {

//    if (devicePixelRatio < 2.0){
//      return DeviceType.TABLET;
//    }

  if (height > width) {
    if (height / width < 1.4) {
      return DeviceType.tablet;
    }
  }
  if (width > height) {
    if (width / height < 1.4) {
      return DeviceType.tablet;
    }
  }
  return DeviceType.phone;
//  }
}
