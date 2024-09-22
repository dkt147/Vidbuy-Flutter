import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class InfluencerProfileScreen extends StatefulWidget {
  const InfluencerProfileScreen({super.key});

  @override
  State<InfluencerProfileScreen> createState() =>
      _InfluencerProfileScreenState();
}

class _InfluencerProfileScreenState extends State<InfluencerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                Image.asset(
                  "assets/Icon/backarrow.png",
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Content(
                  data: "Influencer",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
      Container(
      width: 383.w,  // Width scaling
      height: 353.h,  // Height scaling
      // margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r) )
      ),
      child: Stack(
        children: [
          // Background Image with a cut shape
          ClipPath(
            clipper: BottomSlantClipper(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Vector/Cover.png'),  // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Entertainer Tag
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                'Entertainer',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Profile Image
          Positioned(
            left: 15.w,
            bottom: 70.h,
            child: CircleAvatar(
              radius: 30.r,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),  // Replace with your profile image
            ),
          ),
          
          // Name, Username, and Rating
          Positioned(
            left: 15.w,
            bottom: 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Susan Goph',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '@susan.345',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.star, color: Colors.yellow, size: 16.w),
                    Text(
                      '4.7',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Book Me Button
          Positioned(
            right: 15.w,
            bottom: 15.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Book Me',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    ),
        ],
      ),
    );
  }
}

class BottomSlantClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50.h); // Starting from bottom left
    path.lineTo(size.width, size.height); // Cut slanting to bottom right
    path.lineTo(size.width, 0.0); // Right top
    path.lineTo(0.0, 0.0); // Left top
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
