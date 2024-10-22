import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/generic_otp_data_model/generic_otp_data_model.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';
import 'package:vidbuy_app/view/otp_scren.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class OtpVerificationViewModel extends ChangeNotifier {
  SignupRepo _signupRepo = SignupRepo();
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ApiResponse<GenericOtpDataModel> _otpVerificationData = ApiResponse.loading();
  ApiResponse<GenericOtpDataModel> get otpVerificationData =>
      _otpVerificationData;

  void setOtpVerificationData(ApiResponse<GenericOtpDataModel> response) {
    _otpVerificationData = response;
    notifyListeners();
  }

  Future<void> fetchOtpVerificationData(
    BuildContext context, {
    required String userId,
    required String code,
  }) async {
    Map<String, dynamic> verificationData = {
      'user_id': userId.toString(),
      'code': code.toString(),
    };

    setLoading(true);
    setOtpVerificationData(ApiResponse.loading());

    _signupRepo.fetchGenericOtpResponse(verificationData).then((value) async {
      setOtpVerificationData(ApiResponse.completed(value));

      if (value.boolValue == true) {
        // OTP verified successfully, navigate to the login screen
        Utils.snackBar(value.message.toString(), context);
        navigate(context, LoginScreen());
      } else if (value.boolValue == false) {
        // Handle invalid OTP case
        Utils.snackBar(value.message.toString(), context);
      }

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
