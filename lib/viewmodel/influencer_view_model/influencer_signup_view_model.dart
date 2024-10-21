import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/generic_signup_data_model/generic_signup_data_model.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';
import 'package:vidbuy_app/view/otp_scren.dart';

class InfluencerSignupViewModel extends ChangeNotifier {
  SignupRepo _signupRepo = SignupRepo();
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ApiResponse<GenericSignupDataModel> _influencerSignupData =
      ApiResponse.loading();
  ApiResponse<GenericSignupDataModel> get influencerSignupData =>
      _influencerSignupData;

  void setInfluencerSignupData(ApiResponse<GenericSignupDataModel> response) {
    _influencerSignupData = response;
    notifyListeners();
  }

  File? _profileImage;
  File? get profileImage => _profileImage;

  String? _base64Image;
  String? get base64Image => _base64Image;

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

Future<void> fetchInfluencerSignupData(
    BuildContext context, {
    required String name,
    required String username,
    required String email,
    required String password,
    required String country,
    required String? base64Image,
  }) async {
    if (_validateFields(
        context, name, username, email, password, base64Image)) {
      // Return early if validation fails

      Map<String, dynamic> registrationData = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'country_id': '5',
        // 'profile_image': base64Image,
        'role_id': '3',
      };

      setLoading(true);
      setInfluencerSignupData(ApiResponse.loading());
      _signupRepo.fetchGenericSignupResponse(registrationData).then((value) async {
        setInfluencerSignupData(ApiResponse.completed(value));

        // Check if value.result is a Map and access code properly
        if (value.result is Map<String, dynamic>) {
          String verificationCode = value.result['code'].toString();
          navigate(context, OtpScren(code: verificationCode));
        } 
        // else {
        //   // Handle unexpected result structure
        //   Utils.snackBar("Unexpected response structure.", context);
        // }

        setLoading(false);
        Utils.snackBar(value.message.toString(), context);

        if (kDebugMode) {
          print(value.toString());
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.snackBar(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      });
    }
  }


  // Future<bool> fetchInfluencerSignupData(
  //   BuildContext context, {
  //   required String name,
  //   required String username,
  //   required String email,
  //   required String password,
  //   required String country,
  //   required String? base64Image,
  // }) async {
  //   if (_validateFields(context, name, username, email, password, base64Image)) {

  //   }

  //   setLoading(true);

  //   // Prepare the registration data
  //   Map registrationData = {
  //     'name': name,
  //     'username': username,
  //     'email': email,
  //     'password': password,
  //     'country': "1",
  //     'profile_image': base64Image,
  //     'role_id': "3",
  //   };

  //   _signupRepo.fetchGenericSignupResponse(registrationData).then((value) async {
  //     print(value);
  //     setLoading(false);

  //     Utils.snackBar(value.message.toString(), context);

  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     Utils.snackBar(error.toString(), context);
  //   });

  // }

  bool _validateFields(BuildContext context, String name, String username,
      String email, String password, String? base64Image) {
    if (name.isEmpty) {
      Utils.errorSnackBar('Please enter your name', context);
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
    if (password.isEmpty || password.length < 8) {
      Utils.snackBar('Password must be at least 8 characters long', context);
      return false;
    }
    if (base64Image == null) {
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
}
