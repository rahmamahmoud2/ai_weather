import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final onpress;
  final String text;
  const AuthButton({super.key, this.onpress, required this.text});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress, child: Text( text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 39, 137, 218),
      fixedSize: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.08))
    );
  }
}
