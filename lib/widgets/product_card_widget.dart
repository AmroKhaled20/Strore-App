import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 225,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(5, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/scholar.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              textAlign: TextAlign.left,
              'Dress',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$122'),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
