import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/admin_view_model/admin_influencer_list_view_model.dart';
import 'package:video_player/video_player.dart';

class VideoIdentityScreen extends StatefulWidget {
  final String influencerId;

  // ignore: use_super_parameters
  const VideoIdentityScreen({Key? key, required this.influencerId})
      : super(key: key);
  @override
  State<VideoIdentityScreen> createState() => _VideoIdentityScreenState();
}

class _VideoIdentityScreenState extends State<VideoIdentityScreen> {
  AdminInfluencersViewModel adminInfluencersViewModel =
      AdminInfluencersViewModel();

  @override
  void initState() {
    super.initState();
    // if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
    //   _initializePlayer();
    // }
    adminInfluencersViewModel.fetchInfluencerData(widget.influencerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => adminInfluencersViewModel,
        child: Consumer<AdminInfluencersViewModel>(
            builder: (context, value, child) {
          switch (value.influencerHistoryData.status) {
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
                    data: value.influencerHistoryData.message.toString(),
                    size: 18),
              );
            case Status.COMPLETED:
              var data = value.influencerHistoryData.data!.result!.data;
              return Column(
                children: [
                  if (data!.status == "Pending")
                    data.faceIdentity == null
                        ? _buildNoVideoUI()
                        : VideoPlayerWidget(
                            videoUrl:
                                // "https://inf-vid-zer-s3.s3.amazonaws.com/http%3A//influenzers.waapsdeveloper.co/FaceIdentity/1732702282-0c73952f-9b79-489b-9c4e-341ce6d421017128372435521229642.mp4?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5MDAR5D3XL6NWM5P%2F20241206%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T104437Z&X-Amz-SignedHeaders=host&X-Amz-Expires=7200&X-Amz-Signature=ab01cc22dfb31e675b4cfffd7c617e7747e604de339c600b3c5dfb7a9895cee4",
                                data.faceIdentity!.video.toString())
                  // if (widget.status == "Pending")
                  //   _buildPendingVideoUI()
                  else if (data.status! == "Approved")
                    data.faceIdentity == null
                        ? _buildNoVideoUI()
                        : VideoPlayerWidget(
                            videoUrl:
                                // "https://inf-vid-zer-s3.s3.amazonaws.com/http%3A//influenzers.waapsdeveloper.co/FaceIdentity/1732702282-0c73952f-9b79-489b-9c4e-341ce6d421017128372435521229642.mp4?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5MDAR5D3XL6NWM5P%2F20241206%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T104437Z&X-Amz-SignedHeaders=host&X-Amz-Expires=7200&X-Amz-Signature=ab01cc22dfb31e675b4cfffd7c617e7747e604de339c600b3c5dfb7a9895cee4",
                                data.faceIdentity!.video.toString())
                  else if (data.status! == "Cancelled")
                    data.faceIdentity == null
                        ? _buildNoVideoUI()
                        : VideoPlayerWidget(
                            videoUrl:
                                // "https://inf-vid-zer-s3.s3.amazonaws.com/http%3A//influenzers.waapsdeveloper.co/FaceIdentity/1732702282-0c73952f-9b79-489b-9c4e-341ce6d421017128372435521229642.mp4?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5MDAR5D3XL6NWM5P%2F20241206%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241206T104437Z&X-Amz-SignedHeaders=host&X-Amz-Expires=7200&X-Amz-Signature=ab01cc22dfb31e675b4cfffd7c617e7747e604de339c600b3c5dfb7a9895cee4",
                                data.faceIdentity!.video.toString())
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
    // if (widget.status == "Pending") {
    //   return _buildPendingVideoUI();
    // } else if (widget.status == "Approved" ||
    //     widget.status == "Cancelled" ||
    //     widget.status == "Completed") {
    //   return _buildWaitingVideoUI();
    // } else {
    //   return const Center(child: Text("Unknown status"));
    // }
  }

  // Widget _buildPendingVideoUI() {
  //   // if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
  //   //   return const Center(
  //   //     child: Text("Video URL is unavailable"),
  //   //   );
  //   // }

  //   // Safeguard: If `_initializeVideoFuture` is null, show a loading indicator
  //   if (_initializeVideoFuture == null) {
  //     return const Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   }

  //   return FutureBuilder(
  //     future: _initializeVideoFuture,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text("Error: ${snapshot.error}"));
  //       } else if (_chewieController == null) {
  //         return const Center(child: CircularProgressIndicator());
  //       } else {
  //         return Center(
  //             child: SizedBox(
  //                 width: 305.w,
  //                 height: 560.h,
  //                 child: Chewie(controller: _chewieController!)));
  //       }
  //     },
  //   );
  // }

  Widget _buildWaitingVideoUI(String videoUrl) {
    // The logic here is the same as _buildPendingVideoUI
    return VideoPlayerWidget(
      videoUrl: videoUrl,
    );
  }

  Widget _buildNoVideoUI() {
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
              "The influencer hasn't Uploaded any video",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
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

// return Scaffold(
//   body: SingleChildScrollView(
//     child: Column(
//       children: [
//         SizedBox(
//           height: 15.h,
//         ),
//         Image.asset(
//           "assets/Vector/boy.png",
//           width: 305.w,
//           height: 560.h,
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 156.w,
//               height: 40.h,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // if (_emailController.text.isEmpty) {
//                   //   snackBar("Enter Valid Email", context);
//                   // } else if (_passwordController.text.isEmpty) {
//                   //   snackBar(
//                   //     "Enter Password",
//                   //     context,
//                   //   );
//                   // } else if (_passwordController.text.length < 8) {
//                   //   snackBar(
//                   //       "Enter Minium 8 Characters of Password", context);
//                   // } else {
//                   //   // Navigator.push(
//                   //   //     context,
//                   //   //     MaterialPageRoute(
//                   //   //         builder: (_) => TabBarWidget()));
//                   // navigate(context, FeedbackScreen());
//                   // }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xff908B8B),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Ask New video",
//                   style: TextStyle(
//                       fontSize: 16.h,
//                       color: Colors.white,
//                       fontFamily: "Lato",
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 8.h,
//             ),
//             Container(
//               width: 156.w,
//               height: 40.h,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // if (_emailController.text.isEmpty) {
//                   //   snackBar("Enter Valid Email", context);
//                   // } else if (_passwordController.text.isEmpty) {
//                   //   snackBar(
//                   //     "Enter Password",
//                   //     context,
//                   //   );
//                   // } else if (_passwordController.text.length < 8) {
//                   //   snackBar(
//                   //       "Enter Minium 8 Characters of Password", context);
//                   // } else {
//                   //   // Navigator.push(
//                   //   //     context,
//                   //   //     MaterialPageRoute(
//                   //   //         builder: (_) => TabBarWidget()));
//                   // navigate(context, OrderCancelScreen());
//                   // }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xff5271FF),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Complete",
//                   style: TextStyle(
//                       fontSize: 16.h,
//                       color: Colors.white,
//                       fontFamily: "Lato",
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// );
// }
