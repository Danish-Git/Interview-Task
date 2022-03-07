import 'package:flutter/material.dart';
import 'package:untitled/Bloc/fbAuthBloc.dart';
import 'package:untitled/Screens/Page1.dart';
import 'package:untitled/Utils/Global.dart';
import 'package:untitled/Utils/Navigate/Navigations.dart';

class FacebookAuthScreen extends StatelessWidget {

  FbAuthBloc _fbAuthBloc = FbAuthBloc();

  FacebookAuthScreen({Key? key}) : super(key: key);

  ///////////////////////////////     UI      /////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tasks",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: _fbAuthBloc.fbAuthStream,
                builder: (BuildContext context, AsyncSnapshot<AuthHandler> snapshot) {
                  if(snapshot.hasData) {
                    switch (snapshot.data!.status) {
                      case STATUS.Loading :
                        return showButton(context: context, text: "Loading...");
                      case STATUS.Failure :
                        return showButton(context: context, text: "Failure");
                      case STATUS.LoggedIn :
                        CustomDialog(snapshot.data!.user, context);
                        return showLogOutButton(context: context, text: "LogOut");
                      case STATUS.LoggedOut :
                        return showButton(context: context);
                      default :
                        return showButton(context: context);
                    }
                  } else {
                    return showButton(context: context);
                  }
                }
            ),

            SizedBox(height: 20,),

            MaterialButton(
              onPressed: () => Navigate.push(context, Page1()),
              height: 40,
              minWidth: 100,
              color: Colors.blue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Task 2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showButton({context, text}) => MaterialButton(
      onPressed: () => onPress(context),
      height: 40,
      minWidth: 100,
      color: Colors.blue,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        text ?? "SignIn with facebook",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );

  void CustomDialog(User? user, context) {

    Future.delayed(Duration(milliseconds: 500)).then((value) =>
        showDialog(
            context: context,
            builder: (builder) => Dialog(
              child: Container(
                height: 190,
                width: 150,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(user!.profile!),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      user.email!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      user.name!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ))
    );
  }

  Widget showLogOutButton({context, text}) => MaterialButton(
        onPressed: () => onSignOutPress(context),
        height: 40,
        minWidth: 100,
        color: Colors.blue,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          text ?? "Sign Out",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );

  ////////////////////////////     FUNCTIONS      //////////////////////////////

  onPress (context) {
    _fbAuthBloc.facebookAuth();
  }

  onSignOutPress(context) {
    _fbAuthBloc.facebookSignOut();
  }
}
