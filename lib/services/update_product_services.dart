import 'package:ak_store_app/helpers/api.dart';
import 'package:ak_store_app/models/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct({
    required dynamic id,
    required String title,
    required dynamic price,
    required String description,
    required String category,
    required String image,
  }) async {
    Map<String, String> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
