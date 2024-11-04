import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/contact_us_data_model/contact_us_data_model.dart';
import 'package:vidbuy_app/repo/contact_us_repo.dart';

class ContactUsViewModel with ChangeNotifier {
  ContactUsRepo _contactUsRepo = ContactUsRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<ContactUsDataModel> _contactUsData = ApiResponse.loading();
  ApiResponse<ContactUsDataModel> get contactUsData => _contactUsData;

  void setContactUsData(ApiResponse<ContactUsDataModel> response) {
    _contactUsData = response;
    notifyListeners();
  }

  Future<void> fetchContactUsData(BuildContext context,
      {required String username,
      required String email,
      required String message,
      required VoidCallback func}) async {
    if (_validateFields(context, email, username, message)) {
      // Return early if validation fails

      Map<String, dynamic> contactUsData = {
        'name': username,
        'email': email,
        'message': message,
      };

      setLoading(true);
      setContactUsData(ApiResponse.loading());
      _contactUsRepo.fetchContactUsResponse(contactUsData).then((value) async {
        if (value.Isbool!) {
          setContactUsData(ApiResponse.completed(value));
          Utils.snackBar(value.message.toString(), context);
          func.call();
        } else {
          Utils.snackBar(value.message.toString(), context);
        }

        setLoading(false);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.snackBar(error.toString(), context);
      });
    }
  }

  bool _validateFields(
      BuildContext context, String email, String username, String msg) {
    if (email.isEmpty || !_isValidEmail(email)) {
      Utils.snackBar('Please enter a valid email', context);
      return false;
    }
    if (username.isEmpty) {
      Utils.snackBar('Please enter username!', context);
      return false;
    }
    if (msg.isEmpty) {
      Utils.snackBar('Please enter message', context);
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
