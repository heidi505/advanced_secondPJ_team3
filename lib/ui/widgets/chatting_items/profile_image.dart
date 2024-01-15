import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
    required this.circular,
  });

  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final double circular;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            width: imageWidth,
            height: imageHeight,
          ),
          borderRadius: BorderRadius.circular(circular),
        );
      },
    );
  }
}
