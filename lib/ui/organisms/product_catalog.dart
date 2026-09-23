import 'package:flutter/material.dart';
import '../atoms/header.dart';
import '../molecules/product_card.dart';
 
class ProductCatalogSection extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final void Function(Map<String, dynamic> product) onAddToCart;
  final void Function(Map<String, dynamic> product) onDeleteProduct;
  const ProductCatalogSection({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onDeleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ const SectionHeader(title: 'Catalog'),
        const SizedBox(height: 8),
        Column(
          children: products.map((product) {
            
            return ProductCard(
              key: ValueKey(product['id']),
              product: product,
              onAddToCart: () => onAddToCart(product),
              onDelete: () => onDeleteProduct(product),
            );
          }).toList(),
        ),
      ],
    );
  }
}