import 'package:flutter/material.dart';

import '../atoms/button.dart';
import '../atoms/icon_badge.dart';
import '../atoms/icon_button.dart';
 
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          
          AppIconBadge(
            icon: product['icon'] as IconData,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                  product['name'] as String,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
              Text(
                  product['category'] as String,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
              Text(
                  'PHP ${(product['price'] as double).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ],
            ),
          ),
          Column(
            children: [ AppButton(
                label: 'Add to Cart',
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                onPressed: onAddToCart,
              ),
              const SizedBox(height: 6),
                 AppIconButton(
                icon: Icons.delete_outline,
                color: Colors.red,
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}