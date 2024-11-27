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
import 'package:vidbuy_app/view/account_rejected_screen.dart';
import 'package:vidbuy_app/view/admin_navbar_screen.dart';
import 'package:vidbuy_app/view/influencer_navbar_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/view/pending_account_screen.dart';

class LoginViewModel with ChangeNotifier {
  LoginRepo _loginRepo = LoginRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<LoginDataModel> _loginData = ApiResponse.loading();
  ApiResponse<LoginDataModel> get loginData => _loginData;

  void setLoginData(ApiResponse<LoginDataModel> response) {
    _loginData = response;
    notifyListeners();
  }

  Future<void> fetchLoginData(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    if (_validateFields(context, email, password)) {
      // Return early if validation fails

      Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };

      setLoading(true);
      setLoginData(ApiResponse.loading());
      _loginRepo.fetchLoginResponse(loginData).then((value) async {
        setLoginData(ApiResponse.completed(value));
        // Check if value.result is a Map and access code properly
        if (value.boolValue) {
          Result result = Result.fromJson(value.result);
          await LocalData.setToken(result.token ?? "");
          await handleSuccessfulLogin(value, context);
        } else {
          handleFailedLogin(value, context);
        }

        // LocalData ld = LocalData();
        // await ld.saveTokenLocally(
        //   result.user!.id.toString(),
        //   result.user!.roleId.toString(),
        //   result.user!.name.toString(),
        //   result.user!.username.toString(),
        //   result.user!.countryId.toString(),
        //   result.user!.countryName.toString(),
        //   result.user!.email.toString(),
        //   result.user!.image.toString(),
        //   result.user!.status.toString(),
        //   result.user!.isProfileCompleted.toString(),
        //   // result.token.toString()
        // );
        // await ld.getTokenLocally();

        // if (result.user!.isProfileCompleted == 0) {
        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(builder: (context) => TabBarWidget()),
        //       (route) => false);
        // } else if (result.user!.isProfileCompleted == 1) {
        //   Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(builder: (context) => HomeScreen()),
        //       (route) => false);
        // }
        // }
        // else {
        //   // Handle unexpected result structure
        //   Utils.snackBar("Unexpected response structure.", context);
        // }

        setLoading(false);
        // Utils.snackBar(value.message.toString(), context);

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
  // Extract necessary details from the user object
  final roleId = user.roleId;
  final isProfileComplete = user.isProfileCompleted;
  final status = user.status; // Assume `status` indicates Pending, Approved, or Cancelled

  if (roleId == 3) {
    // Additional conditions for roleId == 3
    if (isProfileComplete == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => TabBarWidget()), // Navigate to TabBarWidget
        (route) => false,
      );
    } else{
    if (status == "Pending") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => PendingAccountScreen()), // Navigate to PendingScreen
        (route) => false,
      );
    } else if (status == "Approved") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => InfluencerNavbarScreen()), // Navigate to ApprovedScreen
        (route) => false,
      );
    } else if (status == "Cancelled") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => AccountRejectedScreen()), // Navigate to CancelledScreen
        (route) => false,
      );
    } else {
      Utils.snackBar("Unknown status: $status", context);
    }
    }
  } else {
    // Default navigation for other roles
    final Map<int, Widget> roleNavigationMap = {
      1: const AdminNavBarScreen(),
      2: const NavBarScreen(),
      // For roleId == 3, this part is bypassed because of the above condition
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
}


  void handleFailedLogin(LoginDataModel response, BuildContext context) {
    Utils.snackBar(response.message.toString(), context);
  }

  bool _validateFields(BuildContext context, String email, String password) {
    if (email.isEmpty || !_isValidEmail(email)) {
      Utils.snackBar('Please enter a valid email', context);
      return false;
    }
    if (password.isEmpty || password.length < 8) {
      Utils.snackBar('Password must be at least 8 characters long', context);
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

//   Future<void> fetchLoginReponse(BuildContext context, dynamic data) async {
//     setLoading(true);

//     _loginRepo.fetchLoginResponse(data).then((value) async {
//       print(value);
//       setLoading(false);
//       LocalData ld = LocalData();
//       // await ld.saveTokenLocally(
//       //     );
//       //  final userPreference = Provider.of<UserViewModel>(context, listen: false);
//       // userPreference.saveUser(UserModel(token: value['token'].toString()));
// // saveLoginDataToSharedPreferences(value);
//       await ld.getTokenLocally();
//       Utils.snackBar('Login Successfully', context);
//       Timer(const Duration(seconds: 2), () {
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => NavBarScreen()),
//             (route) => false);
//         // navigate(context, NavBarScreen());
//       });
//       // await ld.getTokenLocally();
//       print("${LocalData.name} local name");
// // print("${uu} localll");
//       // var yy = LocalData().getDataLocally();
//       // print("${yy.id} local");
//       // LoginDataModel? storedLoginData = await getLoginDataFromSharedPreferences();
// // if (storedLoginData != null) {
// //   print(storedLoginData.data?.address.toString());
// //   // Use the storedLoginData as needed
// // } else {
// //   print("else");
// //   // No data was found in shared preferences
// // }
//       if (kDebugMode) {
//         print(value.toString());
//       }
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       Utils.snackBar(error.toString(), context);
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
}
