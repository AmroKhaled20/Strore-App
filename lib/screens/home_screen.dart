import 'package:ak_store_app/models/product_model.dart';
import 'package:ak_store_app/services/get_all_products_services.dart';
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
      body: FutureBuilder<List<ProductModel>>(
        future: GetAllProductsServices().requestAllProducts(),
        builder: (context,snapshot){
            if(snapshot.hasData){
              List<ProductModel> products = snapshot.data!;
              return Padding(
        padding: const EdgeInsets.only(top: 10, left: 5,right: 5),
        child: GridView.builder(
          itemCount: products.length,
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 7,
            childAspectRatio: 0.73), 
          itemBuilder: (context,index){
            return ProductCardWidget(product: products[index],);
          }),
      );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          })
    );
  }
}





