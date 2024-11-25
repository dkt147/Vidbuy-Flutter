import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_task_detail_view_model.dart';

// ignore: must_be_immutable
class InfluencerOrderCancelScreen extends StatelessWidget {
  String videoTypeId;
  InfluencerOrderCancelScreen({required this.videoTypeId, super.key});
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InfluencerTaskDetailViewModel>(context);
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
                  "Detail to the customer why you rejected their order,\nthey can read the message.",
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
                onPressed: viewModel.influencerRejectStatusloading
                    ? null
                    : () {
                        if (_messageController.text.isEmpty) {
                          Utils.snackBar("Please enter message", context);
                        } else {
                          viewModel.fetchRejectStatusData(context,
                              videoTypeId: videoTypeId,
                              reason: _messageController.text.toString());
                        }
                        // navigate(context, FeedbackScreen());
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: viewModel.influencerRejectStatusloading
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
