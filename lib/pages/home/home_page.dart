import 'package:flutter/material.dart';
import 'package:nike_shop/config/app_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_shop/pages/base/diverses_page.dart';
import 'package:nike_shop/pages/base/home_base.dart';
import 'package:nike_shop/pages/base/shirts_base.dart';
import 'package:nike_shop/pages/base/shoes_base.dart';
import 'package:nike_shop/pages/cart/cart_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = all;

  int currentIndex = 0;

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Center(
              child: Text(
                'Nike Shop',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: SizedBox(
              height: 20,
              width: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  CartList()));
                },
                icon: const Icon(Icons.shopping_cart,
                    size: 25, color: Colors.black),
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [HomeBase(), ShirtsBase(), ShoesBase(), DiversesPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
              _controller.jumpToPage(index);
            });
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.shirt), label: 'Camisas'),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shoePrints),
              label: 'Tênis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Acessórios',
            ),
          ]),
    );
  }
}
