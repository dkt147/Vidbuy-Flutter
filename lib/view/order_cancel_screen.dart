import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_task_detail_view_model.dart';

// ignore: must_be_immutable
class OrderCancelScreen extends StatefulWidget {
  String videoTypeId;
  OrderCancelScreen({required this.videoTypeId, super.key});

  @override
  State<OrderCancelScreen> createState() => _OrderCancelScreenState();
}

class _OrderCancelScreenState extends State<OrderCancelScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<UserTaskDetailViewModel>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 146.h,
            ),
            Content(
              data: "Reason For rejection",
              size: 30.h,
              weight: FontWeight.w300,
            ),
            Content(
              data:
                  "Detail to the influencer why you rejected the request,\nthey will be able to read the message",
              size: 16.h,
              weight: FontWeight.w300,
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: 334.w,
              height: 384.h,
              child: TextField(
                controller: _messageController,
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: 'Description of what is going on..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            SizedBox(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: viewModel.userRejectStatusloading
                    ? null
                    : () {
                        viewModel.fetchUploadUserRejectStatusData(
                          context,
                          videoTypeId: widget.videoTypeId,
                          reason: _messageController.text.toString(),
                        );

                        // navigate(context, FeedbackScreen());
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: viewModel.userRejectStatusloading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        "Sumbit now",
                        style: TextStyle(fontSize: 16.h, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
