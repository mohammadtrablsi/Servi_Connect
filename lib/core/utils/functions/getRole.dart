import 'package:shared_preferences/shared_preferences.dart';

Future getRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('role');
}
