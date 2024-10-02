import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/resources/componenets/pending_admin_tile.dart';
import 'package:vidbuy_app/view/persnol_details_screen.dart';
import 'package:vidbuy_app/view/video_identity_screen.dart';

class PendingAdminScreen extends StatelessWidget {
  const PendingAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          navigate(
              context,
              MainTabbarAdminWidget(screens: [
                VideoIdentityScreen(),
                PersnolDetailsScreen(),
              ], tabTitles: [
                "Video Identity",
                "Persnol Detail",
              ]));
        },
        child: Column(
          children: [
            // ListTile(
            //   leading: Content(
            //                     data: "Influencers Name",
            //                     size: 16.h,
            //                     weight: FontWeight.w500,
            //                     family: "Lato",
            //                   ),
            //                   // title: Content(data: "Cancel", size: 14.h,  family: "Lato", weight: FontWeight.w500,),
            //                   trailing: Content(data: "Cancel  Revert", size: 14.h,  family: "Lato", weight: FontWeight.w500,),
            // ),

            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
            PendingAdminTile(),
          ],
        ),
      ),
    );
  }
}
