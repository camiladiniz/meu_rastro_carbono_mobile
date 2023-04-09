import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  // Colors
  const primaryColor = Color.fromRGBO(171, 201, 87, 1);
  const primaryColorDark = Color.fromRGBO(157, 196, 47, 1); // TODO
  const primaryColorLight = Color.fromRGBO(19, 230, 0, 1); // TODO
  const secondaryColor = Color.fromRGBO(154, 182, 77, 1);
  const secondaryColorDark = Color.fromRGBO(15, 179, 0, 1); // TODO
  const darkColor01 = Color.fromRGBO(2, 26, 0, 1);
  const greyColor = Color.fromRGBO(103, 103, 101, 1);
  final disabledColor = Colors.grey[400];
  const dividerColor = Colors.grey;

  // Titles
  const TextStyle titleSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );
  const TextStyle titleMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );
  const TextStyle titleLarge = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: secondaryColor,
  );

  // Body
  const TextStyle bodySmall = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: greyColor,
  );
  const TextStyle bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: greyColor,
  );
  const TextStyle bodyLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: greyColor,
  );

  const textTheme = TextTheme(
    titleSmall: titleSmall,
    titleMedium: titleMedium,
    titleLarge: titleLarge,
    bodySmall: bodySmall,
    bodyMedium: bodyMedium,
    bodyLarge: bodyLarge,
  );

  const inputDecorationTheme = InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColorLight)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      alignLabelWithHint: true);

  final buttonTheme = ButtonThemeData(
      // colorScheme: ColorScheme.light(primary: secondaryColor),
      // buttonColor: primaryColor,
      splashColor: secondaryColorDark,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  // final buttonTheme = ButtonThemeData(
  //     colorScheme: ColorScheme.light(primary: primaryColor),
  //     buttonColor: secondaryColor,
  //     splashColor: primaryColorLight,
  //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //     textTheme: ButtonTextTheme.primary,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    colorScheme: const ColorScheme.light(primary: primaryColor),
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
  );
}
