import 'dart:io';

import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/influencer_all_orders_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_pending_orders_data_model/influencer_pending_orders_data_model.dart';
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

  Future<InfluencerAllOrdersDataModel>
      fetchInfluencersWaitingVideoList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.influencerWaitingvideoUrl, true);
      return response = InfluencerAllOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<InfluencerPendingOrdersDataModel> fetchUploadVideoResponse(
      File file, dynamic data) async {
    try {
      dynamic response = await apiServices.getPostMultipartResponse(
          AppUrl.influencerPendingOrdersListUrl, file, data, true);
      return response = InfluencerPendingOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
