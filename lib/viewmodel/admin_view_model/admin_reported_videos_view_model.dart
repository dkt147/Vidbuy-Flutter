import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/admin_model/admin_reported_videos_data_model/admin_reported_videos_data_model.dart';
import 'package:vidbuy_app/repo/admin_repo/admin_reported_videos_repo.dart';

class AdminReportedVideosViewModel with ChangeNotifier {
  AdminReportedVideosRepo _adminReportedVideosRepo = AdminReportedVideosRepo();

  // bool _influencerAllOrdersListLoading = false;
  // bool get influencerAllOrdersListLoading => _influencerAllOrdersListLoading;

  // setInfluencerAllOrdersListLoading(bool value) {
  //   _influencerAllOrdersListLoading = value;
  //   print(_influencerAllOrdersListLoading);
  //   notifyListeners();
  // }

  ApiResponse<AdminReportedVideosDataModel> _adminReportedVideoList =
      ApiResponse.loading();
  ApiResponse<AdminReportedVideosDataModel> get adminReportedVideoList =>
      _adminReportedVideoList;

  setAdminReportedVideoList(
      ApiResponse<AdminReportedVideosDataModel> response) {
    _adminReportedVideoList = response;
    _adminReportedVideoList.toString();
    notifyListeners();
  }

  Future<void> fetchAdminReportedVideosList(String? page) async {
    String queryParam = "";
    if (page != null && page.isNotEmpty) {
      queryParam = '?page=$page'; // Add the search as a query parameter
    } else {
      queryParam = "";
    }
    setAdminReportedVideoList(ApiResponse.loading());
    _adminReportedVideosRepo
        .fetchAdminReportedVideosList(queryParam)
        .then((value) {
      setAdminReportedVideoList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAdminReportedVideoList(ApiResponse.error(error.toString()));
    });
  }
}
