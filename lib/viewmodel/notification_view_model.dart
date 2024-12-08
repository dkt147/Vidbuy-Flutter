import 'package:flutter/material.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/notifications_data_model/datum.dart';
import 'package:vidbuy_app/model/nottifications_setting_data_model/nottifications_setting_data_model.dart';
import 'package:vidbuy_app/repo/user_profile_repo.dart';

class NotificationViewModel with ChangeNotifier {
  UserProfileRepo _userProfileRepo = UserProfileRepo();

//   ApiResponse<NotificationsDataModel> _notificationData = ApiResponse.loading();
//   ApiResponse<NotificationsDataModel> get notificationData => _notificationData;

//   void setNotificationData(ApiResponse<NotificationsDataModel> response) {
//     _notificationData = response;
//     notifyListeners();
//   }

//  Future<void> fetchNotificationsResponse(String queryParam) async {
//     setNotificationData(ApiResponse.loading());
//     _userProfileRepo.fetchNotificationsResponse(queryParam).then((value) {
//       setNotificationData(ApiResponse.completed(value));
//       print(value);
//     }).onError((error, stackTrace) {
//       setNotificationData(ApiResponse.error(error.toString()));
//     });
//   }

  final List<NotificationDatum> _notifications = [];
  List<NotificationDatum> get notifications => _notifications;

  bool _isNotificationsFetching = false;
  bool get isNotificationsFetching => _isNotificationsFetching;

  bool _hasNotificationMoreData = true;
  bool get hasNotificationMoreData => _hasNotificationMoreData;

  int _notificationsCurrentPage = 1;

  Future<void> fetchNotificationList() async {
    if (_isNotificationsFetching || !_hasNotificationMoreData) return;
    _isNotificationsFetching = true;
    notifyListeners();

    try {
      final result = await _userProfileRepo
          .fetchNotificationsResponse(_notificationsCurrentPage);

      if (result.data!.isNotEmpty) {
        _notifications.addAll(result.data!);
        _notificationsCurrentPage++;
      } else {
        _hasNotificationMoreData = false; // No more data to load
      }
    } catch (error) {
      print("Error fetching orders: $error");
    } finally {
      _isNotificationsFetching = false;
      notifyListeners();
    }
  }

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  ApiResponse<NottificationsSettingDataModel> _notificationsData =
      ApiResponse.loading();
  ApiResponse<NottificationsSettingDataModel> get notificationsData =>
      _notificationsData;

  void setNotificationsData(
      ApiResponse<NottificationsSettingDataModel> response) {
    _notificationsData = response;
    notifyListeners();
  }

  Future<void> fetchNotificationData(
    BuildContext context, {
    required int notification,
    required int email,
  }) async {
    // Return early if validation fails

    Map<String, dynamic> contactUsData = {
      'push_notification': notification,
      'email_notification': email
    };

    setLoading(true);
    setNotificationsData(ApiResponse.loading());
    _userProfileRepo
        .fetchNotificationSettingResponse(contactUsData)
        .then((value) async {
      if (value.Isbool!) {
        setNotificationsData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }
}
