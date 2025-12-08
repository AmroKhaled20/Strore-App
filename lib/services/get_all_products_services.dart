import 'dart:convert';

import 'package:ak_store_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllProductsServices {
  final String? baseUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> requestAllProducts() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<ProductModel> products = [];

      for (int i = 0; i < data.length; i++) {
        products.add(ProductModel.fromJson(data[i]));
      }
      return products;
    } else {
      throw Exception(
        'there is a problem in statuscode ${response.statusCode}',
      );
    }
  }
}
