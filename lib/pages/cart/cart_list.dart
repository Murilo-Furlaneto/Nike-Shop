import 'package:flutter/material.dart';
import 'package:nike_shop/models/products_model.dart';
import 'package:nike_shop/widgets/cart_item.dart';
import 'package:nike_shop/config/app_data.dart' as appData;

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff406E8E),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
                itemCount: appData.cart_items.length,
                itemBuilder: (BuildContext context, index) {
                  return CartItem(
                    item: appData.cart_items[index],
                    
                    
                    
                 
                  );
                })
      
        ),
      );
  }
}
