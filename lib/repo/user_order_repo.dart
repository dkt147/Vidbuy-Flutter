

import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/user_model/user_all_orders_data_model/user_all_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_pending_orders_data_model/user_pending_orders_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_waiting_video_data_model/user_waiting_video_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class UsersOrderRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<UserAllOrdersDataModel> fetchUserAllOrdersList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userAllOrdersListUrl, true);
      return response = UserAllOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserPendingOrdersDataModel>
      fetchUserPendingOrdersList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userPendingOrdersListUrl, true);
      return response = UserPendingOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UserWaitingVideoDataModel>
      fetchUserWaitingVideoList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.userWaitingvideoUrl, true);
      return response = UserWaitingVideoDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


// Future<CreateUserOrderDataModel> fetchAcceptOrderResponse(
//       dynamic data, String id) async {
//     try {
//       dynamic response = await apiServices.getPostApiResponse(
//           AppUrl.userAddOrderUrl + id, data, true);
//       print(response); // Print the raw response

//       return CreateUserOrderDataModel.fromJson(response);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
}
