import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: 30,
      height: 30,
    );
  }
}

class RoundIconButton2 extends StatelessWidget {
  const RoundIconButton2({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 30,
        height: 30,
      ),
    );
  }
}