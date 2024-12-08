import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/forgot_password_data_model.dart';
import 'package:vidbuy_app/model/forgot_password_email_data_model/forgot_password_email_data_model.dart';
import 'package:vidbuy_app/model/forgot_password_otp_data_model.dart';
import 'package:vidbuy_app/repo/forgot_password_repo.dart';
import 'package:vidbuy_app/view/create_new_password_screen.dart';
import 'package:vidbuy_app/view/forgot_password_verify_otp_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  ForgotPasswordRepo _forogtPassswordRepo = ForgotPasswordRepo();

  bool _emailLoading = false;
  bool get emailLoading => _emailLoading;

  setEmailLoading(bool value) {
    _emailLoading = value;
    print(_emailLoading);
    notifyListeners();
  }

  ApiResponse<ForgotPasswordEmailDataModel> _emailData = ApiResponse.loading();
  ApiResponse<ForgotPasswordEmailDataModel> get emailData => _emailData;

  void setEmaildData(ApiResponse<ForgotPasswordEmailDataModel> response) {
    _emailData = response;
    notifyListeners();
  }

  Future<void> fetchEmailResponse(BuildContext context, String email) async {
    Map<String, dynamic> passwordData = {
      "email": email,
    };
    setEmailLoading(true);
    setEmaildData(ApiResponse.loading());
    _forogtPassswordRepo
        .fetchForgetPasswordEmailResponse(passwordData)
        .then((value) async {
      if (value.Isbool!) {
        setEmaildData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigate(
            context,
            ForgotPasswordOtpScreen(
              code: value.result!.codeResult!.code!,
              userId: value.result!.codeResult!.userId!,
            ));
      } else {
        Utils.snackBar(value.message.toString(), context);
      }

      setEmailLoading(false);
    }).onError((error, stackTrace) {
      setEmailLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  bool _otpLoading = false;
  bool get otpLoading => _otpLoading;

  setOtpLoading(bool value) {
    _otpLoading = value;
    print(_otpLoading);
    notifyListeners();
  }

  ApiResponse<ForgotPasswordOtpDataModel> _otpData = ApiResponse.loading();
  ApiResponse<ForgotPasswordOtpDataModel> get otpData => _otpData;

  void setOtpData(ApiResponse<ForgotPasswordOtpDataModel> response) {
    _otpData = response;
    notifyListeners();
  }

  Future<void> fetchOtpResponse(
      BuildContext context, int userId, int code) async {
    Map<String, dynamic> passwordData = {"user_id": userId, "code": code};
    setOtpLoading(true);
    setOtpData(ApiResponse.loading());
    _forogtPassswordRepo
        .fetchForgetPasswordOtpResponse(passwordData)
        .then((value) async {
      if (value.Isbool!) {
        setOtpData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigate(
            context,
            CreateNewPasswordScreen(
              userId: userId,
            ));
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setOtpLoading(false);
    }).onError((error, stackTrace) {
      setEmailLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  bool _forgotPasswordLoading = false;
  bool get forgotPasswordLoading => _forgotPasswordLoading;

  setforgotPasswordLoading(bool value) {
    _forgotPasswordLoading = value;
    print(_forgotPasswordLoading);
    notifyListeners();
  }

  ApiResponse<ForgotPasswordDataModel> _forgotPasswordData =
      ApiResponse.loading();
  ApiResponse<ForgotPasswordDataModel> get forgotPasswordData =>
      _forgotPasswordData;

  void setForgotPasswordData(ApiResponse<ForgotPasswordDataModel> response) {
    _forgotPasswordData = response;
    notifyListeners();
  }

  Future<void> fetchForgotPasswordResponse(BuildContext context, int userId,
      String password, String confirmPassword) async {
    Map<String, dynamic> passwordData = {
      "user_id": userId,
      "password": password,
      "confirm_password": confirmPassword
    };
    setforgotPasswordLoading(true);
    setForgotPasswordData(ApiResponse.loading());
    _forogtPassswordRepo
        .fetchForgetPasswordResponse(passwordData)
        .then((value) async {
      if (value.Isbool!) {
        setForgotPasswordData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigatePushReplace(context, LoginScreen());
      } else {
        Utils.snackBar(value.message.toString(), context);
      }

      setforgotPasswordLoading(false);
    }).onError((error, stackTrace) {
      setEmailLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }
}
