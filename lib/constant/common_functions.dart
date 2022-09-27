import 'package:fluttertoast/fluttertoast.dart';
import '../utils/colors.dart';

class CommonFunctions {
  static showToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: greyLight,
        textColor: black,
        fontSize: 16.0);
  }
}
