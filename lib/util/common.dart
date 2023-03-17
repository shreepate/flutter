import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Common {
  static Future<bool> checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      await Fluttertoast.showToast(msg: 'No Internet Connection is available.');
    }
    return result;
  }
}
