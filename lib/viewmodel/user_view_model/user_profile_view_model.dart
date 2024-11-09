import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/delete_account_data_model.dart';
import 'package:vidbuy_app/model/verify_passwrod_data_model.dart';
import 'package:vidbuy_app/repo/user_profile_repo.dart';
import 'package:vidbuy_app/view/delete_confirm_account_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class UserProfileViewModel with ChangeNotifier {
  UserProfileRepo _userProfileRepo = UserProfileRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<VerifyPasswrodDataModel> _verifyPasswordData =
      ApiResponse.loading();
  ApiResponse<VerifyPasswrodDataModel> get verifyPasswordData =>
      _verifyPasswordData;

  void setVerifyPasswordData(ApiResponse<VerifyPasswrodDataModel> response) {
    _verifyPasswordData = response;
    notifyListeners();
  }

  Future<void> fetchVerifyPasswordResponse(
    BuildContext context, {
    required String password,
  }) async {
    if (_validateFields(context, password)) {
      // Return early if validation fails

      Map<String, dynamic> passwordData = {
        'password': password,
      };
      setLoading(true);
      setVerifyPasswordData(ApiResponse.loading());
      _userProfileRepo.fetchVerifyPassword(passwordData).then((value) async {
        if (value.Isbool!) {
          setVerifyPasswordData(ApiResponse.completed(value));
          Utils.snackBar(value.message.toString(), context);
          navigate(context, DeleteConfirmAccountScreen());
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

  bool _validateFields(BuildContext context, String password) {
    if (password.isEmpty || password.length < 8) {
      Utils.snackBar('Please enter corrrect password', context);
      return false;
    }

    return true;
  }

  bool _deleteAccountLoading = false;
  bool get deleteAccountLoading => _deleteAccountLoading;

  setDeleteAccountLoading(bool value) {
    _deleteAccountLoading = value;
    print(_deleteAccountLoading);
    notifyListeners();
  }

  ApiResponse<DeleteAccountDataModel> _deleteAccountData =
      ApiResponse.loading();
  ApiResponse<DeleteAccountDataModel> get deleteAccountData =>
      _deleteAccountData;

  void setDeleteAccountData(ApiResponse<DeleteAccountDataModel> response) {
    _deleteAccountData = response;
    notifyListeners();
  }

  Future<void> fetchDeleteAccountResponse(BuildContext context) async {
    Map<String, dynamic> passwordData = {};
    setLoading(true);
    setDeleteAccountData(ApiResponse.loading());
    _userProfileRepo
        .fetchDeleteAccountResponse(passwordData)
        .then((value) async {
      setDeleteAccountData(ApiResponse.completed(value));
      Utils.snackBar(value.message.toString(), context);
      navigatePushReplace(context, LoginScreen());
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }
}
