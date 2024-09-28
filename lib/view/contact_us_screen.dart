import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              margin: EdgeInsets.only(top: 55.h, left: 21.w),
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
                    data: "Contact",
                    size: 14.h,
                    weight: FontWeight.w600,
                    family: "Nunito",
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Contact us",
                    size: 30.h,
                    weight: FontWeight.w300,
                  ),
                  Content(
                    data: "Please feel free to contact us, we will respond as quickly as possible",
                    size: 16.h,
                    weight: FontWeight.w300,
                    family: "Lato",
                  ),
                ],
              ),
            ),
        
            Container(
              margin: EdgeInsets.only(left: 21.w, top: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentField(
                            label: "Your Name",
                            hint: "Enter Your Name",
                            colorr: Colors.transparent,
                            prefixIcon: Image.asset("assets/Icon/person.png", height: 25.h,),
                            controller: _nameController,
                            inputFormat: <TextInputFormatter>[
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 10.h),
                    ContentField(
                      label: "Email",
                      hint: "Enter Your Email",
                      colorr: Colors.transparent,
                      prefixIcon: Image.asset("assets/Icon/email.png", height: 25.h,),
                      
                      // Icon(Icons.person),
                      controller: _emailController,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.h),
                    Content(
                    data: "Message",
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
              // Message Field
              Container(
                width: 334.w,
                height: 212.h,
                child: TextField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description of what is going on..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 16.h,
              // ),
              
                ],
              ),
            ),
            Center(
              child: Container(
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
                    //   navigate(context, NavBarScreen());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 16.h, color: Colors.white),
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
