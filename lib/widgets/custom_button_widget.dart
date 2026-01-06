import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({required this.buttonText, this.onTap});
  final String buttonText;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 64, 72, 133),
        minimumSize: Size(double.infinity, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
      ),
    );
  }
}
