// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vidbuy_app/Function/navigate.dart';
// import 'package:vidbuy_app/view/feedback_screen.dart';
// import 'package:vidbuy_app/view/order_cancel_screen.dart';

// class VideoScreen extends StatefulWidget {
//   String status;
//   VideoScreen({required this.status ,super.key});

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  widget.status == "" ?

//     Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 15.h,
//             ),
//             Image.asset(
//               "assets/Vector/boy.png",
//               width: 305.w,
//               height: 400.h,
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Container(
//               width: 280.w,
//               height: 50.h,
//               child: ElevatedButton(
//                 onPressed: () {
//                   navigate(context, FeedbackScreen());
//                  // }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xff5271FF),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Accepet",
//                   style: TextStyle(
//                       fontSize: 16.h,
//                       color: Colors.white,
//                       fontFamily: "Lato",
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 8.h,
//             ),
//             Center(
//               child: Container(
//                 width: 280.w,
//                 height: 50.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30.r),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Something is not right",
//                     style: TextStyle(
//                         fontSize: 16.h,
//                         color: Colors.black,
//                         fontFamily: "Lato",
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/influencer_order_tabbar.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String status;
  final String videoTypeId;
  final String? videoUrl;

  const VideoScreen(
      {Key? key,
      required this.status,
      required this.videoTypeId,
      this.videoUrl})
      : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;

  Future<void>? _initializeVideoFuture;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
      _initializePlayer();
    }
  }

  void _initializePlayer() {
    // Using networkUrl instead of network (deprecated)
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));

    _initializeVideoFuture = _controller!.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: true,
        looping: true,
        showControls: true,
        showControlsOnInitialize: false,
      );
      setState(() {}); // Refresh the UI once the video is initialized
    }).catchError((error) {
      // Handle error if initialization fails
      print("Error initializing video: $error");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InfluencerTaskDetailViewModel>(context);

    if (widget.status == "not assigned") {
      return _buildNotSelectedUI();
    } else if (widget.status == "Pending") {
      return _buildPendingUI(viewModel);
    } else if (widget.status == "waiting video") {
      return _buildWaitingVideoUI();
    } else if (widget.status == "Completed") {
      return _buildWaitingVideoUI();
    } else {
      return Center(child: Text("Unknown status"));
    }
  }

  Widget _buildNotSelectedUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Logo/logo.png',
            height: 177.h,
            width: 128.w,
          ),
          SizedBox(height: 16),
          Text(
            "Your video will appear here",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Widget _buildPendingUI() {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Image.asset(
  //           'assets/Logo/logo.png',
  //           height: 177.h,
  //           width: 128.w,
  //         ),
  //         SizedBox(height: 16),
  //         Text(
  //           "Start working so you can upload video",
  //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPendingUI(InfluencerTaskDetailViewModel viewModel) {
    if (viewModel.isVideoUploaded && viewModel.videoPath != null) {
      _controller = VideoPlayerController.file(
        File(viewModel.videoPath!),
      );

      _chewieController = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: true,
        looping: true,
        showControls: true, // Show controls like play/pause, seek bar, etc.
        showControlsOnInitialize: false, // Controls are hidden initially
      );

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 305.w,
              height: 400.h,
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.uploadVideo();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Change Video",
                    style: TextStyle(
                      fontSize: 16.h,
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 280.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: viewModel.loading
                    ? null // Disable button if loading
                    : () {
                        // viewModel.uploadData(context, widget.videoTypeId,
                        //     File(viewModel.videoPath!));

                        Utils.snackBar("Video Uploaded Successfully", context);
                        navigate(context, InfluencerOrderTabbar());
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: viewModel.loading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        "Upload",
                        style: TextStyle(
                          fontSize: 16.h,
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Logo/logo.png',
            height: 177.h,
            width: 128.w,
          ),
          SizedBox(height: 16),
          const Text(
            "Your Uploaded Video will appear here",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SizedBox(
              width: 280.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  viewModel.uploadVideo();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Upload Video",
                  style: TextStyle(
                    fontSize: 16.h,
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildWaitingVideoUI() {
    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      return Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return FutureBuilder(
      future: _initializeVideoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Debugging error message
          return Center(
            child: Text("Failed to load video. Error: ${snapshot.error}"),
          );
        } else {
          return Center(
            child: SizedBox(
              width: 305.h, // Adjust width as needed
              height: 400.w, // Adjust height as needed
              child: Chewie(controller: _chewieController!),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}

// class VideoPlayerWidget extends StatefulWidget {
//   final VideoPlayerController controller;

//   const VideoPlayerWidget({Key? key, required this.controller}) : super(key: key);

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   bool _isPlaying = false;
//   bool _isIconVisible = true;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer(Duration(seconds: 5), () {}); // Initialize the timer
//     widget.controller.addListener(_videoPlayerListener);
//   }

//   @override
//   void dispose() {
//     widget.controller.removeListener(_videoPlayerListener);
//     _timer.cancel();  // Cancel the timer when the widget is disposed
//     super.dispose();
//   }

//   // Listen to the video player state to detect play/pause
//   void _videoPlayerListener() {
//     if (widget.controller.value.isPlaying != _isPlaying) {
//       setState(() {
//         _isPlaying = widget.controller.value.isPlaying;
//         if (_isPlaying) {
//           // Hide the play/pause icon after 5 seconds of playing
//           _startHideIconTimer();
//         } else {
//           // Keep the icon visible if the video is paused
//           _isIconVisible = true;
//         }
//       });
//     }
//   }

//   // Timer to hide the play/pause icon after 5 seconds of video playing
//   void _startHideIconTimer() {
//     if (_timer.isActive) _timer.cancel();
//     _timer = Timer(Duration(seconds: 5), () {
//       setState(() {
//         _isIconVisible = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Video player
//         SizedBox(
//           width: 305.w,
//           height: 400.h,
//           child: VideoPlayer(widget.controller),
//         ),
//         // Play/Pause icon, centered (Optional, if required)
//         if (_isIconVisible)
//           IconButton(
//             icon: Icon(
//               _isPlaying ? Icons.pause : Icons.play_arrow,
//               size: 50,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               setState(() {
//                 if (_isPlaying) {
//                   widget.controller.pause();
//                 } else {
//                   widget.controller.play();
//                 }
//               });
//             },
//           ),
//       ],
//     );
//   }
// }
