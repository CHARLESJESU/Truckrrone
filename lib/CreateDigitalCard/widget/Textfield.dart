import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final int? maxlenght;
  final TextEditingController? controller;
  final bool isRequired;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.hint,
    this.maxlenght,
    this.controller,
    this.isRequired = false,
    this.prefix,
    this.suffix,
    this.keyboardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
      
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxlenght,
        decoration: InputDecoration(
      
          hintText: hint,
          counterText: "",
          hintStyle: TextStyle(color: Colors.grey[400],fontFamily: 'Poppins'),
          filled: true,
          fillColor: Colors.grey[50],
          prefixIcon: prefix,
          suffixIcon: suffix == null
              ? null
              : Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: suffix,
          ),
      
          border: OutlineInputBorder(
      
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
      ),
    );
  }


}