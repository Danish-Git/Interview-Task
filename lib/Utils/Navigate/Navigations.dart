import 'package:flutter/material.dart';

class Navigate{
  static push(BuildContext context, nextScreen){
    Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
  }
}