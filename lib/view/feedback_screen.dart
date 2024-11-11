import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';

class FeedbackScreen extends StatefulWidget {
  final String videoTypeId;

  const FeedbackScreen({
    Key? key,
    required this.videoTypeId,
  }) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String selectedEmoji = ''; // To store the selected emoji

  // List of emoji feedback options
  final List<String> emojis = ['😊', '😐', '😢', '😍', '😡'];
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserTaskDetailViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 146.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 35.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel,
                      size: 26.h,
                    ),
                  ),
                ],
              ),
            ),
            Content(
              data: "Give your feedback",
              size: 30.h,
              weight: FontWeight.w300,
            ),
            Content(
              data: "What is your level of satisfaction with the video?",
              size: 16.h,
              weight: FontWeight.w300,
            ),
            SizedBox(
              height: 70.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: emojis.map((emoji) {
                bool isSelected =
                    selectedEmoji == emoji; // Check if the emoji is selected
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = emoji; // Set selected emoji
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(
                          8), // Add some padding around the emoji
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.grey
                            : Colors
                                .transparent, // Grey background when selected
                        borderRadius: BorderRadius.circular(
                            50), // Make the container circular
                        border: Border.all(
                          color: isSelected
                              ? Colors.grey
                              : Colors
                                  .transparent, // Border color when selected
                          width: 2, // Border width
                        ),
                      ),
                      child: Text(
                        emoji,
                        style: TextStyle(
                          fontSize: isSelected
                              ? 35.h
                              : 20.h, // Increase size when selected
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 37.h),
            Container(
              width: 336.w,
              height: 189.h,
              child: TextField(
                controller: _messageController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Add your comments',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 79.h,
            ),

            SizedBox(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: viewModel.userStatusloading
                    ? null
                    : () {
                        viewModel.fetchUploadUserStatusData(context,
                            videoTypeId: widget.videoTypeId.toString(),
                            feedback: _messageController.text.toString());
                        // navigate(context, FeedbackScreen());
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
                        "Sumbit now",
                        style: TextStyle(fontSize: 16.h, color: Colors.white),
                      ),
              ),
            ),
            // Container(
            //   width: 335.w,
            //   height: 50.h,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // if (_emailController.text.isEmpty) {
            //       //   snackBar("Enter Valid Email", context);
            //       // } else if (_passwordController.text.isEmpty) {
            //       //   snackBar(
            //       //     "Enter Password",
            //       //     context,
            //       //   );
            //       // } else if (_passwordController.text.length < 8) {
            //       //   snackBar(
            //       //       "Enter Minium 8 Characters of Password", context);
            //       // } else {
            //       //   // Navigator.push(
            //       //   //     context,
            //       //   //     MaterialPageRoute(
            //       //   //         builder: (_) => TabBarWidget()));
            //       // navigate(context, FeedbackScreen());
            //       print(selectedEmoji);
            //       navigate(context, SuccessPaymentScreen());
            //       // }
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color(0xff5271FF),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30.r),
            //       ),
            //     ),
            //     child: Text(
            //       "Sumbit now",
            //       style: TextStyle(fontSize: 16.h, color: Colors.white),
            //     ),
            //   ),
            // ),
            // // Display selected emoji feedback
            // selectedEmoji.isNotEmpty
            //     ? Text(
            //         'You selected: $selectedEmoji',
            //         style: TextStyle(fontSize: 24),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
