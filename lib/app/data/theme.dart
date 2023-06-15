import 'package:Aura/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: CustomColors.KWhiteColor,
     primaryColorLight: CustomColors.KPrimaryColor,
      colorScheme: const ColorScheme.light(primary: CustomColors.KPrimaryColor),
        buttonTheme: const ButtonThemeData(
            buttonColor: CustomColors.KPrimaryColor),
    tabBarTheme: const TabBarTheme(
      labelColor: CustomColors.KPrimaryColor,
    ),
    primarySwatch: Colors.blueGrey,
     textTheme: const TextTheme(button: TextStyle(color: CustomColors.KWhiteColor)),
    brightness: Brightness.light,
    scaffoldBackgroundColor: CustomColors.KWhiteColor,
    appBarTheme: AppBarTheme(  
      color: CustomColors.KPrimaryColor,
      titleTextStyle: const  TextStyle(
        fontFamily: "Roboto",
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: CustomColors.KWhiteColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color:  Colors.black),
        borderRadius: BorderRadius.circular(10.r),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.r),
      ),
      hintStyle: const TextStyle(
        fontFamily: "Roboto",
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CustomColors.KWhiteColor,
      selectedItemColor: CustomColors.KPrimaryColor,
      unselectedItemColor: CustomColors.KWhiteColor,
    ),
  );

  // static ThemeData darkTheme = ThemeData(
  //  tabBarTheme: TabBarTheme(
  //             labelColor: CustomColors.KWhiteColor,

  //  ),

  //   dialogBackgroundColor: Colors.grey,
  //   shadowColor: CustomColors.KGreyColour,
  //   primaryColor: CustomColors.KBlueColour,
  //   primarySwatch: Colors.grey,
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: CustomColors.KGreyColour,
  //   dialogTheme: DialogTheme(backgroundColor: CustomColors.KGreyColour) ,
  //   appBarTheme:  AppBarTheme(
  //     color: Colors.grey.shade800,
  //     titleTextStyle:TextStyle(
  //        fontFamily: 'Origo Pro',
  //       fontWeight: FontWeight.w700,
  //       color: CustomColors.KWhiteColor,
  //       fontSize: 16.sp,
  //     ),
  //     iconTheme: IconThemeData(color: Colors.black54),
  //   ),
  //   inputDecorationTheme: InputDecorationTheme(
  //     labelStyle: TextStyle(color: CustomColors.KBlueColour),
  //     fillColor: Colors.white,
  //     filled: true,
  //     focusedBorder: OutlineInputBorder(
  //       borderSide:  BorderSide(color: CustomColors.KGreyColour),
  //       borderRadius: BorderRadius.circular(10.r),
  //     ),
  //     border: OutlineInputBorder(
  //       borderSide: BorderSide.none,
  //       borderRadius: BorderRadius.circular(10.r),
  //     ),
  //     hintStyle: TextStyle(
  //       fontSize: 14.sp,
  //       color: Colors.white.withOpacity(0.70),
  //       fontWeight: FontWeight.w400,
  //     ),
  //   ),
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     backgroundColor: CustomColors.KGreyColour,
  //     selectedItemColor: CustomColors.KWhiteColor,
  //     unselectedItemColor: CustomColors.KGreyColour,
  //   ),

  // );
}

SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemStatusBarContrastEnforced: true,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
