import 'package:flutter/material.dart';
import 'package:nike_shop/config/app_data.dart';
import 'package:nike_shop/widgets/card_item.dart';

import '../../services/utils_service.dart';

class ShirtsBase extends StatelessWidget {
  ShirtsBase({Key? key}) : super(key: key);

  final items = t_shirt;
  final utils_services = UtilsService();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 9 / 11.5),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CardItem(items: items[index]);
      },
    );
  }
}
