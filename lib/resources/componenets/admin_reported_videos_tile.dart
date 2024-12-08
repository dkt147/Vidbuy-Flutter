import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class ReportedVideosTile extends StatefulWidget {
  final String userName;
  final String influencerName;
  final String videoUrl;
  final String reviewCount;
  final String reportedNo;

  ReportedVideosTile(
      {super.key,
      required this.userName,
      required this.influencerName,
      required this.videoUrl,
      required this.reviewCount,
      required this.reportedNo});

  @override
  State<ReportedVideosTile> createState() => _ReportedVideosTileState();
}

class _ReportedVideosTileState extends State<ReportedVideosTile> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _videoPlayerController.pause();
      } else {
        _videoPlayerController.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.black,
          endIndent: 1.w,
          indent: 1.w,
        ),
        Container(
          margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Influencer Details",
                    size: 18.h,
                    weight: FontWeight.bold,
                    family: "Nunito",
                  ),
                  Content(
                    data:
                        "Reported by: ${widget.userName[0].toUpperCase()}${widget.userName.substring(1)}",
                    size: 15.h,
                    weight: FontWeight.w400,
                    family: "Nunito",
                  ),
                  Content(
                    data:
                        "Influencer: ${widget.influencerName[0].toUpperCase()}${widget.influencerName.substring(1)}",
                    size: 15.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                  Content(
                    data: "Review Count: ${widget.reviewCount}",
                    size: 15.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                  Content(
                    data: "No Reported: ${widget.reportedNo}",
                    size: 15.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                ],
              ),
              // Replace Approve container with video player
              Container(
                width: 150.w,
                height: 100.h,
                color: Colors.black, // Background for the video area
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _videoPlayerController.value.isInitialized
                        ?
                        // AspectRatio(
                        //     aspectRatio: _videoPlayerController.value.aspectRatio,
                        //     child:
                        VideoPlayer(_videoPlayerController)
                        // )
                        : Center(child: CircularProgressIndicator()),
                    if (_videoPlayerController.value.isInitialized)
                      GestureDetector(
                        onTap: _togglePlayPause,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Divider(
          color: Colors.black,
          endIndent: 1.w,
          indent: 1.w,
        ),
      ],
    );
  }
}
