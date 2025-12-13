import 'dart:convert';
import 'package:ak_store_app/helpers/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllCategoriesServices {
  final String? baseUrl = 'https://fakestoreapi.com/products/categories';

  Future<List<String>> requestAllCategories() async {
    List<dynamic> data = await Api().get(url: '$baseUrl');

    List<String> categories = [];

    for (int i = 0; i < data.length; i++) {
      categories.add(data[i]);
    }
    return categories;
  }
}
