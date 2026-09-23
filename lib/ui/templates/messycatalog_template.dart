import 'package:flutter/material.dart';
 
class MessyCatalogTemplate extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget searchSection;
  final Widget catalogSection;
  final Widget formSection;

  const MessyCatalogTemplate({
    super.key,
    this.appBar,
    required this.searchSection,
    required this.catalogSection,
    required this.formSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchSection,
            const SizedBox(height: 16),
            catalogSection,
            const Divider(height: 32, thickness: 1),
            formSection,
          ],
        ),
      ),
    );
  }
}