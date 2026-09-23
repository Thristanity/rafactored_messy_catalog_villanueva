import 'package:flutter/material.dart';
 
class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool alignLabelWithHint;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.alignLabelWithHint = false,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChanged,
        validator: validator,
      
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          alignLabelWithHint: alignLabelWithHint,
      ),
    );
  }
}