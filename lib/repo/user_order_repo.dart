import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/user_model/update_user_video_status_data_model/update_user_video_status_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_activity_history_data_model/user_activity_history_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_all_orders_data_model/user_all_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_completed_order_list_data_model/user_completed_order_list_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_order_detail_data_model/user_order_detail_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_pending_orders_data_model/user_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_rejected_orders_data_model/user_rejected_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_review_data_model/user_review_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_waiting_video_data_model/user_waiting_video_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UsersOrderRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<UserAllOrdersDataModel> fetchUserAllOrdersList(int page) async {
    try {
      final String paginatedQuery = '?page=$page';
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userAllOrdersListUrl + paginatedQuery, true);
      print(response);
      return UserAllOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserPendingOrdersDataModel> fetchUserPendingOrdersList(
      int page) async {
    try {
      final String paginatedQuery = '?page=$page';
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userPendingOrdersListUrl + paginatedQuery, true);
      return response = UserPendingOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserWaitingVideoDataModel> fetchUserWaitingVideoList(int page) async {
    try {
      final String paginatedQuery = '?page=$page';
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userWaitingvideoUrl + paginatedQuery, true);
      return response = UserWaitingVideoDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserCompletedOrderListDataModel> fetchUserCompletedVideoList(
      int page) async {
    try {
      final String paginatedQuery = '?page=$page';
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userCompletedOrdersListUrl + paginatedQuery, true);
      return response = UserCompletedOrderListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserRejectedOrdersDataModel> fetchUserRejectedVideoList(
      int page) async {
    try {
      final String paginatedQuery = '?page=$page';
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userRejectedOrdersListUrl + paginatedQuery, true);
      return response = UserRejectedOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserActivityHistoryDataModel> fetchUserActiveHistoryData(
      String videoTypeId) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userActiveHistoryUrl + videoTypeId, true);
      print(response);
      return response = UserActivityHistoryDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserOrderDetailDataModel> fetchUserOrderData(
      String videoTypeId) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userOrderHistoryUrl + videoTypeId, true);
      print(response);
      return response = UserOrderDetailDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UpdateUserVideoStatusDataModel> fetchAcceptUserVideoOrderResponse(
      dynamic data, String id) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.userAcceptVideoOrderUrl + id, data, true);
      print(response); // Print the raw response

      return UpdateUserVideoStatusDataModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserReviewDataModel> fetchUserReviewResponse(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.userReviewUrl, data, true);
      print(response); // Print the raw response

      return UserReviewDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
