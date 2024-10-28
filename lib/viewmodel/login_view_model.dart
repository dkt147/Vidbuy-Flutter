import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/login_data_model/login_data_model.dart';
import 'package:vidbuy_app/model/login_data_model/result.dart';
import 'package:vidbuy_app/repo/login_repo.dart';
import 'package:vidbuy_app/resources/componenets/navbar_widget.dart';
import 'package:vidbuy_app/resources/componenets/tab_bar_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/nav_bar.dart';

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
        // setLoginData(ApiResponse.completed(value));
        // Check if value.result is a Map and access code properly
        if (value.result is Map<String, dynamic>) {
          Result result = Result.fromJson(value.result);

          await LocalData.setToken(result.token ?? "");

          LocalData ld = LocalData();
          await ld.saveTokenLocally(
            result.user!.id.toString(),
            result.user!.roleId.toString(),
            result.user!.name.toString(),
            result.user!.username.toString(),
            result.user!.countryId.toString(),
            result.user!.countryName.toString(),
            result.user!.email.toString(),
            result.user!.image.toString(),
            result.user!.status.toString(),
            result.user!.isProfileCompleted.toString(),
            // result.token.toString()
          );
          await ld.getTokenLocally();

          if (result.user!.isProfileCompleted == 0) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => TabBarWidget()),
                (route) => false);
          } else if (result.user!.isProfileCompleted == 1) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => NavBarScreen()),
                (route) => false);
          }
        }
        // else {
        //   // Handle unexpected result structure
        //   Utils.snackBar("Unexpected response structure.", context);
        // }

        setLoading(false);
        Utils.snackBar(value.message.toString(), context);

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
