import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  const AuthField({super.key,  required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(style: TextStyle(color: Colors.white,fontSize: 20),
      controller: controller, 
      obscureText:  obscureText,
      decoration: InputDecoration(contentPadding:  const EdgeInsets.all( 17),
  fillColor: const Color.fromARGB(21, 255, 255, 255),
  filled:   true,
  border:  OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(width: 4)),

),

);

  }
}