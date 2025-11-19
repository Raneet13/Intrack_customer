import 'package:flutter/material.dart';

class AppColors {
  // Base Colors
  static const Color primary = Color(0xFF2563eb);
  static const Color primaryLight = Color(0xFF3b82f6);
  static const Color primaryDark = Color(0xFF1d4ed8);
  
  static const Color secondary = Color(0xFFf1f5f9);
  static const Color secondaryForeground = Color(0xFF475569);
  
  static const Color background = Color(0xFFf8fafc);
  static const Color cardBackground = Color(0xFFffffff);
  static const Color border = Color(0xFFe2e8f0);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF0f172a);
  static const Color textSecondary = Color(0xFF64748b);
  static const Color textMuted = Color(0xFF94a3b8);
  
  // Status Colors
  static const Color success = Color(0xFF059669);
  static const Color successLight = Color(0xFFd1fae5);
  static const Color warning = Color(0xFFd97706);
  static const Color warningLight = Color(0xFFfef3c7);
  static const Color info = Color(0xFF0891b2);
  static const Color infoLight = Color(0xFFcffafe);
  static const Color error = Color(0xFFdc2626);
  static const Color errorLight = Color(0xFFfee2e2);
  
  // Vehicle Status Colors
  static const Color vehicleOnline = Color(0xFF10b981);
  static const Color vehicleOffline = Color(0xFF6b7280);
  static const Color vehicleMaintenance = Color(0xFFf59e0b);
  static const Color vehicleAlert = Color(0xFFef4444);
  static const Color vehicleIdle = Color(0xFF8b5cf6);
  static const Color vehicleMoving = Color(0xFF06b6d4);
  
  // Driver Performance Colors
  static const Color performanceExcellent = Color(0xFF059669);
  static const Color performanceGood = Color(0xFF65a30d);
  static const Color performanceAverage = Color(0xFFd97706);
  static const Color performancePoor = Color(0xFFdc2626);
  
  // Fuel Efficiency Colors
  static const Color fuelExcellent = Color(0xFF059669);
  static const Color fuelGood = Color(0xFF65a30d);
  static const Color fuelModerate = Color(0xFFd97706);
  static const Color fuelPoor = Color(0xFFdc2626);
  
  // Priority Colors
  static const Color priorityHigh = Color(0xFFdc2626);
  static const Color priorityMedium = Color(0xFFd97706);
  static const Color priorityLow = Color(0xFF059669);
  
  // Subscription Colors
  static const Color subscriptionActive = Color(0xFF059669);
  static const Color subscriptionExpiring = Color(0xFFd97706);
  static const Color subscriptionExpired = Color(0xFFdc2626);
  static const Color subscriptionTrial = Color(0xFF7c3aed);

  //grey color code
   static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);
  
  // Chart Colors
  static const List<Color> chartColors = [
    Color(0xFF2563eb),
    Color(0xFFdc2626),
    Color(0xFF16a34a),
    Color(0xFFca8a04),
    Color(0xFF7c3aed),
    Color(0xFFdb2777),
    Color(0xFF0891b2),
    Color(0xFFea580c),
  ];
  
  // Helper methods
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'online':
        return vehicleOnline;
      case 'inactive':
      case 'offline':
        return vehicleOffline;
      case 'maintenance':
        return vehicleMaintenance;
      case 'alert':
        return vehicleAlert;
      case 'on leave':
        return warning;
      default:
        return textSecondary;
    }
  }
    static const LinearGradient bluePurpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, vehicleIdle, textMuted],
  );
      static const LinearGradient blueGreenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [success, vehicleIdle, Colors.blue],
  );
  
  static Color getFuelColor(int fuelLevel) {
    if (fuelLevel > 50) return fuelExcellent;
    if (fuelLevel > 25) return fuelModerate;
    return fuelPoor;
  }
}
