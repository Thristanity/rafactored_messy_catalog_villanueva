import 'package:flutter/material.dart';

import '../atoms/button.dart';
import '../atoms/header.dart';
import '../molecules/category_dropdown.dart';
import '../molecules/form_input_field.dart';
 
class AddProductForm extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> onProductSubmitted;

  const AddProductForm({
    super.key,
    required this.onProductSubmitted,
  });

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = 'Electronics';

  static const List<String> _categories = [
    'Electronics',
    'Home',
    'Office',
    'Accessories',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final productData = {
        'name': _nameController.text,
        'price': double.parse(_priceController.text),
        'category': _selectedCategory,
        'icon': Icons.inventory_2,
        'description': _descriptionController.text,};
      widget.onProductSubmitted(productData);
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedCategory = 'Electronics';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const SectionHeader(title: 'Add New Product'),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [FormInputField(
                controller: _nameController,
                label: 'Product Name',
                validator: (value) => FormInputField.validateRequired(value, 'Product name'),
              ),
              const SizedBox(height: 12),
              
              FormInputField(
                controller: _priceController,
                label: 'Price',
                keyboardType: TextInputType.number,
                validator: FormInputField.validatePrice,
              ),
              const SizedBox(height: 12),
              
              CategoryDropdown(
                value: _selectedCategory,
                categories: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? 'Electronics';
                  });
                },
              ),
              const SizedBox(height: 12),
              
              FormInputField(
                controller: _descriptionController,
                label: 'Description',
                maxLines: 3,
                alignLabelWithHint: true,
              ),
              const SizedBox(height: 16),
              
              AppButton(
                label: 'Submit Product',
                isFullWidth: true,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ],
    );
  }
}