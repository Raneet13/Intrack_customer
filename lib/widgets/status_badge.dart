import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final bool small;

  const StatusBadge({
    super.key,
    required this.label,
    this.color,
    this.backgroundColor,
    this.small = false,
  });

  factory StatusBadge.status(String status, {bool small = false}) {
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'active':
      case 'online':
        bgColor = AppColors.successLight;
        textColor = AppColors.success;
        break;
      case 'inactive':
      case 'offline':
        bgColor = AppColors.secondary;
        textColor = AppColors.textSecondary;
        break;
      case 'maintenance':
        bgColor = AppColors.warningLight;
        textColor = AppColors.warning;
        break;
      case 'on leave':
        bgColor = AppColors.warningLight;
        textColor = AppColors.warning;
        break;
      default:
        bgColor = AppColors.secondary;
        textColor = AppColors.textSecondary;
    }

    return StatusBadge(
      label: status,
      color: textColor,
      backgroundColor: bgColor,
      small: small,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 6 : 8,
        vertical: small ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: small ? 10 : 12,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.textPrimary,
        ),
      ),
    );
  }
}
