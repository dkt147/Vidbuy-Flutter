import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/view/request_video_scree.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  String selectedCategory = "Actor";

  final List<String> categories = [
    "Another Person",
    "My Self",
  ];
  TextEditingController _videoSelectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/Icon/backarrow.png",
                      height: 25.h,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Content(
                    data: "Create Order",
                    size: 14.h,
                    weight: FontWeight.w600,
                    family: "Nunito",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 26.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Influencer Video Service",
                    size: 20.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                  Content(
                    data: "Provide the video information",
                    size: 14.h,
                    weight: FontWeight.w300,
                    family: "Lato",
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Content(
                    data: "Who's this video for? ",
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    margin: EdgeInsets.only(left: 21.w),
                    child: Wrap(
                      spacing: 5.w,
                      runSpacing: 10.h,
                      children: categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: selectedCategory == category
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                color: Color(0xff000000),
                                width: 1.w,
                              ),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: 15.h,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold,
                                color: selectedCategory == category
                                    ? Colors.white
                                    : Color(0xff000000),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Center(
              child: ContentField(
                label: "Select the type of video",
                hint: "Please Select",
                colorr: Colors.transparent,
                // prefixIcon: ,
                suffixIcon: Image.asset("assets/Icon/email.png", height: 18.h,width: 21.w,),
                controller: _videoSelectController,
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                // validate: validateEmail,
                keyboardType: TextInputType.emailAddress,
                validate: (p0) {},
              ),
            ),
            Center(
              child: ContentField(
                label: "From",
                hint: "Enter Name",
                colorr: Colors.transparent,
                // prefixIcon: ,
                // suffixIcon: Icon(Icons.arrow_drop_down),
                controller: _videoSelectController,
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                // validate: validateEmail,
                keyboardType: TextInputType.emailAddress,
                validate: (p0) {},
              ),
            ),
            Center(
              child: ContentField(
                label: "To",
                hint: "Enter Name",
                colorr: Colors.transparent,
                // prefixIcon: ,
                // suffixIcon: Icon(Icons.arrow_drop_down),
                controller: _videoSelectController,
                inputFormat: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                // validate: validateEmail,
                keyboardType: TextInputType.emailAddress,
                validate: (p0) {},
                // maxLength: 7,
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 9.h, left: 17.w),
                child: Text(
                  "Details about Request",
                  style: TextStyle(
                      fontSize: 16.h,
                      color: Colors.black,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500),
                )),
            Center(
              child: Container(
                width: 334.w,
                height: 141.h,
                child: TextField(
                  // controller: _messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description of what is going on..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            Center(
              child: Container(
                width: 280.w,
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
                    navigate(context, RequestVideoScree());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 16.h,
                        color: Colors.white,
                        fontFamily: "Lato"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
