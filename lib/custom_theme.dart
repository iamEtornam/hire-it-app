import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';


/// light theme
ThemeData customLightTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 240, 242, 245),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(cursorColor: CustomColors.customBlueColor),
      errorColor: CustomColors.fromHex('#B00020'),
      platform: defaultTargetPlatform,
      highlightColor: CustomColors.customBlueColor.withOpacity(.5),
      primaryColor: CustomColors.customBlueColor,
      indicatorColor: CustomColors.customBlueColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: CustomColors.customBlueColor),
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Color.fromRGBO(250, 250, 250, 1),
      accentColor: CustomColors.customBlueColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 15),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.fromHex('#E5E5E5')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.fromHex('#B00020').withOpacity(.1)),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.fromHex('#B00020')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        labelStyle: Theme.of(context).textTheme.bodyText1,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: CustomColors.fromHex('#B00020')),
            focusColor: Colors.grey[400]!,

      ),

      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black.withOpacity(.5),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(color: Colors.black, fontSize: 17),
            bodyText2: TextStyle(color: Colors.black, fontSize: 14),
            caption: TextStyle(color: Colors.black, fontSize: 12),
            headline1: TextStyle(color: Colors.black, fontSize: 96),
            headline2: TextStyle(color: Colors.black, fontSize: 60),
            headline3: TextStyle(color: Colors.black, fontSize: 48),
            headline4: TextStyle(color: Colors.black, fontSize: 34),
            headline5: TextStyle(color: Colors.black, fontSize: 24),
            headline6: TextStyle(color: Colors.black, fontSize: 20),
            subtitle1: TextStyle(color: Colors.black, fontSize: 16),
            subtitle2: TextStyle(color: Colors.black, fontSize: 14),
            overline: TextStyle(color: Colors.black, fontSize: 10),
            button: TextStyle(color: Colors.black, fontSize: 16),
          ),
      dividerColor: Colors.grey,
      appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          elevation: 0,
          color: Color.fromARGB(255, 240, 242, 245),
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Typography.material2018(platform: defaultTargetPlatform)
              .white
              .copyWith(
                bodyText1: TextStyle(color: Colors.black, fontSize: 17),
                bodyText2: TextStyle(color: Colors.black, fontSize: 14),
                caption: TextStyle(color: Colors.black, fontSize: 12),
                headline1: TextStyle(color: Colors.black, fontSize: 96),
                headline2: TextStyle(color: Colors.black, fontSize: 60),
                headline3: TextStyle(color: Colors.black, fontSize: 48),
                headline4: TextStyle(color: Colors.black, fontSize: 34),
                headline5: TextStyle(color: Colors.black, fontSize: 24),
                headline6: TextStyle(color: Colors.black, fontSize: 20),
                subtitle1: TextStyle(color: Colors.black, fontSize: 16),
                subtitle2: TextStyle(color: Colors.black, fontSize: 14),
                overline: TextStyle(color: Colors.black, fontSize: 10),
                button: TextStyle(color: Colors.black, fontSize: 16),
              )));
}

///dark theme
ThemeData customDarkTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: CustomColors.fromHex('#121212'),
      visualDensity: VisualDensity.adaptivePlatformDensity,
       textSelectionTheme: TextSelectionThemeData(cursorColor: CustomColors.customBlueColor),
      errorColor: CustomColors.fromHex('#CF6679'),
      primaryColor: CustomColors.customBlueColor,
      indicatorColor: CustomColors.customBlueColor,
      highlightColor: CustomColors.customBlueColor.withOpacity(.5),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: CustomColors.customBlueColor),
      platform: defaultTargetPlatform,
      unselectedWidgetColor: Colors.grey,
      accentColor: CustomColors.customBlueColor,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Color.fromRGBO(31, 31, 31, 1),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.white.withOpacity(.7),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(color: Colors.white70, fontSize: 17),
            bodyText2: TextStyle(color: Colors.white70, fontSize: 14),
            caption: TextStyle(color: Colors.white70, fontSize: 12),
            headline1: TextStyle(color: Colors.white70, fontSize: 96),
            headline2: TextStyle(color: Colors.white70, fontSize: 60),
            headline3: TextStyle(color: Colors.white70, fontSize: 48),
            headline4: TextStyle(color: Colors.white70, fontSize: 34),
            headline5: TextStyle(color: Colors.white70, fontSize: 24),
            headline6: TextStyle(color: Colors.white70, fontSize: 20),
            subtitle1: TextStyle(color: Colors.white70, fontSize: 16),
            subtitle2: TextStyle(color: Colors.white70, fontSize: 14),
            overline: TextStyle(color: Colors.white70, fontSize: 10),
            button: TextStyle(color: Colors.white70, fontSize: 16),
          ),
      iconTheme: IconThemeData(color: Colors.white70),
      dividerColor: Colors.white.withOpacity(.6),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Color.fromRGBO(31, 31, 31, 1),
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.all(10.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.fromHex('#E5E5E5')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.fromHex('#CF6679').withOpacity(1)),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.fromHex('#CF6679')),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.white70),
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: CustomColors.fromHex('#CF6679')),
      ),
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: CustomColors.fromHex('#121212'),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Typography.material2018(platform: defaultTargetPlatform)
              .white
              .copyWith(
                bodyText1: TextStyle(color: Colors.white70, fontSize: 17),
                bodyText2: TextStyle(color: Colors.white70, fontSize: 14),
                caption: TextStyle(color: Colors.white70, fontSize: 12),
                headline1: TextStyle(color: Colors.white70, fontSize: 96),
                headline2: TextStyle(color: Colors.white70, fontSize: 60),
                headline3: TextStyle(color: Colors.white70, fontSize: 48),
                headline4: TextStyle(color: Colors.white70, fontSize: 34),
                headline5: TextStyle(color: Colors.white70, fontSize: 24),
                headline6: TextStyle(color: Colors.white70, fontSize: 20),
                subtitle1: TextStyle(color: Colors.white70, fontSize: 16),
                subtitle2: TextStyle(color: Colors.white70, fontSize: 14),
                overline: TextStyle(color: Colors.white70, fontSize: 10),
                button: TextStyle(color: Colors.white70, fontSize: 16),
              )));
}
