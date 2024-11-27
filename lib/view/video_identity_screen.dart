import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoIdentityScreen extends StatefulWidget {
 final String status;
  final String influencerId;
  final String? videoUrl;

  // ignore: use_super_parameters
  const VideoIdentityScreen(
      {Key? key,
      required this.status,
      required this.influencerId,
      this.videoUrl})
      : super(key: key);
  @override
  State<VideoIdentityScreen> createState() => _VideoIdentityScreenState();
}

class _VideoIdentityScreenState extends State<VideoIdentityScreen> {
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
   print("Video URL in _initializePlayer: ${widget.videoUrl}");
  _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
   _initializeVideoFuture = _controller!.initialize().then((_) {
    print("Video initialized successfully");
    _chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }).catchError((error) {
    print("Error initializing video: $error");
  });
}



  @override
void didUpdateWidget(VideoIdentityScreen oldWidget) {
  super.didUpdateWidget(oldWidget);
  if (widget.videoUrl != oldWidget.videoUrl) {
    _chewieController?.dispose();
    _controller?.dispose();
    if (widget.videoUrl != null && widget.videoUrl!.isNotEmpty) {
      _initializePlayer();
    }
  }
}


  @override
  Widget build(BuildContext context) {
    if (widget.status == "Pending") {
      return _buildPendingVideoUI();
    } else if (widget.status == "Approved" ||
        widget.status == "Cancelled" ||
        widget.status == "Completed") {
      return _buildWaitingVideoUI();
    } else {
      return const Center(child: Text("Unknown status"));
    }
  }

  Widget _buildPendingVideoUI() {
    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      return const Center(
        child: Text("Video URL is unavailable"),
      );
    }

    // Safeguard: If `_initializeVideoFuture` is null, show a loading indicator
  if (_initializeVideoFuture == null) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

    return FutureBuilder(
      future: _initializeVideoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text("Error: ${snapshot.error}"));
    } else if (_chewieController == null) {
      return Center(child: Text("ChewieController is null"));
    } else {
      return Chewie(controller: _chewieController!);
    }
      },
    );
  }

  Widget _buildWaitingVideoUI() {
    // The logic here is the same as _buildPendingVideoUI
    return _buildPendingVideoUI();
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

