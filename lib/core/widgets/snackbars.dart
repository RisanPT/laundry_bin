import 'package:flutter/material.dart';
import 'package:laundry_bin/main.dart';

class Showsnackbar extends SnackBar {
  final String errorMessage;

  Showsnackbar({required this.errorMessage, bool showretry = false, super.key})
      : super(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: Theme.of(Myapp.navigatorkey.currentContext!)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Color.fromARGB(255, 215, 215, 215)),
            ),
            duration: const Duration(milliseconds: 2500),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color.fromARGB(255, 253, 183, 190),
            action: (showretry)
                ? SnackBarAction(
                    label: "retry",
                    textColor: Color.fromARGB(255, 189, 189, 189),
                    onPressed: () {})
                : null);
}

class Warningsnackbar extends SnackBar {
  final String warningMessage;

  Warningsnackbar({required this.warningMessage, super.key})
      : super(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Text(warningMessage,
              textAlign: TextAlign.center,
              style: Theme.of(Myapp.navigatorkey.currentContext!)
                  .textTheme
                  .titleMedium),
          duration: const Duration(milliseconds: 2500),
          backgroundColor: const Color.fromARGB(255, 255, 235, 144),
          behavior: SnackBarBehavior.floating,
        );
}

class SuccessSnackbar extends SnackBar {
  final String successMessage;

  SuccessSnackbar({required this.successMessage, super.key})
      : super(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: Text(
              textAlign: TextAlign.center,
              successMessage,
              style: Theme.of(Myapp.navigatorkey.currentContext!)
                  .textTheme
                  .titleMedium,
            ),
            duration: const Duration(milliseconds: 2500),
            backgroundColor: const Color.fromARGB(255, 162, 242, 173),
            behavior: SnackBarBehavior.floating);
}
