import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/update_user_video_status_data_model/update_user_video_status_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_activity_history_data_model/user_activity_history_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_review_data_model/user_review_data_model.dart';
import 'package:vidbuy_app/repo/user_order_repo.dart';
import 'package:vidbuy_app/resources/componenets/User_order_tab_bar.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/feedback_screen.dart';
import 'package:vidbuy_app/view/order_cancel_screen.dart';
import 'package:vidbuy_app/view/order_cancelled_screen.dart';
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

  bool _userRejectStatusloading = false;
  bool get userRejectStatusloading => _userRejectStatusloading;

  setUserRejectStatusloading(bool value) {
    _userRejectStatusloading = value;
    print(_userRejectStatusloading);
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

  Future<void> fetchUploadUserStatusData(
    BuildContext context, {
    required String videoTypeId,
    required String influencerId,
  }) async {
    Map<String, dynamic> uploadStatusData = {
      'status': "Completed",
    };

    setUserStatusloading(true);
    setUserStatusData(ApiResponse.loading());
    _userOrderRepo
        .fetchAcceptUserVideoOrderResponse(uploadStatusData, videoTypeId)
        .then((value) async {
      if (value.Isbool!) {
        setUserStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigatePushReplace(
            context,
            FeedbackScreen(
              influencerId: influencerId,
            ));
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setUserStatusloading(false);
    }).onError((error, stackTrace) {
      setUserStatusloading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  Future<void> fetchUploadUserRejectStatusData(BuildContext context,
      {required String videoTypeId, required String reason}) async {
    Map<String, dynamic> uploadStatusData = {
      'status': "Rejected",
      "reason": reason
    };

    setUserRejectStatusloading(true);
    setUserStatusData(ApiResponse.loading());
    _userOrderRepo
        .fetchAcceptUserVideoOrderResponse(uploadStatusData, videoTypeId)
        .then((value) async {
      if (value.Isbool!) {
        setUserStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigatePushReplace(context, OrderCancelledScreen());
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setUserRejectStatusloading(false);
    }).onError((error, stackTrace) {
      setUserRejectStatusloading(false);
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

  bool _userReviewloading = false;
  bool get userReviewloading => _userReviewloading;

  setUserReviewloading(bool value) {
    _userReviewloading = value;
    print(_userReviewloading);
    notifyListeners();
  }

  ApiResponse<UserReviewDataModel> _userReviewData = ApiResponse.loading();
  ApiResponse<UserReviewDataModel> get userReviewData => _userReviewData;

  void setUserReviewData(ApiResponse<UserReviewDataModel> response) {
    _userReviewData = response;
    notifyListeners();
  }

  Future<void> fetchUploadReview(BuildContext context,
      {required String influencerId,
      required String message,
      required String rating}) async {
    Map<String, dynamic> reviewData = {
      "user_id": LocalData.id.toString(),
      "influencer_id": influencerId,
      "message": message,
      "rating": rating
    };

    setUserReviewloading(true);
    setUserReviewData(ApiResponse.loading());
    _userOrderRepo.fetchUserReviewResponse(reviewData).then((value) async {
      if (value.Isbool!) {
        setUserReviewData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigatePushReplace(context, SuccessPaymentScreen());
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setUserReviewloading(false);
    }).onError((error, stackTrace) {
      setUserReviewloading(false);
      Utils.snackBar(error.toString(), context);
    });
  }
}
