import 'dart:io';

import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/influencer_all_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_completed_order_list_data_model/influencer_completed_order_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_pending_orders_data_model/influencer_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_rejected_order_list_data_model/influencer_rejected_order_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_waiting_video_list_data_model/influencer_waiting_video_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/update_status_data_model/update_status_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/upload_video_data_model/upload_video_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_activity_history_data_model/user_activity_history_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class InfleuncersOrderRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerAllOrdersDataModel> fetchInfluencersAllOrdersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerAllOrdersListUrl + dateQuery!, true);
      return response = InfluencerAllOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerPendingOrdersDataModel> fetchInfluencerPendingOrdersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerPendingOrdersListUrl + dateQuery!, true);
      return response = InfluencerPendingOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerWaitingVideoListDataModel> fetchInfluencersWaitingVideoList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerWaitingvideoUrl + dateQuery!, true);
      return response = InfluencerWaitingVideoListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerCompletedOrderListDataModel>
      fetchInfluencersCompletedVideoList(String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerCompletedVideoListUrl + dateQuery!, true);
      return response = InfluencerCompletedOrderListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerRejectedOrderListDataModel>
      fetchInfluencersRejectedVideoList(String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerRejectedOrderListUrl + dateQuery!, true);
      return response = InfluencerRejectedOrderListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UpdateStatusDataModel> fetchUploadStatusResponse(
      dynamic data, String videoTypeId) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.influencerAcceptOrderUrl + videoTypeId, data, true);
      return response = UpdateStatusDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UploadVideoDataModel> fetchUploadVideoResponse(
      File file, dynamic data) async {
    try {
      dynamic response = await apiServices.getPostMultipartResponse(
          AppUrl.influencerUploadUserVideoUrl, file, data, true);

      print(response);
      return response = UploadVideoDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserActivityHistoryDataModel> fetchInfluencerActiveHistoryData(
      String videoTypeId) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userActiveHistoryUrl + videoTypeId, true);
      return response = UserActivityHistoryDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
