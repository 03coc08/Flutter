import 'package:flutter/material.dart';
import 'package:messenger_app/theme/app_colors.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      style: IconButton.styleFrom(backgroundColor: AppColors.darkSurface),
      icon: Icon(icon, size: 20),
    );
  }
}
