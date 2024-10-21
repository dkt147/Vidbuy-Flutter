import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class GivewayScreen extends StatefulWidget {
  const GivewayScreen({super.key});

  @override
  State<GivewayScreen> createState() => _GivewayScreenState();
}

class _GivewayScreenState extends State<GivewayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: false,
        child: Column(
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
                    data: "Giveaway",
                    size: 14.h,
                    weight: FontWeight.w600,
                    family: "Nunito",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 331.w,
                    height: 165.h,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image.asset(
                      "assets/UI/giveaway.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          // textDirection: TextDirection.rtl,
                          children: [
                            Container(
                              width: 94.w,
                              height: 94.h,
                              margin: EdgeInsets.only(top: 180.h, left: 170.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/Vector/girl.png"),
                            ),
                            Container(
                              width: 132.w,
                              height: 133.h,
                              margin: EdgeInsets.only(top: 140.h, left: 55.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset("assets/Vector/girl.png"),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 270.w, top: 13.h),
                                child: Image.asset(
                                  "assets/Icon/Info.png",
                                  height: 13.h,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 185.h,
                  left: 50.w,
                  child: Container(
                    width: 94.w,
                    height: 94.h,
                    // margin: EdgeInsets.only(top: 180.h, left: 40.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/Vector/girl.png"),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Podium for 2nd place (slanted to the left)
                    Container(
                      margin: EdgeInsets.only(top: 30.h),
                      child: PodiumBlock(
                        height: 138.h,
                        width: 91.w,
                        color: Color(0xff161436),
                        rank: "2",
                        clipper: RightSlantClipper(),
                      ),
                    ),
                    // SizedBox(width: 10.w),

                    // Podium for 1st place (tallest, slanted slightly on both sides)
                    PodiumBlock(
                      height: 172.h,
                      width: 91.w,
                      color: Color(0xff161436),
                      rank: "1",
                      clipper: CenterSlantClipper(),
                    ),
                    // SizedBox(width: 10.w),

                    // Podium for 3rd place (slanted to the right)
                    PodiumBlock(
                      height: 138.h,
                      width: 91.w,
                      // color: Colors.indigo[900]!,
                      color: Color(0xff161436),
                      rank: "3",
                      clipper: LeftSlantClipper(),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    width: 374.w,
                    height: 582.h,
                    margin: EdgeInsets.only(top: 145.h),
                    decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //     ListTile(
                          //   leading: Content(data: "04", size: 18.h, weight: FontWeight.w400, family: "Nunito", color: Colors.black,),
                          //   title: Container(
                          //     width: 39.h,
                          //     height: 39.w,
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //     ),
                          //     child: Image.asset("assets/Vector/girl.png"),
                          //   ),
                          //   trailing: Icon(Icons.done),
                          //   subtitle: Text('This is subtitle'),
                          //   selected: false,
                          // ),
                          // Container(
                          //   margin:
                          //       EdgeInsets.only(top: 30.h, left: 23.w, right: 24.w),
                          //   child: Row(
                          //     children: [
                          //       Content(
                          //         data: "04",
                          //         size: 18.h,
                          //         weight: FontWeight.w400,
                          //         family: "Nunito",
                          //         color: Colors.black,
                          //       ),
                          //       SizedBox(
                          //         width: 21.h,
                          //       ),
                          //       Container(
                          //         width: 39.h,
                          //         height: 39.w,
                          //         decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //         ),
                          //         child: Image.asset("assets/Vector/girl.png"),
                          //       ),
                          //       SizedBox(
                          //         width: 13.h,
                          //       ),
                          //       Content(
                          //         data: "Mani Khan",
                          //         size: 18.h,
                          //         weight: FontWeight.w400,
                          //         family: "Nunito",
                          //         color: Colors.black,
                          //       ),
                          //       SizedBox(
                          //         width: 112.h,
                          //       ),
                          //       Content(
                          //         data: "120pt",
                          //         size: 14.h,
                          //         weight: FontWeight.w400,
                          //         family: "Nunito",
                          //         color: Colors.black,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                          WinnerList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WinnerList extends StatelessWidget {
  const WinnerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h, left: 23.w, right: 24.w),
      child: Row(
        children: [
          Content(
            data: "04",
            size: 18.h,
            weight: FontWeight.w400,
            family: "Nunito",
            color: Colors.black,
          ),
          SizedBox(
            width: 21.h,
          ),
          Container(
            width: 39.h,
            height: 39.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/Vector/girl.png"),
          ),
          SizedBox(
            width: 13.h,
          ),
          Content(
            data: "Mani Khan",
            size: 18.h,
            weight: FontWeight.w400,
            family: "Nunito",
            color: Colors.black,
          ),
          SizedBox(
            width: 112.h,
          ),
          Content(
            data: "120pt",
            size: 14.h,
            weight: FontWeight.w400,
            family: "Nunito",
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class PodiumBlock extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String rank;
  final CustomClipper<Path> clipper;

  const PodiumBlock({
    required this.height,
    required this.width,
    required this.color,
    required this.rank,
    required this.clipper,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: clipper, // Custom Clipper for each slanted podium
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(color: color, boxShadow: [
              BoxShadow(
                color: Color(0xff000000),
                blurRadius: 4,
                offset: Offset(0, 6), // Shadow position
              ),
            ]),
          ),
        ),
        Positioned(
          left: width * 0.30, // To center the text within the block
          top: height * 0.30, // To position the text in the middle
          child: Text(
            rank,
            style: TextStyle(
              fontSize: 60.h,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontFamily: "Nunito",
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper for left-slanted block (2nd place)
class LeftSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height); // Start at bottom-left
    path.lineTo(size.width, size.height * 0.9); // Right bottom, slanted
    path.lineTo(size.width, 0); // Right top
    path.lineTo(0, size.height * 0.2); // Left top, slanted
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Custom Clipper for center block (1st place)
class CenterSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height); // Start at bottom-left
    path.lineTo(
        size.width, size.height * 0.9); // Right bottom, slanted slightly
    path.lineTo(size.width, 0); // Right top
    path.lineTo(0, size.height * 0.1); // Left top, slanted slightly
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Custom Clipper for right-slanted block (3rd place)
class RightSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height); // Start at bottom-left
    path.lineTo(size.width, size.height * 0.8); // Right bottom, slanted
    path.lineTo(size.width, size.height * 0.1); // Right top
    path.lineTo(0, 0); // Left top
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
