import 'package:flutter/material.dart';
import 'package:untitled/Bloc/TextBloc.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key? key, /*required this.textBloc*/}) : super(key: key);

  TextEditingController _textController = TextEditingController();

  onPress (context) {
    TextBloc.instance.textService(_textController.text);
    // textBloc.textService(_textController.text);
    // Future.delayed(Duration(milliseconds: 500)).then((value) => Navigate.push(context, Page1(textBloc: _textBloc,)));
    // Navigate.push(context, Page1(textBloc: _textBloc,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Screen1",
        ),
      ),
      body: Center(
        // height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextFormField(
                controller: _textController,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    labelText: "Enter some Text",
                    labelStyle: TextStyle (
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 16
                    )
                ),
              ),
            ),
            SizedBox(height: 30,),
            MaterialButton(
              onPressed: () => onPress(context),
              height: 40,
              minWidth: 100,
              color: Colors.blue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            StreamBuilder(
              stream: TextBloc.instance.textStream,
              // stream: uiStream,
              // stream: textBloc.textStream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                // print(snapshot.error);
                // print(snapshot.hasError);
                // print(snapshot.connectionState);
                // print(snapshot.hashCode);
                // print(snapshot.hasData);
                // print(snapshot.stackTrace);
                // print(snapshot.requireData);

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

    // StreamSubscription<String> str = TextBloc.instance.textStream.listen((event){});

    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
