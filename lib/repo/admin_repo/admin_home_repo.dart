import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/admin_model/admin_graph_date_wise_data_model/admin_graph_date_wise_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_total_influencer_data_model/admin_total_influencer_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_yearly_graph_data_model/admin_yearly_graph_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class AdminHomeRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<AdminYearlyGraphDataModel> fetchAdminGraphYearly() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminGraphYearlyUrl,
          // "https://mocki.io/v1/c3591325-545d-474a-971f-f3be8f2bd6dc",
          true);
      return response = AdminYearlyGraphDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminTotalInfluencerDataModel> fetchAdminTotalInfluencer() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminTotalInfluencerUrl, true);
      return response = AdminTotalInfluencerDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminGraphDateWiseDataModel> fetchAdminGraphDatewise(
      String dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminGraphDateWiseUrl + dateQuery,
          // "https://mocki.io/v1/17bc5eb7-70b3-40ad-b061-e60e91152575",
          true);
      return response = AdminGraphDateWiseDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
