import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentOrange = Color(0xFFF97316);
  static const Color accentPurple = Color(0xFF9333EA);
  
  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color blue900 = Color(0xFF1E3A8A);
  
  static const Color textDark = Color(0xFF1F2937);
  static const Color textGray = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);
  
  static const Color bgLight = Color(0xFFF9FAFB);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgCard = Color(0xFFFFFFFF);
  
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient trackingGradient = LinearGradient(
    colors: [slate900, blue900, slate900],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient dashboardGradient = LinearGradient(
    colors: [primaryBlue, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text Styles
  static TextStyle headingLarge = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textDark,
  );
  
  static TextStyle headingMedium = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textDark,
  );
  
  static TextStyle headingSmall = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textDark,
  );
  
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textDark,
  );
  
  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textDark,
  );
  
  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textGray,
  );
  
  static TextStyle caption = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: textLight,
  );

  // Theme Data
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: bgLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: bgWhite,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: textDark),
    ),
    cardTheme: CardThemeData(
      color: bgCard,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
  );

  // Box Decorations
  static BoxDecoration cardDecoration = BoxDecoration(
    color: bgCard,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  static BoxDecoration gradientCardDecoration = BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: primaryBlue.withOpacity(0.3),
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
    ],
  );
}
