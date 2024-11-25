import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/generic_signup_data_model/generic_signup_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:vidbuy_app/model/upload_image_data_model/upload_image_data_model.dart';
import 'package:vidbuy_app/repo/signup_repo.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/otp_scren.dart';
import 'package:video_player/video_player.dart';

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

  File? _introVideo;
  File? get introVideo => _introVideo;

  String? _introVideoBase64;
  String? get introVideoBase64 => _introVideoBase64;
  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? get videoPlayerController => _videoPlayerController;

  // Function to pick a video (only .mp4, .mov, .avi)
  Future<void> pickIntroVideo() async {
    // Existing code to pick the video file
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

      if (video != null) {
        final file = File(video.path);
        final extension = file.path.split('.').last.toLowerCase();

        if (['mp4', 'mov', 'avi'].contains(extension)) {
          _introVideo = file;
          _videoPlayerController = VideoPlayerController.file(_introVideo!)
            ..initialize().then((_) {
              notifyListeners();
            });
        } else {
          print(
              'Unsupported video format. Please select an mp4, mov, or avi file.');
        }
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }

  ApiResponse<UploadImageDataModel> _uploadImageResponse =
      ApiResponse.loading();
  ApiResponse<UploadImageDataModel> get uploadImageResponse =>
      _uploadImageResponse;

  setUploadImageResponse(ApiResponse<UploadImageDataModel> response) {
    _uploadImageResponse = response;
    _uploadImageResponse.toString();
    notifyListeners();
  }

  ApiResponse<UploadImageDataModel> _uploadVideoResponse =
      ApiResponse.loading();
  ApiResponse<UploadImageDataModel> get uploadVideoResponse =>
      _uploadVideoResponse;

  setUploadVideoResponse(ApiResponse<UploadImageDataModel> response) {
    _uploadVideoResponse = response;
    _uploadVideoResponse.toString();
    notifyListeners();
  }

  //  bool _loading = false;
  // bool get loading => _loading;

  // setLoading(bool value) {
  //   _loading = value;
  //   print(_loading);
  //   notifyListeners();
  // }
  Future<void> fetchInfluencerSignupData(
    BuildContext context, {
    required String name,
    required String username,
    required String email,
    required String password,
    required String country,
    required String base64Image,
    required File introVideo,
  }) async {
    if (_validateFields(
        context, name, username, email, password, base64Image, introVideo)) {
      Map<String, dynamic> registrationData = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'country_id': '5',
        'role_id': '3',
      };

      try {
        setLoading(true);
        setInfluencerSignupData(ApiResponse.loading());

        // Step 1: Signup API Call
        final signupResponse =
            await _signupRepo.fetchGenericSignupResponse(registrationData);
        setInfluencerSignupData(ApiResponse.completed(signupResponse));

        if (signupResponse.result is! Map<String, dynamic>) {
          Utils.snackBar(
              "Unexpected response structure during signup.", context);
          return;
        }

        String verificationCode = signupResponse.result['code'].toString();
        String token = signupResponse.result['token'].toString();
        await LocalData.setToken(token);

        // Step 2: Image Upload API Call
        bool imageUploadSuccess = await _uploadImage(base64Image);
        if (!imageUploadSuccess) {
          Utils.snackBar("Image upload failed.", context);
          return;
        }

        // Step 3: Video Upload API Call
        bool videoUploadSuccess = await _uploadIntroVideo(context, introVideo);
        if (!videoUploadSuccess) {
          Utils.snackBar("Video upload failed.", context);
          return;
        }

        // If all steps succeed, navigate to OTP screen
        Utils.snackBar("Influencer created successfully!", context);
        navigate(context, OtpScren(code: verificationCode, token: token));
      } catch (error) {
        Utils.snackBar(error.toString(), context);
      } finally {
        setLoading(false);
      }
    }
  }

  Future<bool> _uploadIntroVideo(BuildContext context, File videoFile) async {
    final uri = Uri.parse(
        "http://influenzers.waapsdeveloper.co/api/upload-intro-video");
    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer ${LocalData.token}'
      ..files.add(await http.MultipartFile.fromPath('video', videoFile.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        if (jsonResponse['bool'] == true) {
          return true; // Video upload successful
        } else {
          print("Video upload failed: ${jsonResponse['message']}");
        }
      } else {
        print("Failed to upload video: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception caught during video upload: $e");
    }
    return false; // Default to failure
  }

  Future<bool> _uploadImage(String base64Image) async {
    Map<String, dynamic> imageData = {
      'image': base64Image.toString(),
    };

    try {
      setUploadImageResponse(ApiResponse.loading());
      final value = await _signupRepo.fetchUploadImageResponse(imageData);
      setUploadImageResponse(ApiResponse.completed(value));
      // await LocalData.setImage(value.result!.image.toString());
      print(value);
      return true;
    } catch (error) {
      setUploadImageResponse(ApiResponse.error(error.toString()));
      return false;
    }
  }

  // Future<void> fetchInfluencerSignupData(BuildContext context,
  //     {required String name,
  //     required String username,
  //     required String email,
  //     required String password,
  //     required String country,
  //     required String base64Image,
  //     required File introVideo}) async {
  //   if (_validateFields(
  //       context, name, username, email, password, base64Image, introVideo)) {
  //     // Return early if validation fails

  //     Map<String, dynamic> registrationData = {
  //       'name': name,
  //       'username': username,
  //       'email': email,
  //       'password': password,
  //       'country_id': '5',
  //       // 'profile_image': base64Image,
  //       'role_id': '3',
  //     };

  //     setLoading(true);
  //     setInfluencerSignupData(ApiResponse.loading());
  //     _signupRepo
  //         .fetchGenericSignupResponse(registrationData)
  //         .then((value) async {
  //       setInfluencerSignupData(ApiResponse.completed(value));

  //       // Check if value.result is a Map and access code properly
  //       if (value.result is Map<String, dynamic>) {
  //         String verificationCode = value.result['code'].toString();
  //         String token = value.result['token'].toString();
  //         print(token);
  //         await LocalData.setToken(token);

  //         bool imageUploadSuccess = await _uploadImage(base64Image);

  //         if (imageUploadSuccess) {
  //           navigate(context, OtpScren(code: verificationCode, token: token));
  //         } else {
  //           Utils.snackBar(uploadImageResponse.message.toString(), context);
  //         }
  //       }
  //       // else {
  //       //   // Handle unexpected result structure
  //       //   Utils.snackBar("Unexpected response structure.", context);
  //       // }

  //       setLoading(false);
  //       Utils.snackBar(value.message.toString(), context);

  //       if (kDebugMode) {
  //         print(value.toString());
  //       }
  //     }).onError((error, stackTrace) {
  //       setLoading(false);
  //       Utils.snackBar(error.toString(), context);
  //       if (kDebugMode) {
  //         print(error.toString());
  //       }
  //     });
  //   }
  // }

  // ApiResponse<CountryListDataModel> _countryList = ApiResponse.loading();
  // ApiResponse<CountryListDataModel> get countryList => _countryList;

  // setCountryList(ApiResponse<CountryListDataModel> response) {
  //   _countryList = response;
  //   _countryList.toString();
  //   notifyListeners();
  // }

  // Future<void> fetchCountryList() async {
  //   setCountryList(ApiResponse.loading());
  //   _signupRepo.fetchCountryList().then((value) {
  //     setCountryList(ApiResponse.completed(value));
  //     print("country list fetched");
  //   }).onError((error, stackTrace) {
  //     setCountryList(ApiResponse.error(error.toString()));
  //   });
  // }

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
      String email, String password, String base64Image, File introVideo) {
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
    if (password.isEmpty || password.length < 8) {
      Utils.snackBar('Password must be at least 8 characters long', context);
      return false;
    }
    if (base64Image == "null") {
      Utils.snackBar('Please select a profile image', context);
      return false;
    }
    if (introVideo == null) {
      Utils.snackBar('Please select a intro video', context);
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
