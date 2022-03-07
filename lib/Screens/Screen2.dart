import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/Bloc/TextBloc.dart';
import 'package:untitled/Utils/CustomWidgets.dart';

class Screen2 extends StatelessWidget {
  Screen2({Key? key, /*required this.textBloc*/}) : super(key: key);

  // TextBloc textBloc;

  getData() {
    TextBloc.instance.textStream.listen((event) {
      print(event);
    }).onData((data) {
      showToast(msg: "---- Data reflection form Screen2 ----\n$data}", gravity: ToastGravity.TOP);
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Screen2",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: TextBloc.instance.textStream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if(snapshot.hasData) {
                  return showText(text: snapshot.data);
                } else {
                  return showText();
                }
              },
            ),
          ],
        ),
      ),
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
}
