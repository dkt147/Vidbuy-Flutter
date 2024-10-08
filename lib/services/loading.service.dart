import 'package:flutter/material.dart';

class LoadingService {
  static final LoadingService _instance = LoadingService._internal();

  factory LoadingService() {
    return _instance;
  }

  LoadingService._internal();

  // Show loader using a dialog
  void showLoader(BuildContext context, {String message = ''}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the loader
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(), // Spinner
          ),
        );
      },
    );
  }

  // Hide loader
  void hideLoader(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(); // Dismiss the dialog
  }
}
