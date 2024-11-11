import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/update_user_video_status_data_model/update_user_video_status_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_activity_history_data_model/user_activity_history_data_model.dart';
import 'package:vidbuy_app/repo/user_order_repo.dart';
import 'package:vidbuy_app/resources/componenets/User_order_tab_bar.dart';
import 'package:vidbuy_app/view/success_payment_screen.dart';

class UserTaskDetailViewModel extends ChangeNotifier {
  UsersOrderRepo _userOrderRepo = UsersOrderRepo();

  bool isVideoUploaded = false;
  String? videoPath;

  bool _userStatusloading = false;
  bool get userStatusloading => _userStatusloading;

  setUserStatusloading(bool value) {
    _userStatusloading = value;
    print(_userStatusloading);
    notifyListeners();
  }

  ApiResponse<UpdateUserVideoStatusDataModel> _userStatusData =
      ApiResponse.loading();
  ApiResponse<UpdateUserVideoStatusDataModel> get userStatusData =>
      _userStatusData;

  void setUserStatusData(ApiResponse<UpdateUserVideoStatusDataModel> response) {
    _userStatusData = response;
    notifyListeners();
  }

  Future<void> fetchUploadUserStatusData(BuildContext context,
      {required String videoTypeId, required String feedback}) async {
    Map<String, dynamic> uploadStatusData = {
      'status': "Completed",
      // 'feedback' :
    };

    setUserStatusloading(true);
    setUserStatusData(ApiResponse.loading());
    _userOrderRepo
        .fetchAcceptUserVideoOrderResponse(uploadStatusData, videoTypeId)
        .then((value) async {
      if (value.Isbool!) {
        setUserStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigate(context, SuccessPaymentScreen());
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setUserStatusloading(false);
    }).onError((error, stackTrace) {
      setUserStatusloading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  ApiResponse<UserActivityHistoryDataModel> _userActiveHistoryData =
      ApiResponse.loading();
  ApiResponse<UserActivityHistoryDataModel> get userActiveHistoryData =>
      _userActiveHistoryData;

  setUserActiveHistoryData(ApiResponse<UserActivityHistoryDataModel> response) {
    _userActiveHistoryData = response;
    _userActiveHistoryData.toString();
    notifyListeners();
  }

  Future<void> fetchUserActiveHistoryData(String videoTypeId) async {
    setUserActiveHistoryData(ApiResponse.loading());
    _userOrderRepo.fetchUserActiveHistoryData(videoTypeId).then((value) {
      setUserActiveHistoryData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setUserActiveHistoryData(ApiResponse.error(error.toString()));
    });
  }
}
