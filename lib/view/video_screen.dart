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
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String videoTypeId;

  const VideoScreen({
    Key? key,
    required this.videoTypeId,
  }) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  InfluencerTaskDetailViewModel influencerTaskDetailViewModel =
      InfluencerTaskDetailViewModel();

  @override
  void initState() {
    super.initState();
    influencerTaskDetailViewModel.fetchOrderData(widget.videoTypeId);
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<InfluencerTaskDetailViewModel>(context);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => influencerTaskDetailViewModel,
        child: Consumer<InfluencerTaskDetailViewModel>(
            builder: (context, value, child) {
          switch (value.userOrderData.status) {
            case Status.INIT:
              return Container();
            case Status.LOADING:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            case Status.ERROR:
              return Center(
                child: Content(
                    data: value.userOrderData.message.toString(), size: 18),
              );
            case Status.COMPLETED:
              // var data = value.userOrderData.data!.data!.first;
              return Column(
                children: [
                  if (value.userOrderData.data!.result!.first.status ==
                      "Order Created")
                    _buildNotSelectedUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Pending")
                    _buildPendingUI(value, widget.videoTypeId)
                  else if (value.userOrderData.data!.result!.first.status ==
                      "video sent")
                    VideoPlayerWidget(
                      videoUrl: value.userOrderData.data!.result!.first
                          .influencerRequestVideos!.first.videoUrl
                          .toString(),
                    )
                  // _buildWaitingVideoUI(
                  //     influencerTaskDetailViewModel,
                  //     value.userOrderData.data!.result!.first.influencerRequestVideos!.first.videoUrl
                  //         .toString(),
                  //     value.userOrderData.data!.result!.first
                  //         .influencerRequestVideos!.first.id
                  //         .toString(),
                  //     value.userOrderData.data!.result!.first.influencer!.id
                  //         .toString())
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Completed")
                    VideoPlayerWidget(
                        videoUrl: value.userOrderData.data!.result!.first
                            .influencerRequestVideos!.first.videoUrl
                            .toString())
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Rejected by user")
                    VideoPlayerWidget(
                        videoUrl: value.userOrderData.data!.result!.first
                            .influencerRequestVideos!.first.videoUrl
                            .toString()
                        // .influencerRequestVideos!.first.videoUrl
                        // .toString()
                        )
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Rejected by influencer")
                    _buildRejectedByInfluencerUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Accepted by influencer")
                    _buildPendingUI(value, widget.videoTypeId)
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Ask new video")
                    _buildAskNewVideoUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "waiting video")
                    VideoPlayerWidget(
                        videoUrl: value.userOrderData.data!.result!.first
                            .influencerRequestVideos!.first.videoUrl
                            .toString())
                  // _buildWaitingVideoUI(
                  //     userTaskDetailViewModel,
                  //     value.userOrderData.data!.result!.first.influencerRequestVideos!.first.videoUrl.toString(),
                  //     value.userOrderData.data!.result!.first.influencerRequestVideos!.first.id.toString(),
                  //     value.userOrderData.data!.result!.first.influencer!.id.toString())
                  else
                    const Center(child: Text("Unknown status")),
                ],
              );
            case null:
          }
          return Container();
        }),
      ),
    );
    // if (widget.status == "Order Created") {
    //   return _buildNotSelectedUI();
    // } else if (widget.status == "Accepted by influencer") {
    //   return _buildPendingUI(viewModel);
    // } else if (widget.status == "video sent") {
    //   return _buildWaitingVideoUI();
    // } else if (widget.status == "Completed") {
    //   return _buildWaitingVideoUI();
    // } else if (widget.status == "Rejected by influencer") {
    //   return _buildRejectedByInfluencerUI();
    // } else if (widget.status == "Rejected by user") {
    //   return _buildRejectedByUserUI();
    // } else if (widget.status == "Ask new video") {
    //   return _buildAskNewVideoUI();
    // } else {
    //   return Center(child: Text("Unknown status"));
    // }
  }

  Widget _buildNotSelectedUI() {
    return Expanded(
      child: Center(
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
              "You video will appear here",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRejectedByInfluencerUI() {
    return Expanded(
      child: Center(
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
              "You rejected this video request.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRejectedByUserUI() {
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
            "The user rejected this video request.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildAskNewVideoUI() {
    return Expanded(
      child: Center(
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
              "Admin requested to make new video.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
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

  Widget _buildPendingUI(
      InfluencerTaskDetailViewModel viewModel, String videoTypeId) {
    if (viewModel.isVideoUploaded && viewModel.videoPath != null) {
      _controller = VideoPlayerController.file(
        File(viewModel.videoPath!),
      );

      _chewieController = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: true,
        looping: false,
        showControls: true, // Show controls like play/pause, seek bar, etc.
        showControlsOnInitialize: false, // Controls are hidden initially
      );

      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                          viewModel.uploadData(context, widget.videoTypeId,
                              File(viewModel.videoPath!), () {
                            viewModel.fetchOrderData(videoTypeId);
                          });

                          // Utils.snackBar("Video Uploaded Successfully", context);
                          // navigate(context, InfluencerOrderTabbar());
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: viewModel.loading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
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
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: Column(
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
          ),
        ),
      );
    }
  }

  // Widget _buildWaitingVideoUI() {
  //   if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
  //     return Center(
  //       child: Text("Video URL is unavailable"),
  //     );
  //   }

  //   return FutureBuilder(
  //     future: _initializeVideoFuture,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         // Debugging error message
  //         return Center(
  //           child: Text("Failed to load video. Error: ${snapshot.error}"),
  //         );
  //       } else {
  //         return Center(
  //           child: SizedBox(
  //             width: 305.h, // Adjust width as needed
  //             height: 400.w, // Adjust height as needed
  //             // child: Chewie(controller: _chewieController!),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  Future<void>? _initializeVideoFuture;
  String? currentVideoUrl;

  @override
  void initState() {
    super.initState();
    _initializePlayer(widget.videoUrl);
  }

  void _initializePlayer(String videoUrl) {
    if (currentVideoUrl == videoUrl) return; // Prevent re-initialization
    currentVideoUrl = videoUrl;

    _controller?.dispose();
    _chewieController?.dispose();

    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    _initializeVideoFuture = _controller!.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: false,
        looping: false,
        aspectRatio: _controller!.value.aspectRatio,
      );
      setState(() {});
    }).catchError((error) {
      print("Error initializing video: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _initializeVideoFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else {
                  return SizedBox(
                    width: 300.w,
                    height: 400.h,
                    child: Chewie(controller: _chewieController!),
                  );
                }
              },
            ),
          ],
        ),
      ),
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
