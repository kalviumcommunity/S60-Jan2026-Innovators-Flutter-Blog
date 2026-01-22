import 'package:flutter/material.dart';

/// A reusable custom button widget that can be customized with various properties.
/// This stateless widget demonstrates how to create a flexible button component
/// that can be reused throughout the app with different styles and callbacks.
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final IconData? icon;
  final double elevation;
  final EdgeInsets padding;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.deepPurple,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.icon,
    this.elevation = 4,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(icon, color: textColor)
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
