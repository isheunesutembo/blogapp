import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  String hintText;
  final TextEditingController controller;
  final bool isObscuredText;
   AuthTextField({super.key,required this.hintText,
   required this.controller, this.isObscuredText=false});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        hintText: hintText
      ),
      validator: (value){
        if(value!.isEmpty){
          return '$hintText is missing';
        }
        return null;
      },
      obscureText: isObscuredText,
    );
  }
}