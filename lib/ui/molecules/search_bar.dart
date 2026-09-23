import 'package:flutter/material.dart';

import '../atoms/text_field.dart';
 
class SearchBarInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBarInput({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: onChanged,
      hintText: 'Type a product name...',
    );
  }
}