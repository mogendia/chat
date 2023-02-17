import 'package:flutter/material.dart';

class customFormTextField extends StatelessWidget {
  customFormTextField(
      {this.hintText, this.onChanged, this.obscureText = false});

  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          print('The field is required');
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
