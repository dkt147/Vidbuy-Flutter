import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/model/influencer_model/update_status_data_model/update_status_data_model.dart';
import 'package:vidbuy_app/model/influencer_model/upload_video_data_model/upload_video_data_model.dart';
import 'package:vidbuy_app/model/user_model/user_activity_history_data_model/user_activity_history_data_model.dart';
import 'package:vidbuy_app/repo/influencer_orders_repo.dart';
import 'package:vidbuy_app/resources/componenets/influencer_order_tabbar.dart';
import 'package:http/http.dart' as http;
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/influencer_navbar_screen.dart';

class InfluencerTaskDetailViewModel extends ChangeNotifier {
  InfleuncersOrderRepo _infleuncersOrderRepo = InfleuncersOrderRepo();

  bool isVideoUploaded = false;
  String? videoPath;

//   final _flutterVideoCompress = FlutterVideoCompress();

// Future<File?> compressVideo(File videoFile) async {
//   final info = await _flutterVideoCompress.compressVideo(
//     videoFile.path,
//     quality: VideoQuality.MediumQuality, // Adjust quality as needed
//     deleteOrigin: false, // If you want to keep the original file
//   );

//   return info?.file;
// }

  // Function to upload video
  Future<void> uploadVideo() async {
    // Open file picker and allow the user to pick a video
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video, // Only allow video file types
    );

    if (result != null) {
      // Get the path of the video
      videoPath = result.files.single.path;

      // Check if the file extension is one of the allowed formats
      String? extension = result.files.single.extension;
      if (extension != null &&
          (extension == "mp4" || extension == "mov" || extension == "avi")) {
        isVideoUploaded = true; // Mark the video as uploaded
      } else {
        // Show an error if the format is not supported
        isVideoUploaded = false;
        videoPath = null;
        // Optionally show an error message
        // You can notify listeners here to show a message
        notifyListeners();
        return;
      }

      notifyListeners(); // Notify listeners to rebuild the UI
    }
  }

  void clearVideo() {
    videoPath = null;
    notifyListeners();
  }

  ApiResponse<UploadVideoDataModel> _uploadVideoData = ApiResponse.loading();
  ApiResponse<UploadVideoDataModel> get uploadVideoData => _uploadVideoData;

  void setUploadVideoData(ApiResponse<UploadVideoDataModel> response) {
    _uploadVideoData = response;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  Future<void> uploadData(
      BuildContext context, String requestVideoId, File videoFile) async {
    Map<String, dynamic> videoData = {
      'request_video_id': requestVideoId,
    };
    final uri = Uri.parse(
        "http://influenzers.waapsdeveloper.co/api/upload-video-request");
    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer ${LocalData.token}'
      ..fields.addAll(
          videoData.map((key, value) => MapEntry(key, value.toString())))
      ..files.add(await http.MultipartFile.fromPath('video', videoFile.path));

    try {
      setLoading(true);
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        // Check if the response contains the boolean key and it's true
        if (jsonResponse['bool'] == true) {
          Utils.snackBar(jsonResponse['message'], context);

          Navigator.pop(context);
          clearVideo();
        } else {
          Utils.snackBar(jsonResponse['message'], context);
        }
      } else {
        print("Failed to upload: ${response.statusCode}");
      }
    } catch (e) {
      Utils.snackBar(e.toString(), context);
      print("Exception caught: $e");
    } finally {
      setLoading(false);
    }
  }

//   Future<void> fetchUploadVideoData(BuildContext context,
//       {required File file,
//       required String requestVideoId,
//       // required VoidCallback func
//       }) async {
//       // Return early if validation fails
//  Map<String, dynamic> videoData = {
//         'request_video_id': requestVideoId,
//       };

//       setLoading(true);
//       setUploadVideoData(ApiResponse.loading());
//       _infleuncersOrderRepo.fetchUploadVideoResponse(file ,videoData).then((value) async {
//         if (value.Isbool!) {
//           setUploadVideoData(ApiResponse.completed(value));
//           Utils.snackBar(value.message.toString(), context);
//           navigatePushReplace(context, InfluencerOrderTabbar());
//           // func.call();
//         } else {
//           Utils.snackBar(value.message.toString(), context);
//         }

//         setLoading(false);
//       }).onError((error, stackTrace) {
//         setLoading(false);
//         Utils.snackBar(error.toString(), context);
//       });

//   }

  bool _influencerStatusloading = false;
  bool get influencerStatusloading => _influencerStatusloading;

  setInfluencerStatusloading(bool value) {
    _influencerStatusloading = value;
    print(_influencerStatusloading);
    notifyListeners();
  }

  ApiResponse<UpdateStatusDataModel> _influencerStatusData =
      ApiResponse.loading();
  ApiResponse<UpdateStatusDataModel> get influencerStatusData =>
      _influencerStatusData;

  void setinfluencerStatusData(ApiResponse<UpdateStatusDataModel> response) {
    _influencerStatusData = response;
    notifyListeners();
  }

  Future<void> fetchUploadStatusData(BuildContext context,
      {required String videoTypeId}) async {
    Map<String, dynamic> uploadStatusData = {
      'status': "Accepted by influencer",
    };

    setLoading(true);
    setinfluencerStatusData(ApiResponse.loading());
    _infleuncersOrderRepo
        .fetchUploadStatusResponse(uploadStatusData, videoTypeId)
        .then((value) async {
      if (value.Isbool!) {
        setinfluencerStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        Navigator.pop(context);
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  bool _influencerRejectStatusloading = false;
  bool get influencerRejectStatusloading => _influencerRejectStatusloading;

  setInfluencerRejectStatusloading(bool value) {
    _influencerRejectStatusloading = value;
    print(_influencerRejectStatusloading);
    notifyListeners();
  }

  Future<void> fetchRejectStatusData(
    BuildContext context, {
    required String videoTypeId,
    required String reason,
  }) async {
    Map<String, dynamic> uploadStatusData = {
      'status': "Rejected by influencer",
      "reason": reason
    };

    setInfluencerRejectStatusloading(true);
    setinfluencerStatusData(ApiResponse.loading());
    _infleuncersOrderRepo
        .fetchUploadStatusResponse(uploadStatusData, videoTypeId)
        .then((value) async {
      if (value.Isbool!) {
        setinfluencerStatusData(ApiResponse.completed(value));
        Utils.snackBar(value.message.toString(), context);
        Navigator.pop(context);
        navigatePushReplace(context, InfluencerNavbarScreen());
      } else {
        Utils.snackBar(value.message.toString(), context);
      }
      setInfluencerRejectStatusloading(false);
    }).onError((error, stackTrace) {
      setInfluencerRejectStatusloading(false);
      Utils.snackBar(error.toString(), context);
    });
  }

  ApiResponse<UserActivityHistoryDataModel> _influencerActiveHistoryData =
      ApiResponse.loading();
  ApiResponse<UserActivityHistoryDataModel> get influencerActiveHistoryData =>
      _influencerActiveHistoryData;

  setInfluencerActiveHistoryData(
      ApiResponse<UserActivityHistoryDataModel> response) {
    _influencerActiveHistoryData = response;
    _influencerActiveHistoryData.toString();
    notifyListeners();
  }

  Future<void> fetchInfluencerActiveHistoryData(String videoTypeId) async {
    setInfluencerActiveHistoryData(ApiResponse.loading());
    _infleuncersOrderRepo
        .fetchInfluencerActiveHistoryData(videoTypeId)
        .then((value) {
      setInfluencerActiveHistoryData(ApiResponse.completed(value));
      print(value);
    }).onError((error, stackTrace) {
      setInfluencerActiveHistoryData(ApiResponse.error(error.toString()));
    });
  }

//   ApiResponse<ContactUsDataModel> _influencerActivityHistoryData = ApiResponse.loading();
//   ApiResponse<uploadVideoDataModel> get uploadVideoData => _influencerActivityHistoryData;

//   void setInfluencerActiveHistory(ApiResponse<uploadVideoDataModel> response) {
//     _influencerActivityHistoryData = response;
//     notifyListeners();
//   }

//  bool _influencerActiveHistoryLoading = false;
//   bool get influencerActiveHistoryLoading =>
//       _influencerActiveHistoryLoading;

//   setInfluencerActiveHistoryLoading(bool value) {
//     _influencerActiveHistoryLoading = value;
//     print(_influencerActiveHistoryLoading);
//     notifyListeners();
//   }

//   Future<void> fetchInfluencerActiveHistory() async {
//     setInfluencerActiveHistoryLoading(true);
//     setInfluencerActiveHistory(ApiResponse.loading());
//     _influencersOrderRepo.fetchInfluencerActiveHistory().then((value) {
//       setInfluencerActiveHistory(ApiResponse.completed(value));
//       setInfluencerActiveHistoryLoading(false);
//       print(value);
//     }).onError((error, stackTrace) {
//       setInfluencerActiveHistory(ApiResponse.error(error.toString()));
//     });
//   }
}
