import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/user_model/user_all_orders_data_model/datum.dart';
import 'package:vidbuy_app/model/user_model/user_completed_order_list_data_model/datum.dart';
import 'package:vidbuy_app/model/user_model/user_completed_order_list_data_model/user_completed_order_list_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_pending_orders_data_model/datum.dart';
import 'package:vidbuy_app/model/user_model/user_pending_orders_data_model/user_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_rejected_orders_data_model/datum.dart';
import 'package:vidbuy_app/model/user_model/user_rejected_orders_data_model/user_rejected_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_waiting_video_data_model/datum.dart';
import 'package:vidbuy_app/model/user_model/user_waiting_video_data_model/user_waiting_video_data_model.dart';
import 'package:vidbuy_app/repo/user_order_repo.dart';

class UserOrdersViewModel with ChangeNotifier {
  UsersOrderRepo _usersOrderRepo = UsersOrderRepo();

  // ApiResponse<UserAllOrdersDataModel> _userAllOrdersList =
  //     ApiResponse.loading();
  // ApiResponse<UserAllOrdersDataModel> get userAllOrdersList =>
  //     _userAllOrdersList;

  // setInfluencerAllOrdersList(ApiResponse<UserAllOrdersDataModel> response) {
  //   _userAllOrdersList = response;
  //   _userAllOrdersList.toString();
  //   notifyListeners();
  // }

  List<UserAllOrdersDatum> _allorders = [];
  List<UserAllOrdersDatum> get allorders => _allorders;

  bool _isAllOrderFetching = false;
  bool get isAllOrderFetching => _isAllOrderFetching;

  bool _hasAllOrderMoreData = true;
  bool get hasAllOrderMoreData => _hasAllOrderMoreData;

  int _allOrderscurrentPage = 1;

  Future<void> fetchUserAllOrdersList() async {
    if (_isAllOrderFetching || !_hasAllOrderMoreData) return;

    _isAllOrderFetching = true;
    notifyListeners();

    try {
      final result =
          await _usersOrderRepo.fetchUserAllOrdersList(_allOrderscurrentPage);

      if (result.result!.data!.isNotEmpty) {
        _allorders.addAll(result.result!.data!);
        _allOrderscurrentPage++;
      } else {
        _hasAllOrderMoreData = false; // No more data to load
      }
    } catch (error) {
      print("Error fetching orders: $error");
    } finally {
      _isAllOrderFetching = false;
      notifyListeners();
    }
  }

  // Future<void> fetchUserAllOrdersList(String queryParam) async {

  //   setInfluencerAllOrdersList(ApiResponse.loading());
  //   _usersOrderRepo.fetchUserAllOrdersList(queryParam).then((value) {
  //     setInfluencerAllOrdersList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerAllOrdersList(ApiResponse.error(error.toString()));
  //   });
  // }

  // ApiResponse<UserPendingOrdersDataModel> _userPendingOrdersList =
  //     ApiResponse.loading();
  // ApiResponse<UserPendingOrdersDataModel> get userPendingOrdersList =>
  //     _userPendingOrdersList;

  // setInfluencerPendingOrdersList(
  //     ApiResponse<UserPendingOrdersDataModel> response) {
  //   _userPendingOrdersList = response;
  //   _userPendingOrdersList.toString();
  //   notifyListeners();
  // }

  List<PendingOrdersDatum> _pendingOrders = [];
  List<PendingOrdersDatum> get pendingOrders => _pendingOrders;

  bool _isPendingOrderFetching = false;
  bool get isPendingOrderFetching => _isPendingOrderFetching;

  bool _hasPendingOrdersMoreData = true;
  bool get hasPendingOrdersMoreData => _hasPendingOrdersMoreData;

  int _pendingOrdersCurrentPage = 1;

  Future<void> fetchUserPendingOrdersList() async {
    if (_isPendingOrderFetching || !_hasPendingOrdersMoreData) return;
    _isPendingOrderFetching = true;
    notifyListeners();

    try {
      final result = await _usersOrderRepo
          .fetchUserPendingOrdersList(_pendingOrdersCurrentPage);

      if (result.result!.data!.isNotEmpty) {
        _pendingOrders.addAll(result.result!.data!);
        _pendingOrdersCurrentPage++;
      } else {
        _hasPendingOrdersMoreData = false; // No more data to load
      }
    } catch (error) {
      print("Error fetching orders: $error");
    } finally {
      _isPendingOrderFetching = false;
      notifyListeners();
    }
  }

  // Future<void> fetchUserPendingOrdersList() async {
  //   setInfluencerPendingOrdersList(ApiResponse.loading());
  //   _usersOrderRepo.fetchUserPendingOrdersList().then((value) {
  //     setInfluencerPendingOrdersList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerPendingOrdersList(ApiResponse.error(error.toString()));
  //   });
  // }

  // ApiResponse<UserWaitingVideoDataModel> _userWaitingVideoList =
  //     ApiResponse.loading();
  // ApiResponse<UserWaitingVideoDataModel> get userWaitingVideoList =>
  //     _userWaitingVideoList;

  // setUserWaitingVideoList(ApiResponse<UserWaitingVideoDataModel> response) {
  //   _userWaitingVideoList = response;
  //   _userWaitingVideoList.toString();
  //   notifyListeners();
  // }

  List<WaitingOrdersDatum> _waitingOrders = [];
  List<WaitingOrdersDatum> get waitingOrders => _waitingOrders;

  bool _isWaitingOrderFetching = false;
  bool get isWaitingOrderFetching => _isWaitingOrderFetching;

  bool _hasWaitingOrdersMoreData = true;
  bool get hasWaitingOrdersMoreData => _hasWaitingOrdersMoreData;

  int _waitingOrdersCurrentPage = 1;

  Future<void> fetchUserWaitingVideoList() async {
    if (_isWaitingOrderFetching || !_hasWaitingOrdersMoreData) return;
    _isWaitingOrderFetching = true;
    notifyListeners();

    try {
      final result = await _usersOrderRepo
          .fetchUserWaitingVideoList(_waitingOrdersCurrentPage);

      if (result.result!.data!.isNotEmpty) {
        _waitingOrders.addAll(result.result!.data!);
        _waitingOrdersCurrentPage++;
      } else {
        _hasWaitingOrdersMoreData = false; // No more data to load
      }
    } catch (error) {
      print("Error fetching orders: $error");
    } finally {
      _isWaitingOrderFetching = false;
      notifyListeners();
    }
  }

  // Future<void> fetchUserWaitingVideoList() async {
  //   setUserWaitingVideoList(ApiResponse.loading());
  //   _usersOrderRepo.fetchUserWaitingVideoList().then((value) {
  //     setUserWaitingVideoList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setUserWaitingVideoList(ApiResponse.error(error.toString()));
  //   });
  // }

  // ApiResponse<UserCompletedOrderListDataModel> _userCompletedOrderList =
  //     ApiResponse.loading();
  // ApiResponse<UserCompletedOrderListDataModel> get userCompletedOrderList =>
  //     _userCompletedOrderList;

  // setUserCompletedOrderList(
  //     ApiResponse<UserCompletedOrderListDataModel> response) {
  //   _userCompletedOrderList = response;
  //   _userCompletedOrderList.toString();
  //   notifyListeners();
  // }

  List<CompletedOrdersDatum> _completedOrders = [];
  List<CompletedOrdersDatum> get completedOrders => _completedOrders;

  bool _isCompletedOrderFetching = false;
  bool get isCompletedOrderFetching => _isCompletedOrderFetching;

  bool _hasCompletedOrdersMoreData = true;
  bool get hasCompletedOrdersMoreData => _hasCompletedOrdersMoreData;

  int _completedOrdersCurrentPage = 1;

  Future<void> fetchUserCompletedVideoList() async {
    if (_isCompletedOrderFetching || !_hasCompletedOrdersMoreData) return;
    _isCompletedOrderFetching = true;
    notifyListeners();

    try {
      final result = await _usersOrderRepo
          .fetchUserCompletedVideoList(_completedOrdersCurrentPage);

      if (result.result!.data!.isNotEmpty) {
        _completedOrders.addAll(result.result!.data!);
        _completedOrdersCurrentPage++;
      } else {
        _hasCompletedOrdersMoreData = false; // No more data to load
      }
    } catch (error) {
      print("Error fetching orders: $error");
    } finally {
      _isCompletedOrderFetching = false;
      notifyListeners();
    }
  }

  // Future<void> fetchInfluencerCompletedOrderList() async {
  //   setUserCompletedOrderList(ApiResponse.loading());
  //   _usersOrderRepo.fetchUserCompletedVideoList().then((value) {
  //     setUserCompletedOrderList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setUserCompletedOrderList(ApiResponse.error(error.toString()));
  //   });
  // }

  // ApiResponse<UserRejectedOrdersDataModel> _userRejectedOrderList =
  //     ApiResponse.loading();
  // ApiResponse<UserRejectedOrdersDataModel> get userRejectedOrderList =>
  //     _userRejectedOrderList;

  // setUserRejectedOrderList(ApiResponse<UserRejectedOrdersDataModel> response) {
  //   _userRejectedOrderList = response;
  //   _userRejectedOrderList.toString();
  //   notifyListeners();
  // }

  List<RejectedOrdersDatum> _rejectedOrders = [];
  List<RejectedOrdersDatum> get rejectedOrders => _rejectedOrders;

  bool _isRejectedOrderFetching = false;
  bool get isRejectedOrderFetching => _isRejectedOrderFetching;

  bool _hasRejectedOrdersMoreData = true;
  bool get hasRejectedOrdersMoreData => _hasRejectedOrdersMoreData;

  int _rejectedOrdersCurrentPage = 1;

  Future<void> fetchUserRejectedVideoList() async {
    if (_isRejectedOrderFetching || !_hasRejectedOrdersMoreData) return;
    _isRejectedOrderFetching = true;
    notifyListeners();

    try {
      final result = await _usersOrderRepo
          .fetchUserRejectedVideoList(_rejectedOrdersCurrentPage);

      if (result.result!.data!.isNotEmpty) {
        _rejectedOrders.addAll(result.result!.data!);
        _rejectedOrdersCurrentPage++;
      } else {
        _hasRejectedOrdersMoreData = false; // No more data to load
      }
    } catch (error) {
      print("Error fetching orders: $error");
    } finally {
      _isRejectedOrderFetching = false;
      notifyListeners();
    }
  }

  // Future<void> fetchInfluencerRejectedOrderList() async {
  //   setUserRejectedOrderList(ApiResponse.loading());
  //   _usersOrderRepo.fetchUserRejectedVideoList().then((value) {
  //     setUserRejectedOrderList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setUserRejectedOrderList(ApiResponse.error(error.toString()));
  //   });
  // }
}
