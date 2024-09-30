import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

void bottomSheetWidget(BuildContext context) {
  TextEditingController phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final PageController controller = PageController(initialPage: 0);

  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    // backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(30.r),
        topStart: Radius.circular(30.r),
      ),
    ),
    builder: (context) => Container(
      padding: EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        bottom: 30,
        top: 8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // color: Colors.white,
            height: 467.h,
            width: 375.w,
            child: PageView(
              controller: controller,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
