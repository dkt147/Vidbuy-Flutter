import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/view/order_cancel_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';
import 'package:video_player/video_player.dart';

class UserVideoScreen extends StatefulWidget {
  final String status;
  final String videoTypeId;
  final String influencerId;
  final String? videoUrl;

  const UserVideoScreen(
      {Key? key,
      required this.status,
      required this.influencerId,
      required this.videoTypeId,
      this.videoUrl})
      : super(key: key);

  @override
  _UserVideoScreenState createState() => _UserVideoScreenState();
}

class _UserVideoScreenState extends State<UserVideoScreen> {
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
        autoPlay: false,
        looping: false,
        showControls: true,
        fullScreenByDefault: true,
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
    final viewModel = Provider.of<UserTaskDetailViewModel>(context);

    if (widget.status == "Order Created") {
      return _buildNotSelectedUI();
    } else if (widget.status == "Pending") {
      return _buildPendingUI();
    } else if (widget.status == "video sent") {
      return _buildWaitingVideoUI(viewModel);
    } else if (widget.status == "Completed") {
      return _buildCompletedVideoUI();
    } else if (widget.status == "Rejected by user") {
      return _buildRejectedByUserVideoUI();
    } else if (widget.status == "Rejected by influencer") {
      return _buildRejectedByInfluencerUI();
    } else if (widget.status == "Accepted by influencer") {
      return _buildAcceptedByInfluencerUI();
    } else if (widget.status == "Ask new video") {
      return _buildAskNewVideoUI();
    } else {
      return Center(child: Text("Unknown status"));
    }
  }

  Widget _buildAskNewVideoUI() {
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
            "Admin requested to make new video.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
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
            "The influencer hasn't accepted your project yet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingUI() {
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
            "The influencer hasn't uploaded any video yet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptedByInfluencerUI() {
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
            "The influencer hasn't uploaded any video yet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildRejectedByInfluencerUI() {
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
            "The influencer has rejected your request",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildWaitingVideoUI(UserTaskDetailViewModel viewModel) {
    if (widget.videoUrl! == null || widget.videoUrl!.isEmpty) {
      return Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return FutureBuilder(
      future: _initializeVideoFuture!,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Debugging error message
          return Center(
            child: Text("Failed to load video. Error: ${snapshot.error}"),
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 60),
                child: Center(
                  child: SizedBox(
                    width: 305.h, // Adjust width as needed
                    height: 400.w, // Adjust height as needed
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 280.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: viewModel.userStatusloading
                        ? null
                        : () {
                            _controller!.pause();
                            viewModel.fetchUploadUserStatusData(context,
                                videoTypeId: widget.videoTypeId.toString(),
                                influencerId: widget.influencerId.toString());
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: viewModel.userStatusloading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            "Accept",
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
                  onPressed: () {
                    _controller!.pause();
                    navigate(
                        context,
                        OrderCancelScreen(
                          videoTypeId: widget.videoTypeId,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Reject",
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
          );
        }
      },
    );
  }

  Widget _buildCompletedVideoUI() {
    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      return Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return FutureBuilder(
      future: _initializeVideoFuture!,
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

  Widget _buildRejectedByUserVideoUI() {
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
