import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/admin_model/admin_change_order_status_data_model/admin_change_order_status_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_completed_orders_data_model/admin_completed_orders_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_completed_orders_data_model/datum.dart';
import 'package:vidbuy_app/model/admin_model/admin_rejected_orders_data_model/admin_rejected_orders_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_rejected_orders_data_model/rejected_datum.dart';
import 'package:vidbuy_app/model/user_model/user_order_detail_data_model/user_order_detail_data_model.dart';
import 'package:vidbuy_app/repo/admin_repo/admin_rejected_orders_repo.dart';
import 'package:vidbuy_app/repo/user_order_repo.dart';
import 'package:vidbuy_app/resources/componenets/admin_canceled_order_tab_bar.dart';

class AdminRejectedOrdersViewModel with ChangeNotifier {
  AdminRejectedOrdersRepo _adminRejectedOrdersRepo = AdminRejectedOrdersRepo();

  // bool _influencerAllOrdersListLoading = false;
  // bool get influencerAllOrdersListLoading => _influencerAllOrdersListLoading;

  // setInfluencerAllOrdersListLoading(bool value) {
  //   _influencerAllOrdersListLoading = value;
  //   print(_influencerAllOrdersListLoading);
  //   notifyListeners();
  // }

  ApiResponse<AdminRejectedOrdersDataModel> _adminRejectedOrdersList =
      ApiResponse.loading();
  ApiResponse<AdminRejectedOrdersDataModel> get adminRejectedOrdersList =>
      _adminRejectedOrdersList;

  setAdminRejectedOrdersList(
      ApiResponse<AdminRejectedOrdersDataModel> response) {
    _adminRejectedOrdersList = response;
    notifyListeners();
  }

  final List<RejectedDatum> _adminRejectedOrders = [];
  List<RejectedDatum> get adminRejectedOrders => _adminRejectedOrders;

  bool _isAdminRejectedListLoading = false;
  bool get isAdminRejectedListLoading => _isAdminRejectedListLoading;

  bool _isFetchingMoreRejectedAdminList = false;
  bool get isFetchingMoreRejectedAdminList => _isFetchingMoreRejectedAdminList;

  int _currentPageAdminRejectedList = 1;
  bool _hasMoreAdminRejectedList = true;
  bool get hasMoreAdminRejectedList => _hasMoreAdminRejectedList;

  Future<void> fetchAdminRejectedOrdersList(String? search,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreAdminRejectedList) return;

    if (!isLoadMore) {
      _isAdminRejectedListLoading = true;
      _currentPageAdminRejectedList = 1;
      _adminRejectedOrders.clear();
      setAdminRejectedOrdersList(ApiResponse.loading());
    } else {
      _isFetchingMoreRejectedAdminList = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageAdminRejectedList";
      if (search != null && search.isNotEmpty) {
        queryParam += "&search=$search";
      }

      final value = await _adminRejectedOrdersRepo
          .fetchAdminRejectedOrdersList(queryParam);

      _adminRejectedOrders.addAll(value.data!.data!);
      _hasMoreAdminRejectedList = value.data!.data!.isNotEmpty;
      _currentPageAdminRejectedList++;

      setAdminRejectedOrdersList(ApiResponse.completed(value));
    } catch (error) {
      setAdminRejectedOrdersList(ApiResponse.error(error.toString()));
    } finally {
      _isAdminRejectedListLoading = false;
      _isFetchingMoreRejectedAdminList = false;
      notifyListeners();
    }
  }

  void resetAdminRejectedOrdersPagination() {
    _currentPageAdminRejectedList = 1;
    _hasMoreAdminRejectedList = true;
    _adminRejectedOrders.clear();
  }

  // ApiResponse<AdminRejectedOrdersDataModel> _adminRejectedOrdersList =
  //     ApiResponse.loading();
  // ApiResponse<AdminRejectedOrdersDataModel> get adminRejectedOrdersList =>
  //     _adminRejectedOrdersList;

  // List<RejectedDatum> _orders = []; // Store the list of orders
  // List<RejectedDatum> get orders => _orders;

  // int _currentPage = 1; // Start with the first page
  // bool _hasMore = true; // Flag to indicate if more data is available
  // bool _isFetching = false; // Prevent duplicate API calls

  // setAdminRejectedOrdersList(
  //     ApiResponse<AdminRejectedOrdersDataModel> response) {
  //   _adminRejectedOrdersList = response;
  //   notifyListeners();
  // }

  // Future<void> fetchAdminRejectedOrdersList(String? search,
  //     {bool isNextPage = false}) async {
  //   if (_isFetching) return;

  //   String queryParam = "?page=$_currentPage"; // Add pagination parameter
  //   if (search != null && search.isNotEmpty) {
  //     queryParam += "&search=$search"; // Add search parameter if available
  //   }

  //   if (!isNextPage) {
  //     setAdminRejectedOrdersList(ApiResponse.loading());
  //     _currentPage = 1; // Reset the page when not paginating
  //     _orders.clear(); // Clear the list for new search
  //   }

  //   _isFetching = true;
  //   try {
  //     final response = await _adminRejectedOrdersRepo
  //         .fetchAdminRejectedOrdersList(queryParam);

  //     if (response.data!.data?.isEmpty ?? true) {
  //       _hasMore = false; // No more data
  //     } else {
  //       _currentPage++; // Increment the page for the next fetch
  //       _orders.addAll(response.data!.data!); // Append new data
  //     }

  //     setAdminRejectedOrdersList(ApiResponse.completed(response));
  //   } catch (error) {
  //     setAdminRejectedOrdersList(ApiResponse.error(error.toString()));
  //   } finally {
  //     _isFetching = false;
  //   }
  // }

  // void resetPagination() {
  //   _currentPage = 1;
  //   _hasMore = true;
  //   _orders.clear();
  //   notifyListeners();
  // }

  // bool get hasMore => _hasMore;

  // ApiResponse<AdminRejectedOrdersDataModel> _adminRejectedOrdersList =
  //     ApiResponse.loading();
  // ApiResponse<AdminRejectedOrdersDataModel>
  //     get adminRejectedOrdersList => _adminRejectedOrdersList;

  // setAdminRejectedOrdersList(
  //     ApiResponse<AdminRejectedOrdersDataModel> response) {
  //   _adminRejectedOrdersList = response;
  //   _adminRejectedOrdersList.toString();
  //   notifyListeners();
  // }

  // Future<void> fetchAdminRejectedOrdersList(String? search) async {
  //   String queryParam = "";
  //   if (search != null && search.isNotEmpty) {
  //     queryParam = '?search=$search'; // Add the search as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setAdminRejectedOrdersList(ApiResponse.loading());
  //   _adminRejectedOrdersRepo.fetchAdminRejectedOrdersList(queryParam)
  //       .then((value) {
  //     setAdminRejectedOrdersList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setAdminRejectedOrdersList(ApiResponse.error(error.toString()));
  //   });
  // }

//   ApiResponse<AdminCompletedOrdersDataModel>
//       _adminCompletedOrdersList = ApiResponse.loading();
//   ApiResponse<AdminCompletedOrdersDataModel>
//       get adminCompletedOrdersList => _adminCompletedOrdersList;

//   setAdminCompletedOrdersList(
//       ApiResponse<AdminCompletedOrdersDataModel> response) {
//     _adminCompletedOrdersList = response;
//     _adminCompletedOrdersList.toString();
//     notifyListeners();
//   }

//   Future<void> fetchAdminCompletedOrdersList(String? search) async {
//     String queryParam = "";
//     if (search != null && search.isNotEmpty) {
//       queryParam = '?search=$search'; // Add the search as a query parameter
//     } else {
//       queryParam = "";
//     }
//     setAdminCompletedOrdersList(ApiResponse.loading());
//  _adminRejectedOrdersRepo.fetchAdminCompletedOrdersList(queryParam)
//         .then((value) {
//       setAdminCompletedOrdersList(ApiResponse.completed(value));
//       print(value);
//     }).onError((error, stackTrace) {
//       setAdminCompletedOrdersList(ApiResponse.error(error.toString()));
//     });
//   }

  ApiResponse<AdminCompletedOrdersDataModel> _adminCompletedOrdersList =
      ApiResponse.loading();
  ApiResponse<AdminCompletedOrdersDataModel> get adminCompletedOrdersList =>
      _adminCompletedOrdersList;

  List<CompletedDatum> _completedOrders = []; // List to store completed orders
  List<CompletedDatum> get completedOrders => _completedOrders;

  // int _currentPage = 1; // Page counter
  // bool _hasMore = true; // Flag to check if more data is available
  // bool _isFetching = false; // To prevent duplicate API calls

  setAdminCompletedOrdersList(
      ApiResponse<AdminCompletedOrdersDataModel> response) {
    _adminCompletedOrdersList = response;
    notifyListeners();
  }

  List<CompletedDatum> _adminCompletedOrders =
      []; // List to store completed orders
  List<CompletedDatum> get adminCompletedOrders => _adminCompletedOrders;

  bool _isAdminApprovedListLoading = false;
  bool get isAdminApprovedListLoading => _isAdminApprovedListLoading;

  bool _isFetchingMoreApprovedAdminList = false;
  bool get isFetchingMoreApprovedAdminList => _isFetchingMoreApprovedAdminList;

  int _currentPageAdminApprovedList = 1;
  bool _hasMoreAdminApprovedList = true;
  bool get hasMoreAdminApprovedList => _hasMoreAdminApprovedList;

  Future<void> fetchAdminApprovedOrdersList(String? search,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreAdminApprovedList) return;

    if (!isLoadMore) {
      _isAdminApprovedListLoading = true;
      _currentPageAdminApprovedList = 1;
      _adminCompletedOrders.clear();
      setAdminCompletedOrdersList(ApiResponse.loading());
    } else {
      _isFetchingMoreApprovedAdminList = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageAdminApprovedList";
      if (search != null && search.isNotEmpty) {
        queryParam += "&search=$search";
      }

      final value = await _adminRejectedOrdersRepo
          .fetchAdminCompletedOrdersList(queryParam);

      _adminCompletedOrders.addAll(value.data!.data!);
      _hasMoreAdminApprovedList = value.data!.data!.isNotEmpty;
      _currentPageAdminApprovedList++;

      setAdminCompletedOrdersList(ApiResponse.completed(value));
    } catch (error) {
      setAdminCompletedOrdersList(ApiResponse.error(error.toString()));
    } finally {
      _isAdminApprovedListLoading = false;
      _isFetchingMoreApprovedAdminList = false;
      notifyListeners();
    }
  }

  void resetAdminCompletedOrdersPagination() {
    _currentPageAdminApprovedList = 1;
    _hasMoreAdminApprovedList = true;
    _adminCompletedOrders.clear();
  }

  ApiResponse<AdminCompletedOrdersDataModel> _adminRefundOrdersList =
      ApiResponse.loading();
  ApiResponse<AdminCompletedOrdersDataModel> get adminRefundOrdersList =>
      _adminRefundOrdersList;

  setAdminRefundOrdersList(
      ApiResponse<AdminCompletedOrdersDataModel> response) {
    _adminRefundOrdersList = response;
    _adminRefundOrdersList.toString();
    notifyListeners();
  }

  Future<void> fetchAdminRefundOrdersList(String? search) async {
    String queryParam = "";
    if (search != null && search.isNotEmpty) {
      queryParam = '?search=$search'; // Add the search as a query parameter
    } else {
      queryParam = "";
    }
    setAdminRefundOrdersList(ApiResponse.loading());
    _adminRejectedOrdersRepo
        .fetchAdminRefundOrdersList(queryParam)
        .then((value) {
      setAdminRefundOrdersList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminRefundOrdersList(ApiResponse.error(error.toString()));
    });
  }

  bool _changeOrderStatusLoading = false;
  bool get changeOrderStatusLoading => _changeOrderStatusLoading;

  setChangeOrderStatusLoading(bool value) {
    _changeOrderStatusLoading = value;
    print(_changeOrderStatusLoading);
    notifyListeners();
  }

  ApiResponse<AdminChangeOrderStatusDataModel> _adminChangeOrderStatusData =
      ApiResponse.loading();
  ApiResponse<AdminChangeOrderStatusDataModel> get adminChangeOrderStatusData =>
      _adminChangeOrderStatusData;

  setAdminChangeStatusData(
      ApiResponse<AdminChangeOrderStatusDataModel> response) {
    _adminChangeOrderStatusData = response;
    _adminChangeOrderStatusData.toString();
    notifyListeners();
  }

  Future<void> fetchChangeOrderStatus(
      dynamic statusData, String orderId, VoidCallback func, context) async {
    // Map<String, dynamic> statusData = {
    //   'status': status
    //   };
    setChangeOrderStatusLoading(true);
    setAdminChangeStatusData(ApiResponse.loading());
    _adminRejectedOrdersRepo
        .fetchAdminOrderStatus(orderId, statusData)
        .then((value) {
      if (value.Isbool!) {
        setAdminChangeStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        func.call();
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setChangeOrderStatusLoading(false);
    }).onError((error, stackTrace) {
      setAdminChangeStatusData(ApiResponse.error(error.toString()));
    });
  }

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

  // bool _influencerWaitingVideoListLoading = false;
  // bool get influencerWaitingVideoListLoading =>
  //     _influencerWaitingVideoListLoading;

  // setInfluencerWaitingVideoListLoading(bool value) {
  //   _influencerWaitingVideoListLoading = value;
  //   print(_influencerWaitingVideoListLoading);
  //   notifyListeners();
  // }

  // Future<void> fetchInfluencerWaitingVideoList(String? date) async {
  //   String queryParam = "";
  //   if (date != null && date.isNotEmpty) {
  //     queryParam = '?date=$date'; // Add the date as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setInfluencerWaitingVideoListLoading(true);
  //   setInfluencerWaitingVideoList(ApiResponse.loading());
  //   _influencersOrderRepo
  //       .fetchInfluencersWaitingVideoList(queryParam)
  //       .then((value) {
  //     setInfluencerWaitingVideoList(ApiResponse.completed(value));
  //     setInfluencerWaitingVideoListLoading(false);
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setInfluencerWaitingVideoList(ApiResponse.error(error.toString()));
  //   });
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

  // // bool _influencerCompletedVideoListLoading = false;
  // // bool get influencerCompletedVideoListLoading =>
  // //     _influencerCompletedVideoListLoading;

  // // setInfluencerCompletedVideoListLoading(bool value) {
  // //   _influencerCompletedVideoListLoading = value;
  // //   print(_influencerCompletedVideoListLoading);
  // //   notifyListeners();
  // // }

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

  ApiResponse<UserOrderDetailDataModel> _userOrderData = ApiResponse.loading();
  ApiResponse<UserOrderDetailDataModel> get userOrderData => _userOrderData;

  setUserOrderData(ApiResponse<UserOrderDetailDataModel> response) {
    _userOrderData = response;
    _userOrderData.toString();
    notifyListeners();
  }

  UsersOrderRepo _userOrderRepo = UsersOrderRepo();
  Future<void> fetchUserOrderData(String videoTypeId) async {
    setUserOrderData(ApiResponse.loading());
    _userOrderRepo.fetchUserOrderData(videoTypeId).then((value) {
      setUserOrderData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setUserOrderData(ApiResponse.error(error.toString()));
    });
  }
}
