import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_selection_view_model.dart';
import 'package:video_player/video_player.dart';

class ProofIdentityScreen extends StatefulWidget {
  ProofIdentityScreen({super.key});

  @override
  State<ProofIdentityScreen> createState() => _ProofIdentityScreenState();
}

class _ProofIdentityScreenState extends State<ProofIdentityScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _recordedVideo;
  VideoPlayerController? _videoController;
  File? selectedVideoFile; // Store selected video as a file
  // final viewModel = YourViewModel(); // Replace with actual ViewModel instance

  Future<void> _recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() {
        _recordedVideo = video;
        selectedVideoFile = File(video.path);
        _videoController = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            setState(() {});
            _videoController!.setLooping(true);
          });
      });
    }
  }

  void _resetVideo() {
    setState(() {
      _recordedVideo = null;
      selectedVideoFile = null;
      _videoController?.dispose();
      _videoController = null;
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<InfluencerSelectionViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Content(
                data: "Proof Of Identity",
                size: 30.h,
                weight: FontWeight.w300,
              ),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: const EdgeInsets.all(11),
                child: Content(
                  data: "We need to make sure no one is impersonating you",
                  size: 16.h,
                  weight: FontWeight.w400,
                  family: "Lato",
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              GestureDetector(
                onTap: _recordVideo,
                child: _recordedVideo == null
                    ? Icon(
                        Icons.videocam_outlined,
                        size: 221.h,
                      )
                    : _videoController != null &&
                            _videoController!.value.isInitialized
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              AspectRatio(
                                aspectRatio:
                                    _videoController!.value.aspectRatio,
                                child: VideoPlayer(_videoController!),
                              ),
                              if (!_videoController!.value.isPlaying)
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _videoController!.play();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.play_circle_outline,
                                    size: 64.h,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              if (_videoController!.value.isPlaying)
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _videoController!.pause();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.pause_circle_outline,
                                    size: 64.h,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                            ],
                          )
                        : CircularProgressIndicator(), // Show loading indicator while video initializes
              ),

              SizedBox(
                height: 42.h,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 30),
              //   child: Content(
              //     data: "Please use clear video",
              //     size: 16.h,
              //     weight: FontWeight.w400,
              //     family: "Lato",
              //   ),
              // ),
              SizedBox(
                height: 100.h,
              ),
              Consumer<InfluencerSelectionViewModel>(
                  builder: (context, viewModel, child) {
                return SizedBox(
                  width: 335.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: viewModel.faceIdentityLoading
                        ? null // Disable button if loading
                        : () {
                            if (selectedVideoFile != null) {
                              viewModel.uploadFaceIdentityVideo(
                                  context, selectedVideoFile!, _resetVideo);
                            } else {
                              Utils.snackBar(
                                  "Please record a video first!", context);
                            }

                            // navigate(context, InfluencerNavbarScreen());
                          },
                    child: viewModel.faceIdentityLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 20.h,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Lato",
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
