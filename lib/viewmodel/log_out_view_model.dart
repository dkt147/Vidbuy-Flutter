import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/delete_account_data_model.dart';
import 'package:vidbuy_app/repo/user_profile_repo.dart';
import 'package:vidbuy_app/resources/log_out.dart';

class LogoutProfileViewModel with ChangeNotifier {
  UserProfileRepo _userProfileRepo = UserProfileRepo();

  ApiResponse<DeleteAccountDataModel> _logoutAccountData =
      ApiResponse.loading();
  ApiResponse<DeleteAccountDataModel> get logoutAccountData =>
      _logoutAccountData;

  void setLogoutAccountData(ApiResponse<DeleteAccountDataModel> response) {
    _logoutAccountData = response;
    notifyListeners();
  }

  Future<void> fetchLogOutAccountResponse(BuildContext context) async {
    Map<String, dynamic> logoutData = {};
    setLogoutAccountData(ApiResponse.loading());
    _userProfileRepo.fetchLogOutAccountResponse(logoutData).then((value) async {
      setLogoutAccountData(ApiResponse.completed(value));
      Utils.snackBar(value.message.toString(), context);
      logOut(context, false);
    }).onError((error, stackTrace) {
      Utils.snackBar(error.toString(), context);
    });
  }
}
