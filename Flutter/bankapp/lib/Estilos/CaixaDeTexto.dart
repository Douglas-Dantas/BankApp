import 'package:flutter/material.dart';

class EstiloCaixaDeTexto extends InputDecoration {

  static InputDecoration padrao(String label, String hintText) {
    return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(8),
      hintText: hintText,
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xff5B2434), width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xff5B2434), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: Colors.red /*Color(0xff5B2434)*/, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Color(0xff5B2434), width: 2),
      ),
      errorStyle: TextStyle(fontSize: 10),
    );
  }

}
