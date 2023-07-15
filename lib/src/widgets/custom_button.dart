import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() action;
  final Color? bgColor;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.action,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: bgColor),
      onPressed: action,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
