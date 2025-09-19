import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });
  final VoidCallback onPressed;
  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
      ),
      onPressed: onPressed,
      label: Text(label),
    );
  }
}
