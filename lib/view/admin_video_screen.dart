import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
    final viewModel = Provider.of<AdminRejectedOrdersViewModel>(context);

    if (widget.status == "Completed") {
      return _buildCompletedVideoUI();
    } else if (widget.status == "Rejected by user") {
      return _buildRejectedByUserVideoUI(viewModel);
    } else if (widget.status == "Rejected by influencer") {
      return _buildRejectedByInfluencerUI();
    } else {
      return const Center(child: Text("Unknown status"));
    }
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

  Widget _buildCompletedVideoUI() {
    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      return const Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return FutureBuilder(
      future: _initializeVideoFuture!,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Debugging error message
          return Center(
            child: Text("Failed to load video. Error: ${snapshot.error}"),
          );
        } else {
          return Center(
            child: SizedBox(
              width: 305.h, // Adjust width as needed
              height: 500.w, // Adjust height as needed
              child: Chewie(controller: _chewieController!),
            ),
          );
        }
      },
    );
  }

  Widget _buildRejectedByUserVideoUI(AdminRejectedOrdersViewModel viewModel) {
    if (widget.videoUrl == null || widget.videoUrl!.isEmpty) {
      return const Center(
        child: Text("Video URL is unavailable"),
      );
    }

    return FutureBuilder(
      future: _initializeVideoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Debugging error message
          return Center(
            child: Text("Failed to load video. Error: ${snapshot.error}"),
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: 305.h, // Adjust width as needed
                  height: 500.w, // Adjust height as needed
                  child: Chewie(controller: _chewieController!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<AdminRejectedOrdersViewModel>(
                        builder: (context, viewModel, child) {
                      return SizedBox(
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
                                viewModel.fetchChangeOrderStatus(statusData,
                                    widget.videoTypeId.toString(), context);
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
                            style:
                                TextStyle(fontSize: 16.h, color: Colors.white),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      width: 8.h,
                    ),
                    Consumer<AdminRejectedOrdersViewModel>(
                        builder: (context, viewModel, child) {
                      return SizedBox(
                        width: 156.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Map<String, dynamic> statusData = {
                              'status': "Completed",
                            };
                            viewModel.fetchChangeOrderStatus(
                                statusData, widget.videoTypeId, context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff5271FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            "Complete",
                            style:
                                TextStyle(fontSize: 16.h, color: Colors.white),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
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
