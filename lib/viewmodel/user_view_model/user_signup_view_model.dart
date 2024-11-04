import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/generic_signup_data_model/generic_signup_data_model.dart';
import 'package:vidbuy_app/model/user_model/upload_image_data_model/upload_image_data_model.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/otp_scren.dart';

class UserSignupViewModel with ChangeNotifier {
  SignupRepo _signupRepo = SignupRepo();

  File? _profileImage;
  File? get profileImage => _profileImage;

  String? _base64Image;
  String? get base64Image => _base64Image;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  // final ImagePicker _picker = ImagePicker();
  // File? _media;
  // bool _isImage = true;

  // File? get media => _media;
  // bool get isImage => _isImage;

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

  ApiResponse<GenericSignupDataModel> _signupData = ApiResponse.loading();
  ApiResponse<GenericSignupDataModel> get signupData => _signupData;

  void setSignupData(ApiResponse<GenericSignupDataModel> response) {
    _signupData = response;
    notifyListeners();
  }

//  Future<void> fetchInfluencerData(BuildContext context,
//       {
//     required String name,
//     required String username,
//     required String email,
//     required String password,
//     required String? base64Image,
//       }) async {
//     // Prepare data for both API calls
// Map<String, dynamic> registrationData = {
//         'name': name,
//         'username': username,
//         'email': email,
//         'password': password,
//         'role_id': '2',
//       };
//     Map<String, dynamic> imageData = {
//       'image': videoTypes,
//     };

//     // Set loading state
//     setpriceTypeLoading(true);
//     setInfluencerPriceRangeData(ApiResponse.loading());
//     setInfluencerVideoTypeData(ApiResponse.loading());

//     try {
//       // Fetch both responses
//       final priceRangeResponse = await _influencerSelectionRepo
//           .fetchAddPriceRangeResponse(priceRangeData);
//       final videoTypeResponse = await _influencerSelectionRepo
//           .fetchAddVideoTypeResponse(videoTypeData);

//       // Handle successful responses
//       setInfluencerPriceRangeData(ApiResponse.completed(priceRangeResponse));
//       setInfluencerVideoTypeData(ApiResponse.completed(videoTypeResponse));

//       // Call the provided function
//       func.call();

//       // Show success messages
//       Utils.snackBar("Video Type and Price Range Added Successfully!", context);
//     } catch (error) {
//       // Handle errors
//       setpriceTypeLoading(false);
//       Utils.snackBar(error.toString(), context);
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     } finally {
//       // Ensure loading state is set to false after completing the requests
//       setpriceTypeLoading(false);
//     }
//   }

  ApiResponse<UploadImageDataModel> _uploadImageResponse =
      ApiResponse.loading();
  ApiResponse<UploadImageDataModel> get uploadImageResponse =>
      _uploadImageResponse;

  setUploadImageResponse(ApiResponse<UploadImageDataModel> response) {
    _uploadImageResponse = response;
    _uploadImageResponse.toString();
    notifyListeners();
  }

// Future<void> fetchSignupData(
//   BuildContext context, {
//   required String name,
//   required String username,
//   required String email,
//   required String password,
//   required String base64Image,
// }) async {
//   if (_validateFields(context, name, username, email, password, base64Image)) {
//     // Return early if validation fails

//     Map<String, dynamic> registrationData = {
//       'name': name,
//       'username': username,
//       'email': email,
//       'password': password,
//       'role_id': '2',
//     };

//     setLoading(true);
//     setSignupData(ApiResponse.loading());

//     // Perform the signup API call
//     final signupResponse = await _signupRepo.fetchGenericSignupResponse(registrationData);

//     // Check the result of the signup response
//     if (signupResponse.result is Map<String, dynamic>) {
//       String verificationCode = signupResponse.result['code'].toString();
//       String token = signupResponse.result['token'].toString();
//       print(token);
//       await LocalData.setToken(token);

//       // Proceed to upload the image
//       await _uploadImage(base64Image);

//       // Check if image upload was successful
//       if (uploadImageResponse.status == ApiResponse.completed) {
//         navigate(context, OtpScren(code: verificationCode, token: token));
//       } else {
//         // Show error message for image upload failure
//         Utils.snackBar(uploadImageResponse.message.toString(), context);
//       }
//     } else {
//       setLoading(false);
//       // Handle unexpected result structure
//       Utils.snackBar("Please try again", context);
//     }

//     setLoading(false);
//     Utils.snackBar(signupResponse.message.toString(), context);

//     if (kDebugMode) {
//       print(signupResponse.toString());
//     }
//   }
// }

  Future<bool> _uploadImage(String base64Image) async {
  Map<String, dynamic> imageData = {
    'image': base64Image.toString(),
  };

  try {
    setUploadImageResponse(ApiResponse.loading());
    final value = await _signupRepo.fetchUploadImageResponse(imageData);
    setUploadImageResponse(ApiResponse.completed(value));
    print(value);
    return true;
  } catch (error) {
    setUploadImageResponse(ApiResponse.error(error.toString()));
    return false;
  }
}


Future<void> fetchSignupData(
  BuildContext context, {
  required String name,
  required String username,
  required String email,
  required String password,
  required String base64Image,
}) async {
  if (_validateFields(context, name, username, email, password, base64Image)) {
    
    Map<String, dynamic> registrationData = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'role_id': '2',
    };

    setLoading(true);
    setSignupData(ApiResponse.loading());

    _signupRepo.fetchGenericSignupResponse(registrationData).then((value) async {
      setSignupData(ApiResponse.completed(value));

      // Check if response result is a Map and access data properly
      if (value.result is Map<String, dynamic>) {
        String verificationCode = value.result['code'].toString();
        String token = value.result['token'].toString();
        print(token);

        await LocalData.setToken(token);

        // Await the result of _uploadImage and navigate based on its success
        bool imageUploadSuccess = await _uploadImage(base64Image);

        if (imageUploadSuccess) {
          navigate(context, OtpScren(code: verificationCode, token: token));
        } else {
          Utils.snackBar(uploadImageResponse.message.toString(), context);
        }
      } 

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

  // ApiResponse<UploadImageDataModel> _uploadImageResponse = ApiResponse.loading();
  // ApiResponse<UploadImageDataModel> get uploadImageResponse =>
  //     _uploadImageResponse;

  // setUploadImageResponse(ApiResponse<UploadImageDataModel> response) {
  //   _uploadImageResponse = response;
  //   _uploadImageResponse.toString();
  //   notifyListeners();
  // }

  // Future<void> fetchUploadImageResponse(String base64Image) async {
  //     Map<String, dynamic> imageData = {
  //       'image': base64Image.toString(),
  //     };
  //   setUploadImageResponse(ApiResponse.loading());
  //   _signupRepo.fetchUploadImageResponse(imageData).then((value) {
  //     setUploadImageResponse(ApiResponse.completed(value));
  //     print(value);
  //   }).onError((error, stackTrace) {
  //     setUploadImageResponse(ApiResponse.error(error.toString()));
  //   });
  // }

  bool _validateFields(BuildContext context, String name, String username,
      String email, String password, String base64Image) {
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

  // Future<void> fetchCreateUserReponse(
  //     BuildContext context, dynamic data) async {
  //   setLoading(true);
  //   _signupRepo.fetchGenericSignupResponse(data).then((value) async {
  //     print(value);
  //     setLoading(false);

  //     Utils.snackBar(value.message.toString(), context);

  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     Utils.snackBar(error.toString(), context);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }
}
