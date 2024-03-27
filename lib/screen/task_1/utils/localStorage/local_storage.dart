import 'package:shared_preferences/shared_preferences.dart';



class LocalStorage {
  setStringData(String tokenData) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('tokenKey', tokenData);
  }

  getStringData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   return pref.getString('tokenKey');
    
  }
}
