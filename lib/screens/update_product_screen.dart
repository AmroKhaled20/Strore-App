import 'package:ak_store_app/models/product_model.dart';
import 'package:ak_store_app/services/update_product_services.dart';
import 'package:ak_store_app/widgets/custom_button_widget.dart';
import 'package:ak_store_app/widgets/custom_textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen();
  static String id = 'Update Screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? prName, disc, img;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(0, 164, 23, 23),
        elevation: 0,
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        opacity: 0.4,
        color: Colors.black,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          strokeWidth: 5,
        ),
        blur: 2,
        dismissible: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50),
                    CustomTextfeildWidget(
                      hintText: 'Product Name',
                      onchanged: (data) {
                        prName = data;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextfeildWidget(
                      hintText: 'Discription',
                      onchanged: (data) {
                        disc = data;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextfeildWidget(
                      hintText: 'Price',
                      inputType: TextInputType.number,
                      onchanged: (data) {
                        price = data;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextfeildWidget(
                      hintText: 'Image',
                      onchanged: (data) {
                        img = data;
                      },
                    ),
                    SizedBox(height: 50),
                    CustomButtonWidget(
                      buttonText: 'Update',
                      onTap: () async {
                        isLoading = true;
                        setState(() {});

                        try {
                          await UpdateProduct(product);
                          print('success');

                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    "Update Successful!",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(10),
                              duration: const Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        } catch (e) {
                          print(e.toString());
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Update failed",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 3),
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        }
                        isLoading = false;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
      id: product.id,
      title: prName ?? product.title,
      price: price != null ? double.parse(price!) : product.price,
      description: disc ?? product.description,
      category: product.category,
      image: img ?? product.image,
    );
  }
}
