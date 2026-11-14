import 'package:flutter/material.dart';
import 'package:messenger_app/theme/app_colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.image,
    required this.radius,
    this.isOnline = false,
  });

  final String image;
  final double radius;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: radius * 2,
      child: Stack(
        children: [
          CircleAvatar(radius: radius, backgroundImage: AssetImage(image)),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 1,
              child: Container(
                width: radius * 0.52,
                height: radius * 0.52,
                decoration: BoxDecoration(
                  color: AppColors.online,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkBackground,
                    width: 2.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
