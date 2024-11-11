import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class StreamVideoScreen extends StatefulWidget {
  final dynamic videoSource;

  const StreamVideoScreen({super.key, required this.videoSource});

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
      _controller.setLooping(true);
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

          // Overlayed icons on the right side of the screen
          Positioned(
            right: 16,
            bottom: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : Colors.white,
                  ),
                  onPressed: _toggleLike,
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: const Icon(Icons.download, color: Colors.white),
                  onPressed: _downloadVideo,
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: _shareVideo,
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
