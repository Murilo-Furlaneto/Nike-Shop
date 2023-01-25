import 'package:flutter/material.dart';
import 'package:nike_shop/models/products_model.dart';
import 'package:nike_shop/services/utils_service.dart';
import 'package:nike_shop/config/app_data.dart' as appData;

class Product extends StatefulWidget {
  const Product({Key? key, required this.item}) : super(key: key);

  final ProductsModel item;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final utils_services = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          // Conteúdo
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Expanded(
                  child: Image.asset(widget.item.image),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Nome - Quantidade
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.item.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Preço
                        Text(
                          utils_services.priceToCurrency(widget.item.price),
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),

                        // Descrição
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SingleChildScrollView(
                              child: Text(
                                widget.item.description,
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Botão
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              appData.addItem(widget.item);
                              print('passou');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Add no carrinho',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Botão voltar
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
