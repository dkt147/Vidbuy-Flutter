import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/order_cancel_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserVideoScreen extends StatefulWidget {
  final String videoTypeId;

  const UserVideoScreen({
    Key? key,
    required this.videoTypeId,
  }) : super(key: key);

  @override
  _UserVideoScreenState createState() => _UserVideoScreenState();
}

class _UserVideoScreenState extends State<UserVideoScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;

  Future<void>? _initializeVideoFuture;

  UserTaskDetailViewModel userTaskDetailViewModel = UserTaskDetailViewModel();
  @override
  void initState() {
    super.initState();
    // if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
    //   _initializePlayer();
    // }

    userTaskDetailViewModel.fetchUserOrderData(widget.videoTypeId);
  }

  // void _initializePlayer(String videoUrl) {
  //   // Using networkUrl instead of network (deprecated)
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

  //   _initializeVideoFuture = _controller!.initialize().then((_) {
  //     _chewieController = ChewieController(
  //       videoPlayerController: _controller!,
  //       autoPlay: false,
  //       looping: false,
  //       showControls: true,
  //       fullScreenByDefault: true,
  //       showControlsOnInitialize: false,
  //     );
  //     setState(() {}); // Refresh the UI once the video is initialized
  //   }).catchError((error) {
  //     // Handle error if initialization fails
  //     print("Error initializing video: $error");
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<UserTaskDetailViewModel>(context);
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => userTaskDetailViewModel,
        child:
            Consumer<UserTaskDetailViewModel>(builder: (context, value, child) {
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
                  if (value.userOrderData.data!.result!.first.status == "Order Created")
                    _buildNotSelectedUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Pending")
                    _buildPendingUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "video sent")
                    _buildWaitingVideoUI(
                        userTaskDetailViewModel,
                        value.userOrderData.data!.result!.first.influencerRequestVideos!.first.videoUrl
                            .toString(),
                        value.userOrderData.data!.result!.first
                            .influencerRequestVideos!.first.id
                            .toString(),
                        value.userOrderData.data!.result!.first.influencer!.id
                            .toString())
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
                            .toString())
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Rejected by influencer")
                    Expanded(child: _buildRejectedByInfluencerUI())
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Accepted by influencer")
                    _buildAcceptedByInfluencerUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "Ask new video")
                    _buildAskNewVideoUI()
                  else if (value.userOrderData.data!.result!.first.status ==
                      "waiting video")
                    _buildWaitingVideoUI(
                        userTaskDetailViewModel,
                        value.userOrderData.data!.result!.first.influencerRequestVideos!.first.videoUrl.toString(),
                        value.userOrderData.data!.result!.first.influencerRequestVideos!.first.id.toString(),
                        value.userOrderData.data!.result!.first.influencer!.id.toString())
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
    // } else if (widget.status == "Pending") {
    //   return _buildPendingUI();
    // } else if (widget.status == "video sent") {
    //   return _buildWaitingVideoUI(viewModel);
    // } else if (widget.status == "Completed") {
    //   return _buildCompletedVideoUI();
    // } else if (widget.status == "Rejected by user") {
    //   return _buildRejectedByUserVideoUI();
    // } else if (widget.status == "Rejected by influencer") {
    //   return _buildRejectedByInfluencerUI();
    // } else if (widget.status == "Accepted by influencer") {
    //   return _buildAcceptedByInfluencerUI();
    // } else if (widget.status == "Ask new video") {
    //   return _buildAskNewVideoUI();
    // } else {
    //   return Center(child: Text("Unknown status"));
    // }
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
              AppLocalizations.of(context)!.userOrderAdminRequested,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotSelectedUI() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo/logo.png',
              height: 177.h,
              width: 128.w,
            ),
            SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.userOrderInfluencerHasntAccepted,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
            AppLocalizations.of(context)!.userOrderInfluencerHasntUploaded,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptedByInfluencerUI() {
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
              AppLocalizations.of(context)!.userOrderInfluencerHasntUploaded,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRejectedByInfluencerUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/Logo/logo.png',
              height: 177.h,
              width: 128.w,
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              AppLocalizations.of(context)!
                  .userOrderInfluencerHasRejectedRequest,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaitingVideoUI(UserTaskDetailViewModel viewModel,
      String videoUrl, String videoId, String influencerId) {
    if (videoUrl.isEmpty) {
      return Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoPlayerWithButton(
            videoUrl: videoUrl,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: 280.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: viewModel.userStatusloading
                    ? null
                    : () {
                        viewModel.fetchUploadUserStatusData(context,
                            videoTypeId: videoId.toString(),
                            influencerId: influencerId.toString(), func: () {
                          userTaskDetailViewModel
                              .fetchUserOrderData(widget.videoTypeId);
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: viewModel.userStatusloading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        AppLocalizations.of(context)!.userAccept,
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
                AppLocalizations.of(context)!.userReject,
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
  }

  // Widget _buildCompletedVideoUI(String videoUrl) {
  //   if (videoUrl.isEmpty) {
  //     return Center(
  //       child: Text("Video URL is unavailable"),
  //     );
  //   }

  //   _initializePlayer(videoUrl);

  //   return FutureBuilder(
  //     future: _initializeVideoFuture!,
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
  //             child: Chewie(controller: _chewieController!),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  // Widget _buildRejectedByUserVideoUI() {
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
  //             child: Chewie(controller: _chewieController!),
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

class VideoPlayerWithButton extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWithButton({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _VideoPlayerWithButtonState createState() => _VideoPlayerWithButtonState();
}

class _VideoPlayerWithButtonState extends State<VideoPlayerWithButton> {
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
    return Center(
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
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
