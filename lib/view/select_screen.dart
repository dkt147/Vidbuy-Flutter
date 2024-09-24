import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/primary_button.dart';
import 'package:vidbuy_app/view/select_login_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 812.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/UI/grouppicture.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: 60, // Adjust this position as needed
          //   child: FutureBuilder(
          //     future: categoryService.fetchCategories(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircularProgressIndicator();
          //       } else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else {
          //         return  Column(
          //           children: snapshot.data['categories'].map<Widget>((category) {
          //             category = Category.fromJson(category);
          //             return _buildCategoryItem(context, category);
          //           }).toList(),
          //         );
          //       }
          //     },
          //   ),
          // ),
          Positioned(
              bottom: 130.h,
              child: Text(
                "Shout Hello to\nthe world!",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  // fontFamily: "Londrina Solid",
                  fontSize: 40.h,
                  color: Colors.white,
                ),
              )),
          Positioned(
              bottom: 56.h,
              child: Row(
                children: [
                  PrimaryButton(
                    title: "Register",
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SelectLoginScreen()));
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  PrimaryButton(
                    title: "Login",
                    func: () {
                      navigate(context, LoginScreen());
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
