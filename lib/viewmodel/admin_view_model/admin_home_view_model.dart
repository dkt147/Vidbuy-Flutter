import 'package:flutter/material.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/admin_model/admin_graph_date_wise_data_model/admin_graph_date_wise_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_total_influencer_data_model/admin_total_influencer_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_yearly_graph_data_model/admin_yearly_graph_data_model.dart';
import 'package:vidbuy_app/repo/admin_repo/admin_home_repo.dart';

class AdminHomeViewModel with ChangeNotifier {
  AdminHomeRepo _adminHomeRepo = AdminHomeRepo();

  ApiResponse<AdminYearlyGraphDataModel> _adminYearlyGraphData =
      ApiResponse.loading();
  ApiResponse<AdminYearlyGraphDataModel> get adminYearlyGraphData =>
      _adminYearlyGraphData;

  setAdminYearlyGraphData(ApiResponse<AdminYearlyGraphDataModel> response) {
    _adminYearlyGraphData = response;
    _adminYearlyGraphData.toString();
    notifyListeners();
  }

  Future<void> fetchAdminYearlyGraphData() async {
    setAdminYearlyGraphData(ApiResponse.loading());
    _adminHomeRepo.fetchAdminGraphYearly().then((value) {
      setAdminYearlyGraphData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminYearlyGraphData(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<AdminGraphDateWiseDataModel> _adminDateWiseGraphData =
      ApiResponse.loading();
  ApiResponse<AdminGraphDateWiseDataModel> get adminDateWiseGraphData =>
      _adminDateWiseGraphData;

  setAdminDateWiseGraphData(ApiResponse<AdminGraphDateWiseDataModel> response) {
    _adminDateWiseGraphData = response;
    _adminDateWiseGraphData.toString();
    notifyListeners();
  }

  Future<void> fetchAdminDateWiseGraphData(
      String startDate, String endDate) async {
    String queryParam = '?start_date=$startDate&end_date=$endDate';
    setAdminDateWiseGraphData(ApiResponse.loading());
    _adminHomeRepo.fetchAdminGraphDatewise(queryParam).then((value) {
      setAdminDateWiseGraphData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminDateWiseGraphData(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<AdminTotalInfluencerDataModel> _adminTotalInfluencerData =
      ApiResponse.loading();
  ApiResponse<AdminTotalInfluencerDataModel> get adminTotalInfluencerData =>
      _adminTotalInfluencerData;

  setAdminTotalInfluencerData(
      ApiResponse<AdminTotalInfluencerDataModel> response) {
    _adminTotalInfluencerData = response;
    _adminTotalInfluencerData.toString();
    notifyListeners();
  }

  Future<void> fetchAdminTotalInfluencerData() async {
    setAdminTotalInfluencerData(ApiResponse.loading());
    _adminHomeRepo.fetchAdminTotalInfluencer().then((value) {
      setAdminTotalInfluencerData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setAdminTotalInfluencerData(ApiResponse.error(error.toString()));
    });
  }
}
