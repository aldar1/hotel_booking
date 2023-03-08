import 'package:flutter/material.dart';
class MenuScreen extends StatelessWidget {

  const MenuScreen({
    super.key, 
    required this.text,
    required this.color,
    required this.textColor
  });

  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: textColor
          ),
        ),
      ),
    );
  }
}