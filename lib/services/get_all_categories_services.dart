import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllCategoriesServices {
  final String? baseUrl = 'https://fakestoreapi.com/products';

  Future<List<String>> requestAllCategories() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      List<String> data = jsonDecode(response.body);

      List<String> categories = [];

      for (int i = 0; i < data.length; i++) {
        categories.add(data[i]);
      }
      return categories;
    } else {
      throw Exception(
        'there is a problem in statuscode ${response.statusCode}',
      );
    }
  }
}
