import 'dart:async';

import 'package:untitled/Services/FacebookAuthService.dart';
import 'package:untitled/Utils/Global.dart';

class FbAuthBloc {

  final _fbAuthController = StreamController<AuthHandler>.broadcast();
  Stream<AuthHandler> get fbAuthStream => _fbAuthController.stream;

  facebookAuth() {
    _fbAuthController.sink.add(AuthHandler(status: STATUS.Loading, user: User(name: "", email: "", profile: "")));
    FacebookAuthService().auth().then((value) {
      _fbAuthController.sink.add(value);
    });
  }

  facebookSignOut() {
    _fbAuthController.sink.add(AuthHandler(status: STATUS.Loading, user: User(name: "", email: "", profile: "")));
    FacebookAuthService().signOut().then((value) {
      _fbAuthController.sink.add(value);
    });
  }
}

class AuthHandler{
  STATUS? status;
  User? user;

  AuthHandler({this.status, this.user});
}

class User {
  String? name, email, profile;

  User({this.name, this.email, this.profile});
}