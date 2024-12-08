import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/delete_account_data_model.dart';
import 'package:vidbuy_app/model/user_model/change_password_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_edit_profile_data_model/user.dart';
import 'package:vidbuy_app/model/user_model/user_edit_profile_data_model/user_edit_profile_data_model.dart';
import 'package:vidbuy_app/model/verify_passwrod_data_model.dart';
import 'package:vidbuy_app/repo/user_profile_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/resources/log_out.dart';
import 'package:vidbuy_app/view/delete_confirm_account_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class UserProfileViewModel with ChangeNotifier {
  UserProfileRepo _userProfileRepo = UserProfileRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  File? _profileImage;
  File? get profileImage => _profileImage;

  String? _base64Image;
  String? get base64Image => _base64Image;

  void clearProfileImage() {
    _profileImage = null;
    notifyListeners();
  }

  Future<void> pickProfileImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        _profileImage = File(image.path);
        _base64Image = base64Encode(_profileImage!.readAsBytesSync());
        notifyListeners(); // Notify listeners after updating the image
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  ApiResponse<VerifyPasswrodDataModel> _verifyPasswordData =
      ApiResponse.loading();
  ApiResponse<VerifyPasswrodDataModel> get verifyPasswordData =>
      _verifyPasswordData;

  void setVerifyPasswordData(ApiResponse<VerifyPasswrodDataModel> response) {
    _verifyPasswordData = response;
    notifyListeners();
  }

  Future<void> fetchVerifyPasswordResponse(
    BuildContext context, {
    required String password,
  }) async {
    if (_validateFields(context, password)) {
      // Return early if validation fails

      Map<String, dynamic> passwordData = {
        'password': password,
      };
      setLoading(true);
      setVerifyPasswordData(ApiResponse.loading());
      _userProfileRepo.fetchVerifyPassword(passwordData).then((value) async {
        if (value.Isbool!) {
          setVerifyPasswordData(ApiResponse.completed(value));
          Utils.snackBar(value.message.toString(), context);
          navigate(context, DeleteConfirmAccountScreen());
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

  bool _validateFields(BuildContext context, String password) {
    if (password.isEmpty || password.length < 8) {
      Utils.snackBar('Please enter corrrect password', context);
      return false;
    }

    return true;
  }

  bool _deleteAccountLoading = false;
  bool get deleteAccountLoading => _deleteAccountLoading;

  setdeleteAccountLoading(bool value) {
    _deleteAccountLoading = value;
    print(_deleteAccountLoading);
    notifyListeners();
  }

  ApiResponse<DeleteAccountDataModel> _deleteAccountData =
      ApiResponse.loading();
  ApiResponse<DeleteAccountDataModel> get deleteAccountData =>
      _deleteAccountData;

  void setDeleteAccountData(ApiResponse<DeleteAccountDataModel> response) {
    _deleteAccountData = response;
    notifyListeners();
  }

  Future<void> fetchDeleteAccountResponse(BuildContext context) async {
    Map<String, dynamic> passwordData = {};
    setdeleteAccountLoading(true);
    setDeleteAccountData(ApiResponse.loading());
    _userProfileRepo
        .fetchDeleteAccountResponse(passwordData)
        .then((value) async {
      setDeleteAccountData(ApiResponse.completed(value));
      Utils.snackBar(value.message.toString(), context);
      logOut(context, false);
      setdeleteAccountLoading(false);
    }).onError((error, stackTrace) {
      setdeleteAccountLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  ApiResponse<DeleteAccountDataModel> _logoutAccountData =
      ApiResponse.loading();
  ApiResponse<DeleteAccountDataModel> get logoutAccountData =>
      _logoutAccountData;

  void setLogoutAccountData(ApiResponse<DeleteAccountDataModel> response) {
    _logoutAccountData = response;
    notifyListeners();
  }

  Future<void> fetchLogOutAccountResponse(BuildContext context) async {
    Map<String, dynamic> logoutData = {};
    setDeleteAccountData(ApiResponse.loading());
    _userProfileRepo.fetchLogOutAccountResponse(logoutData).then((value) async {
      setDeleteAccountData(ApiResponse.completed(value));
      Utils.snackBar(value.message.toString(), context);
      logOut(context, false);
    }).onError((error, stackTrace) {
      Utils.snackBar(error.toString(), context);
    });
  }

  bool _userEditProfileLoading = false;
  bool get userEditProfileLoading => _userEditProfileLoading;

  setUserEditProfileLoading(bool value) {
    _userEditProfileLoading = value;
    print(_userEditProfileLoading);
    notifyListeners();
  }

  ApiResponse<UserEditProfileDataModel> _userEditProfile =
      ApiResponse.loading();
  ApiResponse<UserEditProfileDataModel> get userEditProfile => _userEditProfile;

  void setUserEditProfile(ApiResponse<UserEditProfileDataModel> response) {
    _userEditProfile = response;
    notifyListeners();
  }

  Future<void> fetchEditProfileResponse(
      BuildContext context,
      String name,
      String username,
      String email,
      String base64Image,
      VoidCallback func) async {
    if (_validateProfileFields(context, name, username, email, base64Image)) {
      Map<String, dynamic> editProfileData = {
        "name": name,
        "username": username,
        "email": email,
        "image": base64Image
      };
      setUserEditProfileLoading(true);
      setUserEditProfile(ApiResponse.loading());
      _userProfileRepo
          .fetchUserEditProfileResponse(editProfileData)
          .then((value) async {
        setUserEditProfile(ApiResponse.completed(value));
        if (value.Isbool!) {
          Utils.snackBar(value.message.toString(), context);
          // navigatePushReplace(context, LoginScreen());
          User user = User.fromJson(value.result["user"]);
          saveUserData(user);
          func.call();
        }
        Utils.snackBar(value.message.toString(), context);
        setUserEditProfileLoading(false);
      }).onError((error, stackTrace) {
        setUserEditProfileLoading(false);
        Utils.snackBar(error.toString(), context);
      });
    }
  }

  Future<void> saveUserData(User user) async {
    LocalData ld = LocalData();
    await ld.saveTokenLocally(
      user.id.toString(),
      user.roleId.toString(),
      user.name.toString(),
      user.username.toString(),
      user.countryId.toString(),
      user.countryName.toString(),
      user.email.toString(),
      user.image.toString(),
      user.status.toString(),
      user.isProfileCompleted.toString(),
      // token,
    );
    await ld.getTokenLocally();
  }

  bool _validateProfileFields(BuildContext context, String name,
      String username, String email, String base64Image) {
    if (name.isEmpty) {
      Utils.snackBar('Please enter your name', context);
      return false;
    }
    if (username.isEmpty) {
      Utils.snackBar('Please enter your username', context);
      return false;
    }
    if (email.isEmpty || !_isValidEmail(email)) {
      Utils.snackBar('Please enter a valid email', context);
      return false;
    }
    if (base64Image == "null") {
      Utils.snackBar('Please select a profile image', context);
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  bool _changePasswordLoading = false;
  bool get changePasswordLoading => _changePasswordLoading;

  setChangePasswordLoading(bool value) {
    _changePasswordLoading = value;
    print(_changePasswordLoading);
    notifyListeners();
  }

  ApiResponse<ChangePasswordDataModel> _changePasswordData =
      ApiResponse.loading();
  ApiResponse<ChangePasswordDataModel> get changePasswordData =>
      _changePasswordData;

  void setChangePasswordData(ApiResponse<ChangePasswordDataModel> response) {
    _changePasswordData = response;
    notifyListeners();
  }

  Future<void> fetchChangePasswordResponse(BuildContext context,
      String oldPassword, String newPassword, VoidCallback func) async {
    Map<String, dynamic> passwordData = {
      "old_password": oldPassword,
      "new_password": newPassword
    };
    setChangePasswordLoading(true);
    setChangePasswordData(ApiResponse.loading());
    _userProfileRepo
        .fetchChangePasswordResponse(passwordData)
        .then((value) async {
      setChangePasswordData(ApiResponse.completed(value));
      Utils.snackBar(value.message.toString(), context);
      func.call();
      setChangePasswordLoading(false);
    }).onError((error, stackTrace) {
      setChangePasswordLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }
}
