import 'package:flutter/material.dart';
import 'package:nike_shop/config/app_data.dart';
import 'package:nike_shop/services/utils_service.dart';
import 'package:nike_shop/widgets/card_item.dart';

class DiversesPage extends StatelessWidget {
  DiversesPage({Key? key}) : super(key: key);

  final items = diverses;
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
        return CardItem(
          items: items[index],
        );
      },
    );
  }
}
