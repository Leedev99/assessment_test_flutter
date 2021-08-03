import 'package:assignment_test/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutherService{

  static final String IS_LOGIN = 'islogin';
  static final String USERNAME = 'username';

  Future login({User user}) async {
    if (user.Username == "12345678" && user.Passpword =="123123123") {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(USERNAME, user.Username);
      preferences.setBool(IS_LOGIN, true);
      return true;
    } 
    return false;
  }
}