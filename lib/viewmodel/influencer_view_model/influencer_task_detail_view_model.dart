import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/data/response/api_response.dart';
import 'package:vidbuy_app/repo/influencer_orders_repo.dart';

class InfluencerTaskDetailViewModel extends ChangeNotifier {
  InfleuncersOrderRepo _infleuncersOrderRepo = InfleuncersOrderRepo();

  bool isVideoUploaded = false;
  String? videoPath;

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

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

//   ApiResponse<ContactUsDataModel> _uploadVideoData = ApiResponse.loading();
//   ApiResponse<uploadVideoDataModel> get uploadVideoData => _uploadVideoData;

//   void setUploadVideoData(ApiResponse<uploadVideoDataModel> response) {
//     _uploadVideoData = response;
//     notifyListeners();
//   }

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
