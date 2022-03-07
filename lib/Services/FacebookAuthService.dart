import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:untitled/Bloc/fbAuthBloc.dart';
import 'package:untitled/Utils/Global.dart';

class FacebookAuthService {
  Future<AuthHandler> auth() {
    return FacebookAuth.instance.login(permissions: ['email'])
        .then((LoginResult _loginResult) {
      if(_loginResult.status == LoginStatus.success) {
        return FacebookAuth.i.getUserData().then((user) =>
          AuthHandler(
            status : STATUS.LoggedIn,
            user : User(
              name: user["name"],
              email: user["email"],
              profile: user["picture"]["data"]["url"]
            )
          )
        );
      } else {
        return AuthHandler(
          status: STATUS.Failure,
          user: User(
            name: "",
            email: "",
            profile: ""
          )
        );
      }
    });
    }

  Future<AuthHandler> signOut() async {
    FacebookAuth.instance.logOut();
    return AuthHandler(
        status: STATUS.LoggedOut,
        user: User(
            name: "",
            email: "",
            profile: ""
        )
    );
  }
}