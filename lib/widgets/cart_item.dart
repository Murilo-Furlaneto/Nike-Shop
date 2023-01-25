import 'package:flutter/material.dart';
import 'package:nike_shop/models/products_model.dart';
import 'package:nike_shop/services/utils_service.dart';
import 'package:nike_shop/config/app_data.dart' as appData;


class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.item}) : super(key: key);

  final ProductsModel item;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final utils_services = UtilsService();

  void Function(ProductsModel)? remove;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //Imagem
        leading: Image.asset(
          widget.item.image,
          height: 60,
          width: 60,
        ),
        //Titulo
        title: Text(
          widget.item.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        //Total

        subtitle: Text(
          utils_services.priceToCurrency(widget.item.price),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        //Deletar
        trailing: IconButton(
            onPressed: () {
              appData.deleteItem(widget.item);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete)),
      ),
    );
  }
}
