import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/services/alert.service.dart';
import 'package:vidbuy_app/services/loading.service.dart';
import 'package:vidbuy_app/services/storage.service.dart';
import 'package:vidbuy_app/services/string.service.dart';

class UtilityService {
  final LoadingService loading;
  final AlertsService alerts;
  final StringsService strings;
  final StorageService storage;

  UtilityService({
    required this.loading,
    required this.alerts,
    required this.strings,
    required this.storage,
  });

  // Show Loader
  void showLoader([String msg = '']) {
    loading.showLoader(msg as BuildContext); // Removed type casting
  }

  // Hide Loader
  void hideLoader() {
    // loading.hideLoader(); // Removed unnecessary BuildContext type casting
  }

  // Split name into first name and last name
  Map<String, String> splitName(String name) {
    List<String> nameParts = name.trim().split(' ');

    return {
      'first_name': nameParts[0],
      'last_name': nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
    };
  }

  // Get first name (American style name)
  String getAmericanName(String name) {
    List<String> nameParts = name.trim().split(' ');
    return nameParts[0];
  }

  // Show alert dialog
  Future<void> showAlert(String msg, {String title = 'Alert'}) async {
    await alerts.showAlert(msg as BuildContext, title); // Removed BuildContext type casting
  }

  // Show toast message
  void presentToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  // Show success toast
  void presentSuccessToast(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.green);
  }

  // Show failure toast
  void presentFailureToast(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.red);
  }

  // Present confirmation dialog
  Future<bool> presentConfirm({
    required BuildContext context, // Ensure context is passed
    String okText = 'OK',
    String cancelText = 'Cancel',
    String title = 'Are You Sure?',
    String message = '',
    String okClass = '',
    String cancelClass = '',
  }) async {
    return await alerts.presentConfirm(
      context, // Pass the BuildContext
      okText: okText,
      cancelText: cancelText,
      title: title,
      message: message,
      okClass: okClass,
      cancelClass: cancelClass,
    );
  }

  // ** Storage Service **
  Future<void> setKey(String key, String value) async {
    await storage.set(key, value);
  }

  Future<String?> getKey(String key) async {
    return await storage.get(key);
  }

  // ** Strings Service **
  String capitalizeEachFirst(String str) {
    return strings.capitalizeEachFirst(str);
  }

  String capitalizeAllLetters(String str) {
    return strings.capitalizeAllLetters(str);
  }

  bool isPhoneNumberValid(String number) {
    return strings.isPhoneNumberValid(number);
  }

  FormFieldValidator<String> checkIfMatchingPasswords(
      String passwordKey, String passwordConfirmationKey) {
    return strings.checkIfMatchingPasswords(passwordKey, passwordConfirmationKey);
  }

  bool validateEmail(String email) {
    return strings.validateEmail(email);
  }
}
