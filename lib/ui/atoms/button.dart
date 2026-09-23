import 'package:flutter/material.dart';
 
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.indigo,
    this.foregroundColor = Colors.white,
    this.padding,
    this.textStyle,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: padding,
      ),
      child: Text(label, style: textStyle,),
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }
    return button;
  }
}