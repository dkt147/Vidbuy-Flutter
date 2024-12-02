import 'package:vidbuy_app/data/network/base_api_services.dart';
import 'package:vidbuy_app/data/network/network_api_services.dart';
import 'package:vidbuy_app/model/admin_model/admin_change_order_status_data_model/admin_change_order_status_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_completed_orders_data_model/admin_completed_orders_data_model.dart';
import 'package:vidbuy_app/model/admin_model/admin_rejected_orders_data_model/admin_rejected_orders_data_model.dart';
import 'package:vidbuy_app/resources/app_url.dart';

class AdminRejectedOrdersRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<AdminRejectedOrdersDataModel> fetchAdminRejectedOrdersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminRejectedOrderListUrl + dateQuery!, true);
      return response = AdminRejectedOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminCompletedOrdersDataModel> fetchAdminCompletedOrdersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminCompletedOrderListUrl + dateQuery!, true);
      return response = AdminCompletedOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

    Future<AdminCompletedOrdersDataModel> fetchAdminRefundOrdersList(
      String? dateQuery) async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.adminRefundOrderListUrl + dateQuery!, true);
      return response = AdminCompletedOrdersDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AdminChangeOrderStatusDataModel> fetchAdminOrderStatus(
      String orderId, dynamic status) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.adminChangeOrderStatusUrl + orderId, status, true);
      return response = AdminChangeOrderStatusDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
