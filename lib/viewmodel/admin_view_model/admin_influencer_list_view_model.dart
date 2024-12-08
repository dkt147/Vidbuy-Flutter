import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/admin_model/admin_change_influencer_status_data_model/admin_change_influencer_status_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_influencer_detail_data_model/admin_influencer_detail_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_pending_influencer_list_data_model/admin_pending_influencer_list_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_pending_influencer_list_data_model/datum.dart';
import 'package:vidbuy_app/repo/admin_repo/admin_influencer_repo.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';

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

  final List<AdminPendingListDatum> _adminPendingList = [];
  List<AdminPendingListDatum> get adminPendingList => _adminPendingList;

  bool _isAdminPendingListLoading = false;
  bool get isAdminPendingListLoading => _isAdminPendingListLoading;

  bool _isFetchingMorePendingAdminList = false;
  bool get isFetchingMorePendingAdminList => _isFetchingMorePendingAdminList;

  int _currentPageAdminPendingList = 1;
  bool _hasMoreAdminPendingList = true;
  bool get hasMoreAdminPendingList => _hasMoreAdminPendingList;

  void setAdminInfluencerPendingList(
      ApiResponse<AdminPendingInfluencerListDataModel> response) {
    _adminPendingInfluencerList = response;
    notifyListeners();
  }

  Future<void> fetchAdminPendingInfluencersList(String? search,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreAdminPendingList) return;

    if (!isLoadMore) {
      _isAdminPendingListLoading = true;
      _currentPageAdminPendingList = 1;
      _adminPendingList.clear();
      setAdminInfluencerPendingList(ApiResponse.loading());
    } else {
      _isFetchingMorePendingAdminList = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageAdminPendingList";
      if (search != null && search.isNotEmpty) {
        queryParam += "&search=$search";
      }

      final value = await _adminInfluencerRepo
          .fetchAdminPendingInfluencersList(queryParam);

      _adminPendingList.addAll(value.result!.data!.data!);
      _hasMoreAdminPendingList = value.result!.data!.data!.isNotEmpty;
      _currentPageAdminPendingList++;

      setAdminInfluencerPendingList(ApiResponse.completed(value));
    } catch (error) {
      setAdminInfluencerPendingList(ApiResponse.error(error.toString()));
    } finally {
      _isAdminPendingListLoading = false;
      _isFetchingMorePendingAdminList = false;
      notifyListeners();
    }
  }

  void resetAdminPendingListPagination() {
    _currentPageAdminPendingList = 1;
    _hasMoreAdminPendingList = true;
    _adminPendingList.clear();
  }

  // ApiResponse<AdminPendingInfluencerListDataModel> _adminPendingInfluencerList =
  //     ApiResponse.loading();
  // ApiResponse<AdminPendingInfluencerListDataModel>
  //     get adminPendingInfluencerList => _adminPendingInfluencerList;

  // setAdminPendingInfluencerList(
  //     ApiResponse<AdminPendingInfluencerListDataModel> response) {
  //   _adminPendingInfluencerList = response;
  //   _adminPendingInfluencerList.toString();
  //   notifyListeners();
  // }

  // Future<void> fetchAdminPendingInfluencersList(String? search) async {
  //   String queryParam = "";
  //   if (search != null && search.isNotEmpty) {
  //     queryParam = '?search=$search'; // Add the search as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setAdminPendingInfluencerList(ApiResponse.loading());
  //   _adminInfluencerRepo
  //       .fetchAdminPendingInfluencersList(queryParam)
  //       .then((value) {
  //     setAdminPendingInfluencerList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setAdminPendingInfluencerList(ApiResponse.error(error.toString()));
  //   });
  // }

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

  final List<AdminPendingListDatum> _adminApprovedList = [];
  List<AdminPendingListDatum> get adminApprovedList => _adminApprovedList;

  bool _isAdminApprovedListLoading = false;
  bool get isAdminApprovedListLoading => _isAdminApprovedListLoading;

  bool _isFetchingMoreApprovedAdminList = false;
  bool get isFetchingMoreApprovedAdminList => _isFetchingMoreApprovedAdminList;

  int _currentPageAdminApprovedList = 1;
  bool _hasMoreAdminApprovedList = true;
  bool get hasMoreAdminApprovedList => _hasMoreAdminApprovedList;

  Future<void> fetchAdminApprovedInfluencersList(String? search,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreAdminApprovedList) return;

    if (!isLoadMore) {
      _isAdminApprovedListLoading = true;
      _currentPageAdminApprovedList = 1;
      _adminApprovedList.clear();
      setAdminApprovedInfluencerList(ApiResponse.loading());
    } else {
      _isFetchingMoreApprovedAdminList = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageAdminApprovedList";
      if (search != null && search.isNotEmpty) {
        queryParam += "&search=$search";
      }

      final value = await _adminInfluencerRepo
          .fetchAdminApprovedInfluencersList(queryParam);

      _adminApprovedList.addAll(value.result!.data!.data!);
      _hasMoreAdminApprovedList = value.result!.data!.data!.isNotEmpty;
      _currentPageAdminApprovedList++;

      setAdminApprovedInfluencerList(ApiResponse.completed(value));
    } catch (error) {
      setAdminApprovedInfluencerList(ApiResponse.error(error.toString()));
    } finally {
      _isAdminApprovedListLoading = false;
      _isFetchingMoreApprovedAdminList = false;
      notifyListeners();
    }
  }

  void resetAdminApprovedListPagination() {
    _currentPageAdminApprovedList = 1;
    _hasMoreAdminApprovedList = true;
    _adminApprovedList.clear();
  }

  // Future<void> fetchAdminApprovedInfluencersList(String? search) async {
  //   String queryParam = "";
  //   if (search != null && search.isNotEmpty) {
  //     queryParam = '?search=$search'; // Add the search as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setAdminApprovedInfluencerList(ApiResponse.loading());
  //   _adminInfluencerRepo
  //       .fetchAdminApprovedInfluencersList(queryParam)
  //       .then((value) {
  //     setAdminApprovedInfluencerList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setAdminApprovedInfluencerList(ApiResponse.error(error.toString()));
  //   });
  // }

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

  final List<AdminPendingListDatum> _adminCancelledList = [];
  List<AdminPendingListDatum> get adminCancelledList => _adminCancelledList;

  bool _isAdminCancelledListLoading = false;
  bool get isAdminCancelledListLoading => _isAdminCancelledListLoading;

  bool _isFetchingMoreCancelledAdminList = false;
  bool get isFetchingMoreCancelledAdminList =>
      _isFetchingMoreCancelledAdminList;

  int _currentPageAdminCancelledList = 1;
  bool _hasMoreAdminCancelledList = true;
  bool get hasMoreAdminCancelledList => _hasMoreAdminCancelledList;

  Future<void> fetchAdminCancelledInfluencersList(String? search,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !_hasMoreAdminCancelledList) return;

    if (!isLoadMore) {
      _isAdminCancelledListLoading = true;
      _currentPageAdminCancelledList = 1;
      _adminCancelledList.clear();
      setAdminCancelledInfluencerList(ApiResponse.loading());
    } else {
      _isFetchingMoreCancelledAdminList = true;
      notifyListeners();
    }

    try {
      String queryParam = "?page=$_currentPageAdminCancelledList";
      if (search != null && search.isNotEmpty) {
        queryParam += "&search=$search";
      }

      final value = await _adminInfluencerRepo
          .fetchAdminRejectedInfluencersList(queryParam);

      _adminCancelledList.addAll(value.result!.data!.data!);
      _hasMoreAdminCancelledList = value.result!.data!.data!.isNotEmpty;
      _currentPageAdminCancelledList++;

      setAdminCancelledInfluencerList(ApiResponse.completed(value));
    } catch (error) {
      setAdminCancelledInfluencerList(ApiResponse.error(error.toString()));
    } finally {
      _isAdminCancelledListLoading = false;
      _isFetchingMoreCancelledAdminList = false;
      notifyListeners();
    }
  }

  void resetAdminCancelledListPagination() {
    _currentPageAdminCancelledList = 1;
    _hasMoreAdminCancelledList = true;
    _adminCancelledList.clear();
  }

  // Future<void> fetchAdminCancelledInfluencersList(String? search) async {
  //   String queryParam = "";
  //   if (search != null && search.isNotEmpty) {
  //     queryParam = '?search=$search'; // Add the search as a query parameter
  //   } else {
  //     queryParam = "";
  //   }
  //   setAdminCancelledInfluencerList(ApiResponse.loading());
  //   _adminInfluencerRepo
  //       .fetchAdminRejectedInfluencersList(queryParam)
  //       .then((value) {
  //     setAdminCancelledInfluencerList(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setAdminCancelledInfluencerList(ApiResponse.error(error.toString()));
  //   });
  // }

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
      String status, String influencerId, context, VoidCallback func) async {
    Map<String, dynamic> statusData = {'status': status};
    setChangeStatusLoading(true);
    setAdminChangeStatusData(ApiResponse.loading());
    _adminInfluencerRepo
        .fetchAdminInfluencersStatus(influencerId, statusData)
        .then((value) {
      if (value.Isbool!) {
        setAdminChangeStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        func.call();
      } else {
        Utils.snackBar(value.message.toString(), context);
      }

      setChangeStatusLoading(false);
    }).onError((error, stackTrace) {
      setAdminChangeStatusData(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<AdminInfluencerDetailDataModel> _influencerHistoryData =
      ApiResponse.loading();
  ApiResponse<AdminInfluencerDetailDataModel> get influencerHistoryData =>
      _influencerHistoryData;

  setInfluencerHistoryData(
      ApiResponse<AdminInfluencerDetailDataModel> response) {
    _influencerHistoryData = response;
    _influencerHistoryData.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerData(String videoTypeId) async {
    setInfluencerHistoryData(ApiResponse.loading());
    _adminInfluencerRepo.fetchAdminInfluencerData(videoTypeId).then((value) {
      setInfluencerHistoryData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerHistoryData(ApiResponse.error(error.toString()));
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
