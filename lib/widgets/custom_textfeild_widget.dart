import 'package:flutter/material.dart';

class CustomTextfeildWidget extends StatelessWidget {
  CustomTextfeildWidget({
    required this.hintText,
    this.inputType = TextInputType.text,
    this.obsecure,
    this.onchanged,
    this.errorText,
    this.textController,
    super.key,
  });

  final String hintText;
  final bool? obsecure;
  final String? errorText;
  final Function(String)? onchanged;
  final TextInputType? inputType;
  TextEditingController? textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onChanged: onchanged,
      obscureText: obsecure ?? false,
      cursorColor: const Color.fromARGB(255, 59, 71, 134),
      style: const TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(179, 69, 69, 69)),
        errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 68, 9, 9),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 59, 71, 134),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
