import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._privateConstructor();

  static final CustomColors _instance = CustomColors._privateConstructor();

  factory CustomColors() {
    return _instance;
  }
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color customBlueColor = Color.fromRGBO(28, 84, 196, 1);
  static Color customOrangeColor = Color.fromRGBO(246, 201, 182, 1);
  static Color customLightBlueColor = Color.fromRGBO(203, 220, 248, 1);

  static final List<Color> bgColors = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(252, 252, 252, 1),
    Color.fromRGBO(245, 245, 245, 1),
    Color.fromRGBO(253, 253, 253, 1),
    Color.fromRGBO(247, 249, 252, 1)
  ];
}
