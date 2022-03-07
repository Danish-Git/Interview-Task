import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/Bloc/TextBloc.dart';

import 'Screen1.dart';
import 'Screen2.dart';

class Page1 extends StatefulWidget {
  TextBloc? textBloc;
  Page1({Key? key, this.textBloc}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  String text = "111";

  final _uiController = StreamController<String>.broadcast();
  Stream<String> get uiStream => _uiController.stream;

  int _currentIndex = 1;
  final key = GlobalKey();
  List<Widget> _buildScreens = [];

  @override
  void initState() {
    super.initState();

    _buildScreens = [
      Screen1(),
      Screen2(),
    ];
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens[_currentIndex],
      bottomNavigationBar: BottomNavigation(context),
    );
  }

  Widget showText({text}) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget BottomNavigation(BuildContext context) {
    return BottomNavigationBar(
        key: key,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        currentIndex: _currentIndex,
        backgroundColor:  Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedFontSize: 15,
        selectedLabelStyle: TextStyle(
          fontSize: 18,
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        // items: _navBarsItems,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Screen1',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Screen2',
          ),
        ]
    );
  }



}

