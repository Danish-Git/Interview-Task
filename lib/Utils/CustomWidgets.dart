import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({msg, gravity}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.black,
    fontSize: 16.0
);