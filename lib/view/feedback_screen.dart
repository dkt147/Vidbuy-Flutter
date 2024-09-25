import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/payment_confirm_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

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
                  Icon(
                    Icons.cancel,
                    size: 26.h,
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = emoji; // Set selected emoji
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: 40.h),
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
            Container(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  // if (_emailController.text.isEmpty) {
                  //   snackBar("Enter Valid Email", context);
                  // } else if (_passwordController.text.isEmpty) {
                  //   snackBar(
                  //     "Enter Password",
                  //     context,
                  //   );
                  // } else if (_passwordController.text.length < 8) {
                  //   snackBar(
                  //       "Enter Minium 8 Characters of Password", context);
                  // } else {
                  //   // Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (_) => TabBarWidget()));
                  // navigate(context, FeedbackScreen());
                  print(selectedEmoji);
                  navigate(context, PaymentConfirmScreen());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Sumbit now",
                  style: TextStyle(fontSize: 16.h, color: Colors.white),
                ),
              ),
            ),
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
