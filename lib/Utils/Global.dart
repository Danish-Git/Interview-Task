import 'package:untitled/Bloc/TextBloc.dart';

TextBloc? textBloc;

enum STATUS {
  Loading,
  Success,
  Failure,
  LoggedIn,
  LoggedOut
}