import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/admin_model/admin_reported_videos_data_model/admin_reported_videos_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class AdminReportedVideosRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<AdminReportedVideosDataModel> fetchAdminReportedVideosList(
      String? page) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminReportedVideosListUrl + page!, true);
      return response = AdminReportedVideosDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
