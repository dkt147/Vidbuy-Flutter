import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/generic_otp_data_model/generic_otp_data_model.dart';
import 'package:vidbuy_app/model/login_data_model/user.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';
import 'package:vidbuy_app/resources/componenets/tab_bar_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/influencer_unique_profile.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
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
    required String code,
  }) async {
    Map<String, dynamic> verificationData = {
      'code': code,
    };

    setLoading(true);
    setOtpVerificationData(ApiResponse.loading());

    try {
      final response =
          await _signupRepo.fetchGenericOtpResponse(verificationData);
      setOtpVerificationData(ApiResponse.completed(response));
      setLoading(false);

      if (response.boolValue) {
        await handleSuccessfulOtp(response, context);
      } else {
        handleFailedOtp(response, context);
      }
    } catch (error) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) print(error);
    }
  }

  Future<void> handleSuccessfulOtp(
      GenericOtpDataModel response, BuildContext context) async {
    // Result result = Result.fromJson(response.result);
    // User user = User.fromJson(response.result["result"]["user"]);
    //User user = User.fromJson(response["result"]["user"]);
    User user = User.fromJson(response.result["user"]);

    // value.result['code'].toString();

    await saveUserData(user);
    Utils.snackBar(response.message.toString(), context);

    navigateBasedOnRole(context, user);
  }

  Future<void> saveUserData(User user) async {
    LocalData ld = LocalData();
    await ld.saveTokenLocally(
      user.id.toString(),
      user.roleId.toString(),
      user.name.toString(),
      user.username.toString(),
      user.countryId.toString(),
      user.countryName.toString(),
      user.email.toString(),
      user.image.toString(),
      user.status.toString(),
      user.isProfileCompleted.toString(),
      // token,
    );
    await ld.getTokenLocally();
  }

  void navigateBasedOnRole(BuildContext context, User user) {
    // User user = User.fromJson(result.user as Map<String, dynamic>);
    final roleId = user.roleId;
    final isProfileComplete = user!.isProfileCompleted;

    final Map<int, Widget> roleNavigationMap = {
      1: LoginScreen(),
      2: NavBarScreen(),
      3: isProfileComplete == 0 ? TabBarWidget() : InfluencerUniqueProfile(),
    };

    if (roleNavigationMap.containsKey(roleId)) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => roleNavigationMap[roleId]!),
        (route) => false,
      );
    } else {
      Utils.snackBar("Unknown role: $roleId", context);
    }
  }

  void handleFailedOtp(GenericOtpDataModel response, BuildContext context) {
    Utils.snackBar(response.message.toString(), context);
  }
}
