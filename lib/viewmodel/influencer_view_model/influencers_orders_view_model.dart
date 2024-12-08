import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/datum.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/influencer_all_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_completed_order_list_data_model/datum.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_completed_order_list_data_model/influencer_completed_order_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_pending_orders_data_model/datum.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_pending_orders_data_model/influencer_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_rejected_order_list_data_model/datum.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_rejected_order_list_data_model/influencer_rejected_order_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_waiting_video_list_data_model/datum.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_waiting_video_list_data_model/influencer_waiting_video_list_data_model.dart';
import 'package:vidbuy_app/model/notification_update_data_model/notification_update_data_model.dart';
import 'package:vidbuy_app/repo/influencer_orders_repo.dart';
import 'package:vidbuy_app/repo/user_home_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';

class InfluencerOrdersViewModel with ChangeNotifier {
  InfleuncersOrderRepo _influencersOrderRepo = InfleuncersOrderRepo();

  // bool _influencerAllOrdersListLoading = false;
  // bool get influencerAllOrdersListLoading => _influencerAllOrdersListLoading;

  // setInfluencerAllOrdersListLoading(bool value) {
  //   _influencerAllOrdersListLoading = value;
  //   print(_influencerAllOrdersListLoading);
  //   notifyListeners();
  // }

  ApiResponse<InfluencerAllOrdersDataModel> _influencerAllOrdersList =
      ApiResponse.loading();
  ApiResponse<InfluencerAllOrdersDataModel> get influencerAllOrdersList =>
      _influencerAllOrdersList;

  setInfluencerAllOrdersList(
      ApiResponse<InfluencerAllOrdersDataModel> response) {
    _influencerAllOrdersList = response;
    _influencerAllOrdersList.toString();
    notifyListeners();
  }

  final List<InfluencersAllOrdersDatum> _allOrders =
      []; // List to store all orders
  List<InfluencersAllOrdersDatum> get allOrders => _allOrders;
  bool _isLoading = false; // Indicates whether data is being loaded
  bool get isLoading => _isLoading;

  bool _isFetchingMore =
      false; // Indicates whether more data is being fetched for pagination
  bool get isFetchingMore => _isFetchingMore;

  int _currentPage = 1; // Current page number for pagination
  bool _hasMoreData = true; // Indicates whether there is more data to fetch
  bool get hasMoreData => _hasMoreData;

  /// Fetch the list of orders with optional `date` and pagination support.
  Future<void> fetchInfluencerAllOrdersList(
      {String? date, bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreData) return; // If no more data, do nothing.

    if (!isLoadMore) {
      _isLoading = true;
      _currentPage = 1; // Reset to the first page for fresh load
      _allOrders.clear(); // Clear previous data
      setInfluencerAllOrdersList(ApiResponse.loading());
    } else {
      _isFetchingMore = true;
      notifyListeners();
    }

    try {
      // Construct query parameters
      String queryParam = "?page=$_currentPage";
      if (date != null && date.isNotEmpty) {
        queryParam += "&date=$date";
      }

      // Fetch data from the repository
      final value =
          await _influencersOrderRepo.fetchInfluencersAllOrdersList(queryParam);

      // Update the orders list
      _allOrders.addAll(value.result!.allOrderList!.data!);
      _hasMoreData = value.result!.allOrderList!.data!.isNotEmpty;
      _currentPage++;

      // Update API response state
      setInfluencerAllOrdersList(ApiResponse.completed(value));
    } catch (error) {
      setInfluencerAllOrdersList(ApiResponse.error(error.toString()));
    } finally {
      _isLoading = false;
      _isFetchingMore = false;
      notifyListeners();
    }
  }

  /// Reset pagination state
  void resetPagination() {
    _currentPage = 1;
    _hasMoreData = true;
    _allOrders.clear();
  }

  // Future<void> fetchInfluencerAllOrdersList(String? date) async {
  //   String queryParam = "";
  //   if (date != null && date.isNotEmpty) {
  //     queryParam = '?date=$date'; // Add the date as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setInfluencerAllOrdersList(ApiResponse.loading());
  //   _influencersOrderRepo
  //       .fetchInfluencersAllOrdersList(queryParam)
  //       .then((value) {
  //     setInfluencerAllOrdersList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerAllOrdersList(ApiResponse.error(error.toString()));
  //   });
  // }

  // ApiResponse<InfluencerPendingOrdersDataModel> _influencerPendingOrdersList =
  //     ApiResponse.loading();
  // ApiResponse<InfluencerPendingOrdersDataModel>
  //     get influencerPendingOrdersList => _influencerPendingOrdersList;

  // setInfluencerPendingOrdersList(
  //     ApiResponse<InfluencerPendingOrdersDataModel> response) {
  //   _influencerPendingOrdersList = response;
  //   _influencerPendingOrdersList.toString();
  //   notifyListeners();
  // }

  // bool _influencerPendingOrdersListLoading = false;
  // bool get influencerPendingOrdersListLoading =>
  //     _influencerPendingOrdersListLoading;

  // setInfluencerPendingOrdersListLoading(bool value) {
  //   _influencerPendingOrdersListLoading = value;
  //   print(_influencerPendingOrdersListLoading);
  //   notifyListeners();
  // }

  ApiResponse<InfluencerPendingOrdersDataModel> _influencerPendingOrdersList =
      ApiResponse.loading();
  ApiResponse<InfluencerPendingOrdersDataModel>
      get influencerPendingOrdersList => _influencerPendingOrdersList;

  final List<InfluencerPendingOrdersDatum> _pendingOrders =
      []; // List to store pending orders
  List<InfluencerPendingOrdersDatum> get pendingOrders => _pendingOrders;

  bool _isPendingOrdersLoading = false; // Indicates loading state
  bool get isPendingOrdersLoading => _isPendingOrdersLoading;

  bool _isFetchingMorePendingOrders = false; // Indicates if loading more data
  bool get isFetchingMorePendingOrders => _isFetchingMorePendingOrders;

  int _currentPagePendingOrders = 1; // Current page for pending orders
  bool _hasMorePendingOrders = true; // Flag for more data
  bool get hasMorePendingOrders => _hasMorePendingOrders;

  void setInfluencerPendingOrdersList(
      ApiResponse<InfluencerPendingOrdersDataModel> response) {
    _influencerPendingOrdersList = response;
    notifyListeners();
  }

  Future<void> fetchInfluencerPendingOrdersList(String? date,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMorePendingOrders) return; // Stop if no more data.

    if (!isLoadMore) {
      _isPendingOrdersLoading = true;
      _currentPagePendingOrders = 1; // Reset pagination
      _pendingOrders.clear(); // Clear previous data
      setInfluencerPendingOrdersList(ApiResponse.loading());
    } else {
      _isFetchingMorePendingOrders = true;
      notifyListeners();
    }

    try {
      // Construct query parameter
      String queryParam = "?page=$_currentPagePendingOrders";
      if (date != null && date.isNotEmpty) {
        queryParam += "&date=$date";
      }

      // Fetch data
      final value = await _influencersOrderRepo
          .fetchInfluencerPendingOrdersList(queryParam);

      // Update list and pagination state
      _pendingOrders.addAll(value.result!.pendingList!.data!);
      _hasMorePendingOrders = value.result!.pendingList!.data!.isNotEmpty;
      _currentPagePendingOrders++;

      setInfluencerPendingOrdersList(ApiResponse.completed(value));
    } catch (error) {
      setInfluencerPendingOrdersList(ApiResponse.error(error.toString()));
    } finally {
      _isPendingOrdersLoading = false;
      _isFetchingMorePendingOrders = false;
      notifyListeners();
    }
  }

  /// Reset pagination for pending orders
  void resetPendingOrdersPagination() {
    _currentPagePendingOrders = 1;
    _hasMorePendingOrders = true;
    _pendingOrders.clear();
  }

  // Future<void> fetchInfluencerPendingOrdersList(String? date) async {
  //   String queryParam = "";
  //   if (date != null && date.isNotEmpty) {
  //     queryParam = '?date=$date'; // Add the date as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setInfluencerPendingOrdersListLoading(true);
  //   setInfluencerPendingOrdersList(ApiResponse.loading());
  //   _influencersOrderRepo
  //       .fetchInfluencerPendingOrdersList(queryParam)
  //       .then((value) {
  //     setInfluencerPendingOrdersList(ApiResponse.completed(value));
  //     setInfluencerPendingOrdersListLoading(false);
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerPendingOrdersList(ApiResponse.error(error.toString()));
  //   });
  // }

// bool _influencerWaitingVideoListLoading = false;
//   bool get influencerWaitingVideoListLoading =>
//       _influencerWaitingVideoListLoading;

//   setInfluencerWaitingVideoListLoading(bool value) {
//     _influencerWaitingVideoListLoading = value;
//     print(_influencerWaitingVideoListLoading);
//     notifyListeners();
//   }
  // ApiResponse<InfluencerWaitingVideoListDataModel> _influencerWaitingVideoList =
  //     ApiResponse.loading();
  // ApiResponse<InfluencerWaitingVideoListDataModel>
  //     get influencerWaitingVideoList => _influencerWaitingVideoList;

  // setInfluencerWaitingVideoList(
  //     ApiResponse<InfluencerWaitingVideoListDataModel> response) {
  //   _influencerWaitingVideoList = response;
  //   _influencerWaitingVideoList.toString();
  //   notifyListeners();
  // }

  ApiResponse<InfluencerWaitingVideoListDataModel> _influencerWaitingVideoList =
      ApiResponse.loading();
  ApiResponse<InfluencerWaitingVideoListDataModel>
      get influencerWaitingVideoList => _influencerWaitingVideoList;

  final List<InfluencerWaitingVideoDatum> _waitingVideos = [];
  List<InfluencerWaitingVideoDatum> get waitingVideos => _waitingVideos;

  bool _isWaitingVideosLoading = false;
  bool get isWaitingVideosLoading => _isWaitingVideosLoading;

  bool _isFetchingMoreWaitingVideos = false;
  bool get isFetchingMoreWaitingVideos => _isFetchingMoreWaitingVideos;

  int _currentPageWaitingVideos = 1;
  bool _hasMoreWaitingVideos = true;
  bool get hasMoreWaitingVideos => _hasMoreWaitingVideos;

  void setInfluencerWaitingVideoList(
      ApiResponse<InfluencerWaitingVideoListDataModel> response) {
    _influencerWaitingVideoList = response;
    notifyListeners();
  }

  Future<void> fetchInfluencerWaitingVideoList(String? date,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreWaitingVideos) return;

    if (!isLoadMore) {
      _isWaitingVideosLoading = true;
      _currentPageWaitingVideos = 1;
      _waitingVideos.clear();
      setInfluencerWaitingVideoList(ApiResponse.loading());
    } else {
      _isFetchingMoreWaitingVideos = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageWaitingVideos";
      if (date != null && date.isNotEmpty) {
        queryParam += "&date=$date";
      }

      final value = await _influencersOrderRepo
          .fetchInfluencersWaitingVideoList(queryParam);

      _waitingVideos.addAll(value.result!.waitingVideoList!.data!);
      _hasMoreWaitingVideos = value.result!.waitingVideoList!.data!.isNotEmpty;
      _currentPageWaitingVideos++;

      setInfluencerWaitingVideoList(ApiResponse.completed(value));
    } catch (error) {
      setInfluencerWaitingVideoList(ApiResponse.error(error.toString()));
    } finally {
      _isWaitingVideosLoading = false;
      _isFetchingMoreWaitingVideos = false;
      notifyListeners();
    }
  }

  void resetWaitingVideosPagination() {
    _currentPageWaitingVideos = 1;
    _hasMoreWaitingVideos = true;
    _waitingVideos.clear();
  }

  // Future<void> fetchInfluencerWaitingVideoList(String? date) async {
  //   String queryParam = "";
  //   if (date != null && date.isNotEmpty) {
  //     queryParam = '?date=$date'; // Add the date as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setInfluencerWaitingVideoList(ApiResponse.loading());
  //   _influencersOrderRepo
  //       .fetchInfluencersWaitingVideoList(queryParam)
  //       .then((value) {
  //     setInfluencerWaitingVideoList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerWaitingVideoList(ApiResponse.error(error.toString()));
  //   });
  // }

  // bool _influencerCompletedVideoListLoading = false;
  // bool get influencerCompletedVideoListLoading =>
  //     _influencerCompletedVideoListLoading;

  // setInfluencerCompletedVideoListLoading(bool value) {
  //   _influencerCompletedVideoListLoading = value;
  //   print(_influencerCompletedVideoListLoading);
  //   notifyListeners();
  // }

  // ApiResponse<InfluencerCompletedOrderListDataModel>
  //     _influencerCompletedVideoList = ApiResponse.loading();
  // ApiResponse<InfluencerCompletedOrderListDataModel>
  //     get influencerCompletedVideoList => _influencerCompletedVideoList;

  // setInfluencerCompletedVideoList(
  //     ApiResponse<InfluencerCompletedOrderListDataModel> response) {
  //   _influencerCompletedVideoList = response;
  //   _influencerCompletedVideoList.toString();
  //   notifyListeners();
  // }

  ApiResponse<InfluencerCompletedOrderListDataModel>
      _influencerCompletedVideoList = ApiResponse.loading();
  ApiResponse<InfluencerCompletedOrderListDataModel>
      get influencerCompletedVideoList => _influencerCompletedVideoList;

  final List<InfluencersCompleetedOrdersDatum> _completedVideos = [];
  List<InfluencersCompleetedOrdersDatum> get completedVideos =>
      _completedVideos;

  bool _isCompletedVideosLoading = false;
  bool get isCompletedVideosLoading => _isCompletedVideosLoading;

  bool _isFetchingMoreCompletedVideos = false;
  bool get isFetchingMoreCompletedVideos => _isFetchingMoreCompletedVideos;

  int _currentPageCompletedVideos = 1;
  bool _hasMoreCompletedVideos = true;
  bool get hasMoreCompletedVideos => _hasMoreCompletedVideos;

  void setInfluencerCompletedVideoList(
      ApiResponse<InfluencerCompletedOrderListDataModel> response) {
    _influencerCompletedVideoList = response;
    notifyListeners();
  }

  Future<void> fetchInfluencerCompletedVideoList(String? date,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreCompletedVideos) return;

    if (!isLoadMore) {
      _isCompletedVideosLoading = true;
      _currentPageCompletedVideos = 1;
      _completedVideos.clear();
      setInfluencerCompletedVideoList(ApiResponse.loading());
    } else {
      _isFetchingMoreCompletedVideos = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageCompletedVideos";
      if (date != null && date.isNotEmpty) {
        queryParam += "&date=$date";
      }

      final value = await _influencersOrderRepo
          .fetchInfluencersCompletedVideoList(queryParam);

      _completedVideos.addAll(value.result!.completedList!.data!);
      _hasMoreCompletedVideos = value.result!.completedList!.data!.isNotEmpty;
      _currentPageCompletedVideos++;

      setInfluencerCompletedVideoList(ApiResponse.completed(value));
    } catch (error) {
      setInfluencerCompletedVideoList(ApiResponse.error(error.toString()));
    } finally {
      _isCompletedVideosLoading = false;
      _isFetchingMoreCompletedVideos = false;
      notifyListeners();
    }
  }

  void resetCompletedVideosPagination() {
    _currentPageCompletedVideos = 1;
    _hasMoreCompletedVideos = true;
    _completedVideos.clear();
  }

  // Future<void> fetchInfluencerCompletedVideoList(String? date) async {
  //   String queryParam = "";
  //   if (date != null && date.isNotEmpty) {
  //     queryParam = '?date=$date'; // Add the date as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   // setInfluencerWaitingVideoListLoading(true);
  //   setInfluencerCompletedVideoList(ApiResponse.loading());
  //   _influencersOrderRepo
  //       .fetchInfluencersCompletedVideoList(queryParam)
  //       .then((value) {
  //     setInfluencerCompletedVideoList(ApiResponse.completed(value));
  //     // setInfluencerCompletedVideoListLoading(false);
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerCompletedVideoList(ApiResponse.error(error.toString()));
  //   });
  // }

  // ApiResponse<InfluencerRejectedOrderListDataModel>
  //     _influencerRejectedVideoList = ApiResponse.loading();
  // ApiResponse<InfluencerRejectedOrderListDataModel>
  //     get influencerRejectedVideoList => _influencerRejectedVideoList;

  // setInfluencerRejectedVideoList(
  //     ApiResponse<InfluencerRejectedOrderListDataModel> response) {
  //   _influencerRejectedVideoList = response;
  //   _influencerRejectedVideoList.toString();
  //   notifyListeners();
  // }

  ApiResponse<InfluencerRejectedOrderListDataModel>
      _influencerRejectedVideoList = ApiResponse.loading();
  ApiResponse<InfluencerRejectedOrderListDataModel>
      get influencerRejectedVideoList => _influencerRejectedVideoList;

  final List<InfluencersRejectedOrdersDatum> _rejectedVideos = [];
  List<InfluencersRejectedOrdersDatum> get rejectedVideos => _rejectedVideos;

  bool _isRejectedVideosLoading = false;
  bool get isRejectedVideosLoading => _isRejectedVideosLoading;

  bool _isFetchingMoreRejectedVideos = false;
  bool get isFetchingMoreRejectedVideos => _isFetchingMoreRejectedVideos;

  int _currentPageRejectedVideos = 1;
  bool _hasMoreRejectedVideos = true;
  bool get hasMoreRejectedVideos => _hasMoreRejectedVideos;

  void setInfluencerRejectedVideoList(
      ApiResponse<InfluencerRejectedOrderListDataModel> response) {
    _influencerRejectedVideoList = response;
    notifyListeners();
  }

  Future<void> fetchInfluencerRejectedVideoList(String? date,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreRejectedVideos) return;

    if (!isLoadMore) {
      _isRejectedVideosLoading = true;
      _currentPageRejectedVideos = 1;
      _rejectedVideos.clear();
      setInfluencerRejectedVideoList(ApiResponse.loading());
    } else {
      _isFetchingMoreRejectedVideos = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageRejectedVideos";
      if (date != null && date.isNotEmpty) {
        queryParam += "&date=$date";
      }

      final value = await _influencersOrderRepo
          .fetchInfluencersRejectedVideoList(queryParam);

      _rejectedVideos.addAll(value.result!.data!);
      _hasMoreRejectedVideos = value.result!.data!.isNotEmpty;
      _currentPageRejectedVideos++;

      setInfluencerRejectedVideoList(ApiResponse.completed(value));
    } catch (error) {
      setInfluencerRejectedVideoList(ApiResponse.error(error.toString()));
    } finally {
      _isRejectedVideosLoading = false;
      _isFetchingMoreRejectedVideos = false;
      notifyListeners();
    }
  }

  void resetRejectedVideosPagination() {
    _currentPageRejectedVideos = 1;
    _hasMoreRejectedVideos = true;
    _rejectedVideos.clear();
  }

  // Future<void> fetchInfluencerRejectedVideoList(String? date) async {
  //   String queryParam = "";
  //   if (date != null && date.isNotEmpty) {
  //     queryParam = '?date=$date'; // Add the date as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setInfluencerRejectedVideoList(ApiResponse.loading());
  //   _influencersOrderRepo
  //       .fetchInfluencersRejectedVideoList(queryParam)
  //       .then((value) {
  //     setInfluencerRejectedVideoList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerRejectedVideoList(ApiResponse.error(error.toString()));
  //   });
  // }

  ApiResponse<NotificationUpdateDataModel> _notificationResponse =
      ApiResponse.loading();
  ApiResponse<NotificationUpdateDataModel> get notificationResponse =>
      _notificationResponse;

  setNotificationResponse(ApiResponse<NotificationUpdateDataModel> response) {
    _notificationResponse = response;
    _notificationResponse.toString();
    notifyListeners();
  }

  UserHomeRepo _userHomeRepo = UserHomeRepo();

  Future<void> fetchNotificationUpdate(String token) async {
    Map<String, dynamic> notificationData = {
      "email": LocalData.email.toString(),
      "token": token
    };
    setNotificationResponse(ApiResponse.loading());
    _userHomeRepo.fetchUserNotifications(notificationData).then((value) {
      setNotificationResponse(ApiResponse.completed(value));
      print(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<Fcm Sent>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(value);
    }).onError((error, stackTrace) {
      setNotificationResponse(ApiResponse.error(error.toString()));
    });
  }
}
