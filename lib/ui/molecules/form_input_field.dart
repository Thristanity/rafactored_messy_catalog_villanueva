import 'package:flutter/material.dart';

import '../atoms/text_field.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool alignLabelWithHint;
  final FormFieldValidator<String>? validator;

  const FormInputField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.validator,
  });
  
  static String? validateRequired(String? value, [String fieldName = 'Field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }
    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Price must be a number';
    }
    if (parsed <= 0) {
      return 'Price must be greater than zero';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      labelText: label,
      keyboardType: keyboardType,
      maxLines: maxLines,
      alignLabelWithHint: alignLabelWithHint,
      validator: validator,
    );
  }
}