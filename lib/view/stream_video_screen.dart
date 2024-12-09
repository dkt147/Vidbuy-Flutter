import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/influencer_detail_view_model.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StreamVideoScreen extends StatefulWidget {
  final dynamic videoSource;
  final int influencerId;
  final int reportVideoId;

  StreamVideoScreen(
      {super.key,
      required this.videoSource,
      required this.reportVideoId,
      required this.influencerId});

  @override
  _StreamVideoScreenState createState() => _StreamVideoScreenState();
}

class _StreamVideoScreenState extends State<StreamVideoScreen> {
  late VideoPlayerController _controller;
  bool _isLiked = false;
  double _currentPosition = 0.0;
  double _totalDuration = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  bool get isFileSource => widget.videoSource is File;

  void _initializeVideoPlayer() {
    if (isFileSource) {
      _controller = VideoPlayerController.file(widget.videoSource as File);
    } else {
      _controller = VideoPlayerController.network(widget.videoSource as String);
    }

    _controller.initialize().then((_) {
      setState(() {});
      _controller.setLooping(false);
      _controller.play(); // Optional: start playing immediately

      // Start listening to the controller's position updates
      _controller.addListener(() {
        setState(() {
          _currentPosition =
              _controller.value.position.inMilliseconds.toDouble();
          _totalDuration = _controller.value.duration.inMilliseconds.toDouble();
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _shareVideo() async {
    if (isFileSource) {
      final file = widget.videoSource as File;
      final xFile = XFile(file.path);
      await Share.shareXFiles([xFile], text: 'Check out this video!');
    } else {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/temp_video.mp4';
      final response = await http.get(Uri.parse(widget.videoSource as String));
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      final xFile = XFile(filePath);
      await Share.shareXFiles([xFile], text: 'Check out this video!');
    }
  }

  Future<void> _downloadVideo() async {
    if (!isFileSource) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/downloaded_video.mp4';
      final file = File(filePath);

      final response = await http.get(Uri.parse(widget.videoSource as String));
      await file.writeAsBytes(response.bodyBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Video downloaded to $filePath')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File is already downloaded locally')),
      );
    }
  }

  void _seekToPosition(double value) {
    final position = Duration(milliseconds: value.toInt());
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InfluencerDetailViewModel>(context);
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen video player
          if (_controller.value.isInitialized)
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),

          Positioned(
            top: 60.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Pop the page
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),

          // **New Dialog Icon**
          Positioned(
            top: 60.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                _showDialog(context, viewModel, widget.reportVideoId,
                    widget.influencerId); // Open dialog
              },
              child: Icon(
                Icons.info, // Example icon; you can replace it
                color: Colors.white,
                size: 30,
              ),
            ),
          ),

          // Overlayed icons on the right side of the screen
          Positioned(
            right: 0.w,
            bottom: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 100.w, // Diameter of the circle
                  height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 3.0, // Border width
                    ),
                    color: Colors.transparent, // Transparent background
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.share, color: Colors.white),
                    onPressed: _shareVideo,
                  ),
                ),
                Content(
                  data: AppLocalizations.of(context)!.userShare,
                  size: 15.h,
                  weight: FontWeight.w300,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Container(
                  width: 100.w, // Diameter of the circle
                  height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 3.0, // Border width
                    ),
                    color: Colors.transparent, // Transparent background
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.download, color: Colors.white),
                    onPressed: _downloadVideo,
                  ),
                ),
                Content(
                  data: AppLocalizations.of(context)!.userDownload,
                  size: 15.h,
                  weight: FontWeight.w300,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 28.r,
                  backgroundImage: NetworkImage(LocalData.image),
                ),
              ],
            ),
          ),

          // Play/pause button in the center of the screen
          Positioned.fill(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 64,
                ),
              ),
            ),
          ),

          // Seek bar at the bottom of the screen
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Slider(
                value: _currentPosition,
                min: 0.0,
                max: _totalDuration,
                onChanged: _seekToPosition,
                activeColor: Colors.white,
                inactiveColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showDialog(
    BuildContext context,
    InfluencerDetailViewModel influencerDetailViewModel,
    int reportedVideoId,
    int influencerId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xff201E23),
        title: Text(
          AppLocalizations.of(context)!.userReportThisVideo,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        content: Text(
          AppLocalizations.of(context)!.userLetUsKnow,
          style: TextStyle(
            fontSize: 14.h,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.userCancel,
                    style: TextStyle(
                        fontSize: 14.h,
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: ElevatedButton(
                  onPressed: () {
                    influencerDetailViewModel.fetchReportInfluencerVideo(
                        context,
                        reportedVideoId: reportedVideoId,
                        influencerId: influencerId, func: () {
                      Navigator.of(context).pop();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.userReport,
                    style: TextStyle(
                      fontSize: 14.h,
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
