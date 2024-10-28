import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      useMaterial3: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorPalette.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26.sp,
          color: ColorPalette.black,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          color: ColorPalette.black,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
          color: ColorPalette.black,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
          color: ColorPalette.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorPalette.white,
        foregroundColor: ColorPalette.black,
        elevation: 0,
      ),
      primaryColor: ColorPalette.lightGreen,
      colorScheme: const ColorScheme.light(
        primary: ColorPalette.lightGreen,
        secondary: ColorPalette.darkGreen,
        error: ColorPalette.red,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.lightGreen,
          elevation: 0,
          foregroundColor: ColorPalette.white,
          padding: EdgeInsets.symmetric(vertical: 18.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: ColorPalette.lightGreen.withOpacity(0.2),
          textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 17.sp,
            color: ColorPalette.black,
          ),
        ),
      ),
    );
