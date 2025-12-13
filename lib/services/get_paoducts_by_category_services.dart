import 'dart:convert';

import 'package:ak_store_app/helpers/api.dart';
import 'package:ak_store_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPaoductsByCategoryServices {
  final String? baseUrl = 'https://fakestoreapi.com/products/category';

  Future<List<ProductModel>> requestProductByCategory({
    required String category,
  }) async {
    List<dynamic> data = await Api().get(url: '$baseUrl/$category');

    List<ProductModel> productsByCategory = [];

    for (int i = 0; i < data.length; i++) {
      productsByCategory.add(ProductModel.fromJson(data[i]));
    }
    return productsByCategory;
  }
}
