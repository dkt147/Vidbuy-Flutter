import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/admin_model/admin_change_influencer_status_data_model/admin_change_influencer_status_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_pending_influencer_list_data_model/admin_pending_influencer_list_data_model.dart';
import 'package:vidbuy_app/repo/admin_repo/admin_influencer_repo.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/view/approved_admin_screen.dart';
import 'package:vidbuy_app/view/cancel_screen.dart';
import 'package:vidbuy_app/view/pending_admin_screen.dart';

class AdminInfluencersViewModel with ChangeNotifier {
  AdminInfleuncerRepo _adminInfluencerRepo = AdminInfleuncerRepo();

  // bool _influencerAllOrdersListLoading = false;
  // bool get influencerAllOrdersListLoading => _influencerAllOrdersListLoading;

  // setInfluencerAllOrdersListLoading(bool value) {
  //   _influencerAllOrdersListLoading = value;
  //   print(_influencerAllOrdersListLoading);
  //   notifyListeners();
  // }

  ApiResponse<AdminPendingInfluencerListDataModel> _adminPendingInfluencerList =
      ApiResponse.loading();
  ApiResponse<AdminPendingInfluencerListDataModel>
      get adminPendingInfluencerList => _adminPendingInfluencerList;

  setAdminPendingInfluencerList(
      ApiResponse<AdminPendingInfluencerListDataModel> response) {
    _adminPendingInfluencerList = response;
    _adminPendingInfluencerList.toString();
    notifyListeners();
  }

  Future<void> fetchAdminPendingInfluencersList(String? search) async {
    String queryParam = "";
    if (search != null && search.isNotEmpty) {
      queryParam = '?search=$search'; // Add the search as a query parameter
    } else {
      queryParam = "";
    }
    setAdminPendingInfluencerList(ApiResponse.loading());
    _adminInfluencerRepo
        .fetchAdminPendingInfluencersList(queryParam)
        .then((value) {
      setAdminPendingInfluencerList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminPendingInfluencerList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<AdminPendingInfluencerListDataModel>
      _adminApprovedInfluencerList = ApiResponse.loading();
  ApiResponse<AdminPendingInfluencerListDataModel>
      get adminApprovedInfluencerList => _adminApprovedInfluencerList;

  setAdminApprovedInfluencerList(
      ApiResponse<AdminPendingInfluencerListDataModel> response) {
    _adminApprovedInfluencerList = response;
    _adminApprovedInfluencerList.toString();
    notifyListeners();
  }

  Future<void> fetchAdminApprovedInfluencersList(String? search) async {
    String queryParam = "";
    if (search != null && search.isNotEmpty) {
      queryParam = '?search=$search'; // Add the search as a query parameter
    } else {
      queryParam = "";
    }
    setAdminApprovedInfluencerList(ApiResponse.loading());
    _adminInfluencerRepo
        .fetchAdminApprovedInfluencersList(queryParam)
        .then((value) {
      setAdminApprovedInfluencerList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminApprovedInfluencerList(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<AdminPendingInfluencerListDataModel>
      _adminCancelledInfluencerList = ApiResponse.loading();
  ApiResponse<AdminPendingInfluencerListDataModel>
      get adminCancelledInfluencerList => _adminCancelledInfluencerList;

  setAdminCancelledInfluencerList(
      ApiResponse<AdminPendingInfluencerListDataModel> response) {
    _adminCancelledInfluencerList = response;
    _adminCancelledInfluencerList.toString();
    notifyListeners();
  }

  Future<void> fetchAdminCancelledInfluencersList(String? search) async {
    String queryParam = "";
    if (search != null && search.isNotEmpty) {
      queryParam = '?search=$search'; // Add the search as a query parameter
    } else {
      queryParam = "";
    }
    setAdminCancelledInfluencerList(ApiResponse.loading());
    _adminInfluencerRepo
        .fetchAdminRejectedInfluencersList(queryParam)
        .then((value) {
      setAdminCancelledInfluencerList(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminCancelledInfluencerList(ApiResponse.error(error.toString()));
    });
  }

  bool _changeStatusLoading = false;
  bool get changeStatusLoading => _changeStatusLoading;

  setChangeStatusLoading(bool value) {
    _changeStatusLoading = value;
    print(_changeStatusLoading);
    notifyListeners();
  }

  ApiResponse<AdminChangeInfluencerStatusDataModel> _adminChangeStatusData =
      ApiResponse.loading();
  ApiResponse<AdminChangeInfluencerStatusDataModel> get adminChangeStatusData =>
      _adminChangeStatusData;

  setAdminChangeStatusData(
      ApiResponse<AdminChangeInfluencerStatusDataModel> response) {
    _adminChangeStatusData = response;
    _adminChangeStatusData.toString();
    notifyListeners();
  }

  Future<void> fetchChangeInfluencerStatus(
      String status, String influencerId, context) async {
    Map<String, dynamic> statusData = {'status': status};
    setChangeStatusLoading(true);
    setAdminChangeStatusData(ApiResponse.loading());
    _adminInfluencerRepo
        .fetchAdminInfluencersStatus(influencerId, statusData)
        .then((value) {
      if (value.Isbool!) {
        setAdminChangeStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        navigatePushReplace(
          context,
          MainTabbarAdminWidget(),
        );
      } else {
        Utils.snackBar(value.message.toString(), context);
      }

      setChangeStatusLoading(false);
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
}
