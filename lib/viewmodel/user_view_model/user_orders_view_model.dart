import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/user_all_orders_data_model/user_all_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_pending_orders_data_model/user_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_waiting_video_data_model/user_waiting_video_data_model.dart';
import 'package:vidbuy_app/repo/user_order_repo.dart';

class UserOrdersViewModel with ChangeNotifier {
 UsersOrderRepo _usersOrderRepo = UsersOrderRepo();

  ApiResponse<UserAllOrdersDataModel> _userAllOrdersList =
      ApiResponse.loading();
  ApiResponse<UserAllOrdersDataModel> get userAllOrdersList =>
      _userAllOrdersList;

  setInfluencerAllOrdersList(
      ApiResponse<UserAllOrdersDataModel> response) {
    _userAllOrdersList = response;
    _userAllOrdersList.toString();
    notifyListeners();
  }

  Future<void> fetchUserAllOrdersList() async {
    setInfluencerAllOrdersList(ApiResponse.loading());
    _usersOrderRepo.fetchUserAllOrdersList().then((value) {
      setInfluencerAllOrdersList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerAllOrdersList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<UserPendingOrdersDataModel> _userPendingOrdersList =
      ApiResponse.loading();
  ApiResponse<UserPendingOrdersDataModel> get userPendingOrdersList =>
      _userPendingOrdersList;

  setInfluencerPendingOrdersList(
      ApiResponse<UserPendingOrdersDataModel> response) {
    _userPendingOrdersList = response;
    _userPendingOrdersList.toString();
    notifyListeners();
  }

  Future<void> fetchUserPendingOrdersList() async {
    setInfluencerPendingOrdersList(ApiResponse.loading());
    _usersOrderRepo.fetchUserPendingOrdersList().then((value) {
      setInfluencerPendingOrdersList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerPendingOrdersList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<UserWaitingVideoDataModel> _userWaitingVideoList =
      ApiResponse.loading();
  ApiResponse<UserWaitingVideoDataModel> get userWaitingVideoList =>
      _userWaitingVideoList;

  setInfluencerWaitingVideoList(
      ApiResponse<UserWaitingVideoDataModel> response) {
    _userWaitingVideoList = response;
    _userWaitingVideoList.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerWaitingVideoList() async {
    setInfluencerWaitingVideoList(ApiResponse.loading());
    _usersOrderRepo.fetchUserWaitingVideoList().then((value) {
      setInfluencerWaitingVideoList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerWaitingVideoList(ApiResponse.error(error.toString()));
    });
  }
}
