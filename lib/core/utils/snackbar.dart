import 'package:laundry_bin/core/widgets/snackbars.dart';
import 'package:laundry_bin/main.dart';

class SnackbarUtil {
  /// show the message in the snackbar
  ///
  /// [message] is the message to be shown to the user
  static void showsnackbar({String message = "", bool showretry = false}) {
    Myapp.scaffoldMessengerKey.currentState!.showSnackBar(Showsnackbar(
      errorMessage: message,
      showretry: showretry,
    ));
  }

 
}
