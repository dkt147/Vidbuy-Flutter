import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/date_picker_bottomsheet.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_rejected_orders_view_model.dart';
import 'package:video_player/video_player.dart';

class AdminVideoScreen extends StatefulWidget {
  final String status;
  final String videoTypeId;
  final String influencerId;
  final String? videoUrl;

  const AdminVideoScreen(
      {Key? key,
      required this.status,
      required this.influencerId,
      required this.videoTypeId,
      this.videoUrl})
      : super(key: key);

  @override
  _AdminVideoScreenState createState() => _AdminVideoScreenState();
}

class _AdminVideoScreenState extends State<AdminVideoScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;

  Future<void>? _initializeVideoFuture;

  AdminRejectedOrdersViewModel adminRejectedOrdersViewModel =
      AdminRejectedOrdersViewModel();
  @override
  void initState() {
    super.initState();
    // if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
    //   _initializePlayer();
    // }

    adminRejectedOrdersViewModel.fetchUserOrderData(widget.videoTypeId);
  }

  // void _initializePlayer() {
  //   // Using networkUrl instead of network (deprecated)
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));

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
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => adminRejectedOrdersViewModel,
        child: Consumer<AdminRejectedOrdersViewModel>(
            builder: (context, value, child) {
          switch (value.userOrderData.status) {
            case Status.INIT:
              return Container();
            case Status.LOADING:
              return const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              );
            case Status.ERROR:
              return Center(
                child: Content(
                    data: value.userOrderData.message.toString(), size: 18),
              );
            case Status.COMPLETED:
              var data = value.userOrderData.data!.result!.first;
              return Column(
                children: [
                  if (data.status == "Completed")
                    _buildCompletedVideoUI(
                        data.influencerRequestVideos!.first.videoUrl.toString())
                  else if (data.status == "Rejected by user")
                    _buildRejectedByUserVideoUI(
                        value,
                        data.influencerRequestVideos!.first.videoUrl.toString(),
                        data.influencerRequestVideos!.first.requestVideoId
                            .toString())
                  else if (data.status == "Rejected by influencer")
                    _buildRejectedByInfluencerUI()
                  else if (data.status == "Ask new video")
                    _buildCompletedVideoUI(
                        data.influencerRequestVideos!.first.videoUrl.toString())
                  else
                    const Center(child: Text("Unknown status"))
                ],
              );
            case null:
          }
          return Container();
        }),
      ),
    );

    // if (widget.status == "Completed") {
    //   return _buildCompletedVideoUI();
    // } else if (widget.status == "Rejected by user") {
    //   return _buildRejectedByUserVideoUI(viewModel);
    // } else if (widget.status == "Rejected by influencer") {
    //   return _buildRejectedByInfluencerUI();
    // } else {
    //   return const Center(child: Text("Unknown status"));
    // }
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
          const SizedBox(height: 16),
          const Text(
            "The influencer has rejected the order",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedVideoUI(String videoUrl) {
    if (videoUrl.isEmpty) {
      return const Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return VideoPlayerWidget(videoUrl: videoUrl);
  }

  Widget _buildRejectedByUserVideoUI(AdminRejectedOrdersViewModel viewModel,
      String videoUrl, String requestVideoId) {
    if (videoUrl.isEmpty) {
      return const Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoPlayerWithButton(videoUrl: videoUrl),
          Padding(
              padding: const EdgeInsets.only(top: 70),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 156.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePickerBottomSheet(
                        context,
                        widget.videoTypeId.toString(),
                        (selectedDate) {
                          Map<String, dynamic> statusData = {
                            'status': "Ask new video",
                            'expires_at': selectedDate.toString()
                          };
                          viewModel.fetchChangeOrderStatus(
                              statusData, requestVideoId.toString(), () {
                            viewModel.fetchUserOrderData(widget.videoTypeId);
                          }, context);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff908B8B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      "Ask new video",
                      style: TextStyle(fontSize: 16.h, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.h,
                ),
                SizedBox(
                  width: 156.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> statusData = {
                        'status': "Completed",
                      };
                      viewModel.fetchChangeOrderStatus(
                          statusData, widget.videoTypeId, () {
                        viewModel.fetchUserOrderData(widget.videoTypeId);
                      }, context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      "Complete",
                      style: TextStyle(fontSize: 16.h, color: Colors.white),
                    ),
                  ),
                )
              ]))
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
