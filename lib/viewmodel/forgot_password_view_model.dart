import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/login_data_model/login_data_model.dart';
import 'package:vidbuy_app/model/login_data_model/result.dart';
import 'package:vidbuy_app/model/login_data_model/user.dart';
import 'package:vidbuy_app/repo/login_repo.dart';
import 'package:vidbuy_app/resources/componenets/tab_bar_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/admin_dashboard_screen.dart';
import 'package:vidbuy_app/view/influencer_unique_profile.dart';
import 'package:vidbuy_app/view/user_profile_screen.dart';

class ForgotPasswordViewModel with ChangeNotifier {
  LoginRepo _loginRepo = LoginRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<LoginDataModel> _forgotPasswordData = ApiResponse.loading();
  ApiResponse<LoginDataModel> get forgotPasswordData => _forgotPasswordData;

  void setForgotPasswordDataData(ApiResponse<LoginDataModel> response) {
    _forgotPasswordData = response;
    notifyListeners();
  }

  Future<void> fetchForgotPasswordData(
    BuildContext context, {
    required String email,
  }) async {
    if (_validateFields(context, email)) {
      // Return early if validation fails

      Map<String, dynamic> loginData = {
        'email': email,
      };

      setLoading(true);
      setForgotPasswordDataData(ApiResponse.loading());
      _loginRepo.fetchLoginResponse(loginData).then((value) async {
        setForgotPasswordDataData(ApiResponse.completed(value));
        // Check if value.result is a Map and access code properly
        if (value.boolValue) {
          Result result = Result.fromJson(value.result);
          await LocalData.setToken(result.token ?? "");
          await handleSuccessfulLogin(value, context);
        } else {
          handleFailedLogin(value, context);
        }

        setLoading(false);

        if (kDebugMode) {
          print(value.toString());
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.snackBar(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      });
    }
  }

  Future<void> handleSuccessfulLogin(
      LoginDataModel response, BuildContext context) async {
    User user = User.fromJson(response.result["user"]);

    Utils.snackBar(response.message.toString(), context);

    navigateBasedOnRole(context, user);
  }

  void navigateBasedOnRole(BuildContext context, User user) {
    // User user = User.fromJson(result.user as Map<String, dynamic>);
    final roleId = user.roleId;
    final isProfileComplete = user.isProfileCompleted;

    final Map<int, Widget> roleNavigationMap = {
      1: AdminDashboardScreen(),
      2: UserProfileScreen(),
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

  void handleFailedLogin(LoginDataModel response, BuildContext context) {
    Utils.snackBar(response.message.toString(), context);
  }

  bool _validateFields(BuildContext context, String email) {
    if (email.isEmpty || !_isValidEmail(email)) {
      Utils.snackBar('Please enter a valid email', context);
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
