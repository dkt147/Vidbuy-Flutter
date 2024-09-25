import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

void donationMessageAlert(
  BuildContext context,
) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 450),
    transitionBuilder: (_, anim, __, child) {
      final tween = Tween(begin: Offset(1, 0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInQuad));
      // Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // }
      return SlideTransition(
        position: tween.animate(anim),
        child:
            //  SliverFadeTransition(
            //   opacity: anim,
            //   sliver: child,
            // )
            FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
    pageBuilder: (_, __, ___) {
      // GeneratePassViewModel generatePassViewModel =
      //     Provider.of<GeneratePassViewModel>(context, listen: false);
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
              width: 350.w,
              height: 265.h,
              // margin: EdgeInsets.symmetric(horizontal: 90.w),
              // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Container(
                margin: EdgeInsets.only(left: 20.w, top: 15.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Content(
                      data: "Message",
                      size: 22.h,
                      family: "Nunito",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: "[Message]",
                      size: 18.h,
                      family: "Nunito",
                      weight: FontWeight.w300,
                    ),
                    Content(
                      data: "No Message",
                      size: 18.h,
                      family: "Nunito",
                      weight: FontWeight.w300,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 50.h, left: 200.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Color(0xff5271FF),
                        ),
                        width: 100.w,
                        height: 50.h,
                        child: Center(
                            child: Content(
                          data: "Close",
                          size: 18.h,
                          family: "Nunito",
                          weight: FontWeight.w700,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
    },
  );
}
