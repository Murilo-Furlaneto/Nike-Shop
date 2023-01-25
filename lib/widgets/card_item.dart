import 'package:flutter/material.dart';
import 'package:nike_shop/models/products_model.dart';
import 'package:nike_shop/services/utils_service.dart';

import '../pages/product/product.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key, required this.items}) : super(key: key);

  final ProductsModel items;
  final utils_services = UtilsService();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Product(item: items)));
      },
      child: Card(
        elevation: 1,
        shadowColor: Colors.grey.shade500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Imagem
              Expanded(
                child: Image.asset(
                  items.image,
                ),
              ),
              //Nome
              Text(
                items.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              //Preço
              Text(
                utils_services.priceToCurrency(items.price),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
