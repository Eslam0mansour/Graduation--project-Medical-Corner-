import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final bool? isPassword;
  final Function(String)? onSubmit;
  final Function(String)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isAutoFocus;
  final Function()? onTap;
   const MyFormField({
     Key? key,
      this.label,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.isPassword,
      this.onSubmit,
      this.validator,
      this.controller,
      this.keyboardType,
      this.isAutoFocus,
      this.onTap,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              validator: (value) => validator!(value!),
              controller: controller,
              onTap: onTap,
              keyboardType: keyboardType,
              autofocus: isAutoFocus??false,
              obscureText: isPassword??false,
              onFieldSubmitted: (value) => onSubmit!(value)??"",
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
                hintStyle: TextStyle(color: Colors.grey.shade400),
                hintText: hint,
                border: InputBorder.none,
                labelText: label,
                prefixIcon: Icon(prefixIcon),
                suffixIcon: suffixIcon,
              ),
            )));
  }
}
