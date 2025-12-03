import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class FormatOption extends StatelessWidget {
  final String format;
  final IconData icon;
  final String title;
  final String description;
  final String selectedFormat;
  final ValueChanged<String> onChanged;

  const FormatOption({
    super.key,
    required this.format,
    required this.icon,
    required this.title,
    required this.description,
    required this.selectedFormat,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedFormat == format;

    return InkWell(
      onTap: () => onChanged(format),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : Colors.grey.shade600,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.primary : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: format,
              groupValue: selectedFormat,
              onChanged: (value) => onChanged(value!),
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
