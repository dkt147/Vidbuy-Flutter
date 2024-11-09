import 'dart:io';

import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/active_history_data_model/active_history_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/influencer_all_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_pending_orders_data_model/influencer_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_waiting_video_list_data_model/influencer_waiting_video_list_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/update_status_data_model/update_status_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/upload_video_data_model/upload_video_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class InfleuncersOrderRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<InfluencerAllOrdersDataModel> fetchInfluencersAllOrdersList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerAllOrdersListUrl, true);
      return response = InfluencerAllOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerPendingOrdersDataModel>
      fetchInfluencerPendingOrdersList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerPendingOrdersListUrl, true);
      return response = InfluencerPendingOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerWaitingVideoListDataModel>
      fetchInfluencersWaitingVideoList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerWaitingvideoUrl, true);
      return response = InfluencerWaitingVideoListDataModel.fromJson(response);
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
      return response = UploadVideoDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<ActiveHistoryDataModel> fetchInfluencerActiveHistoryData(
      String videoTypeId) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerActiveHistoryUrl + videoTypeId, true);
      return response = ActiveHistoryDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
