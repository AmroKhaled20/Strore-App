import 'package:ak_store_app/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'Home Screen';
  const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('New Trend', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Expanded(child: ProductCardWidget()),
                SizedBox(width: 20),
                Expanded(child: ProductCardWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
