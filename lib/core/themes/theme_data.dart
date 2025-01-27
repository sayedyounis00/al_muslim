import 'package:al_muslim/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemeData {
  final double myFont;
  CustomThemeData(this.myFont);

  ThemeData darkData(context, Color mybgColor, Color cardColor) {
    return ThemeData(
      scaffoldBackgroundColor: mybgColor,
      // ###################
      // ###################
      textTheme: GoogleFonts.amiriTextTheme(
        Theme.of(context).textTheme.copyWith(
              headlineSmall: const TextStyle(color: Colors.white),
              bodyLarge: const TextStyle(color: Colors.white),
              headlineMedium: const TextStyle(color: Colors.white),
              titleLarge: const TextStyle(color: Colors.black, fontSize: 20),
              titleMedium: const TextStyle(color: Colors.white),
              // $$$$$$$$$$$$$$$$$$$$$$$$$$$
              labelLarge: const TextStyle(color: Colors.white)
                  .copyWith(fontFamily: 'IBMPlex', fontSize: myFont),
            ),
      ),

      // ###################
      cardTheme: CardTheme(elevation: 2.1, color: cardColor),

      // ###################
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(
            AppColors.kButtonCol,
          ),
        ),
      ),

      // ###################
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
      primaryIconTheme: const IconThemeData(color: Colors.white),

      // ###################
      iconTheme: const IconThemeData(color: Colors.white),
    );
    //####################
  }

// =========================================================================
  ThemeData lightData(context, Color cardColor) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.kBgColLight,
      // ###################
      textTheme: GoogleFonts.amiriTextTheme(
        Theme.of(context).textTheme.copyWith(
              headlineSmall: const TextStyle(color: Colors.black),
              bodyLarge: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.black),

              // $$$$$$$$$$$$$$$$$$$$$$$$$$$
              labelLarge: const TextStyle(color: Colors.black)
                  .copyWith(fontFamily: 'IBMPlex', fontSize: myFont),
            ),
      ),

      // ###################
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(AppColors.kButtonCol),
        ),
      ),

      // ###################
      cardTheme: CardTheme(elevation: 2.1, color: cardColor),

      // ###################
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      primaryIconTheme: const IconThemeData(color: Colors.black),

      // ###################
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
