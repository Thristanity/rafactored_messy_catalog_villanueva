import 'package:flutter/material.dart';

import '../atoms/header.dart';
import '../molecules/search_bar.dart';
import '../organisms/add_product.dart';
import '../organisms/catalog_appbar.dart';
import '../organisms/product_catalog.dart';
import '../templates/messycatalog_template.dart';
 
class MessyCatalogScreen extends StatefulWidget {
  const MessyCatalogScreen({super.key});

  @override
  State<MessyCatalogScreen> createState() => _MessyCatalogScreenState();
}

class _MessyCatalogScreenState extends State<MessyCatalogScreen> {
  
  final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'name': 'Wireless Mouse',
      'price': 599.0,
      'category': 'Electronics',
      'icon': Icons.mouse,
    },
    {
      'id': 2,
      'name': 'Mechanical Keyboard',
      'price': 2499.0,
      'category': 'Electronics',
      'icon': Icons.keyboard,
    },
    {
      'id': 3,
      'name': 'Ceramic Mug',
      'price': 149.0,
      'category': 'Home',
      'icon': Icons.coffee,
    },
    {
      'id': 4,
      'name': 'Notebook',
      'price': 79.0,
      'category': 'Office',
      'icon': Icons.book,
    },
    {
      'id': 5,
      'name': 'Desk Lamp',
      'price': 899.0,
      'category': 'Home',
      'icon': Icons.lightbulb,
    },
    {
      'id': 6,
      'name': 'Backpack',
      'price': 1299.0,
      'category': 'Accessories',
      'icon': Icons.backpack,
    },
    {
      'id': 7,
      'name': 'Water Bottle',
      'price': 299.0,
      'category': 'Accessories',
      'icon': Icons.local_drink,
    },
  ];

  String _searchQuery = '';
  int _nextId = 8;

  
  

  
  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  
  void _onAddToCart(Map<String, dynamic> product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${product['name']} to cart')),
    );
  }

  
  void _onDeleteProduct(Map<String, dynamic> product) {
    setState(() {
      _products.removeWhere((p) => p['id'] == product['id']);
    });
  }

  
  
  void _handleNewProductSubmitted(Map<String, dynamic> productData) {
    final newProduct = {
      'id': _nextId,
      'name': productData['name'],
      'price': productData['price'],
      'category': productData['category'],
      'icon': Icons.inventory_2,
      'description': productData['description'],
    };

    setState(() {
      _products.add(newProduct);
      _nextId = _nextId + 1;
      _searchQuery = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newProduct['name']} added to catalog!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final filteredProducts = _products.where((p) {
      return p['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    
    return MessyCatalogTemplate(
      
      appBar: const CatalogAppBar(),
      
      searchSection: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Search Products'),
          const SizedBox(height: 8),
          SearchBarInput(
            onChanged: _onSearchChanged,
          ),
        ],
      ),
      
      catalogSection: ProductCatalogSection(
        products: filteredProducts,
        onAddToCart: _onAddToCart,
        onDeleteProduct: _onDeleteProduct,
      ),
      
      formSection: AddProductForm(
        onProductSubmitted: _handleNewProductSubmitted,
      ),
    );
  }
}