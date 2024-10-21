import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:vidbuy_app/services/string.service.dart';

class AlertsService {
  StringsService strings = StringsService();

  AlertsService();

  // Show an alert dialog
  Future<bool> showAlert(BuildContext context, String msg,
      {String title = 'Alert'}) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(true); // Close the dialog and return true
                  },
                ),
              ],
            );
          },
        ) ??
        false; // Return false if dialog is closed without any value
  }

  // Show success toast
  void presentSuccessToast(String msg) {
    Fluttertoast.showToast(
      msg: strings.capitalizeEachFirst(msg),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      webBgColor: "#28A745", // Hex color code for red
      timeInSecForIosWeb: 5,
    );
  }

  // Show failure toast
  void presentFailureToast(String msg) {
    Fluttertoast.showToast(
      msg: strings.capitalizeEachFirst(msg.isNotEmpty ? msg : 'ERROR'),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      webBgColor: "#FF0000", // Hex color code for red
      timeInSecForIosWeb: 5,
    );
  }

  // Show a general toast
  void presentToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      webBgColor: "#FF0000", // Hex color code for red
      timeInSecForIosWeb: 5,
    );
  }

  // Show confirmation dialog
  Future<bool> presentConfirm(
    BuildContext context, {
    String okText = 'OK',
    String cancelText = 'Cancel',
    String title = 'Are You Sure?',
    String message = '',
    String okClass = '',
    String cancelClass = '',
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: Text(cancelText),
                  onPressed: () {
                    Navigator.of(context).pop(false); // Close dialog with false
                  },
                ),
                TextButton(
                  child: Text(okText),
                  onPressed: () {
                    Navigator.of(context).pop(true); // Close dialog with true
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  // Show a radio selection dialog
  Future<dynamic> presentRadioSelections(
    BuildContext context,
    String title,
    String message,
    List<Widget> inputs, {
    String okText = 'OK',
    String cancelText = 'Cancel',
  }) async {
    return await showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(message),
              ...inputs, // Display input widgets
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(cancelText),
              onPressed: () {
                Navigator.of(context).pop(false); // Close with false
              },
            ),
            TextButton(
              child: Text(okText),
              onPressed: () {
                Navigator.of(context).pop(true); // Close with true
              },
            ),
          ],
        );
      },
    );
  }
}
