import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/admin_model/admin_change_influencer_status_data_model/admin_change_influencer_status_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_pending_influencer_list_data_model/admin_pending_influencer_list_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class AdminInfleuncerRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<AdminPendingInfluencerListDataModel> fetchAdminPendingInfluencersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminPendingInfluencersUrl + dateQuery!, true);
      return response = AdminPendingInfluencerListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminPendingInfluencerListDataModel> fetchAdminApprovedInfluencersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminApprovedInfluencersUrl + dateQuery!, true);
      return response = AdminPendingInfluencerListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminPendingInfluencerListDataModel> fetchAdminRejectedInfluencersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminRejectedInfluencersUrl + dateQuery!, true);
      return response = AdminPendingInfluencerListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminChangeInfluencerStatusDataModel> fetchAdminInfluencersStatus(
      String influencerId, dynamic status) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.adminChangeInfluencerStatusUrl + influencerId, status, true);
      return response = AdminChangeInfluencerStatusDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  // Future<InfluencerPendingOrdersDataModel> fetchInfluencerPendingOrdersList(
  //     String? dateQuery) async {
  //   try {
  //     dynamic response = await apiServices.getGetApiResponse(
  //         AppUrl.influencerPendingOrdersListUrl + dateQuery!, true);
  //     return response = InfluencerPendingOrdersDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<InfluencerWaitingVideoListDataModel> fetchInfluencersWaitingVideoList(
  //     String? dateQuery) async {
  //   try {
  //     dynamic response = await apiServices.getGetApiResponse(
  //         AppUrl.influencerWaitingvideoUrl + dateQuery!, true);
  //     return response = InfluencerWaitingVideoListDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<InfluencerCompletedOrderListDataModel>
  //     fetchInfluencersCompletedVideoList(String? dateQuery) async {
  //   try {
  //     dynamic response = await apiServices.getGetApiResponse(
  //         AppUrl.influencerCompletedVideoListUrl + dateQuery!, true);
  //     return response = InfluencerCompletedOrderListDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<InfluencerRejectedOrderListDataModel>
  //     fetchInfluencersRejectedVideoList(String? dateQuery) async {
  //   try {
  //     dynamic response = await apiServices.getGetApiResponse(
  //         AppUrl.influencerRejectedOrderListUrl + dateQuery!, true);
  //     return response = InfluencerRejectedOrderListDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<UpdateStatusDataModel> fetchUploadStatusResponse(
  //     dynamic data, String videoTypeId) async {
  //   try {
  //     dynamic response = await apiServices.getPostApiResponse(
  //         AppUrl.influencerAcceptOrderUrl + videoTypeId, data, true);
  //     return response = UpdateStatusDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<UploadVideoDataModel> fetchUploadVideoResponse(
  //     File file, dynamic data) async {
  //   try {
  //     dynamic response = await apiServices.getPostMultipartResponse(
  //         AppUrl.influencerUploadUserVideoUrl, file, data, true);

  //     print(response);
  //     return response = UploadVideoDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<UserActivityHistoryDataModel> fetchInfluencerActiveHistoryData(
  //     String videoTypeId) async {
  //   try {
  //     dynamic response = await apiServices.getGetApiResponse(
  //         AppUrl.userActiveHistoryUrl + videoTypeId, true);
  //     return response = UserActivityHistoryDataModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
