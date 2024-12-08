import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/notification_tile.dart';
import 'package:vidbuy_app/view/check_email_screen.dart';
import 'package:vidbuy_app/viewmodel/notification_view_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  // static const route = '/notification-screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationViewModel notificationViewModel;

  @override
  void initState() {
    super.initState();
    notificationViewModel = NotificationViewModel();
    notificationViewModel
        .fetchNotificationList(); // Pass query params if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
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
                SizedBox(width: 5.w),
                Content(
                  data: "Notifications",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          // SizedBox(height: 22.h),

          // Notifications Section
          Expanded(
            child: ChangeNotifierProvider(
              create: (BuildContext context) => notificationViewModel,
              child: Consumer<NotificationViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      if (viewModel.isNotificationsFetching &&
                          viewModel.notifications.isEmpty)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (!viewModel.isNotificationsFetching &&
                          viewModel.notifications.isEmpty)
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Logo/logo.png',
                                  height: 177.h,
                                  width: 128.w,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "No Notifications Currently",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (scrollInfo.metrics.pixels ==
                                      scrollInfo.metrics.maxScrollExtent &&
                                  !viewModel.isNotificationsFetching &&
                                  viewModel.hasNotificationMoreData) {
                                viewModel.fetchNotificationList();
                                return true;
                              }
                              return false;
                            },
                            child: ListView.builder(
                              itemCount: viewModel.notifications.length +
                                  (viewModel.isNotificationsFetching ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == viewModel.notifications.length) {
                                  return const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                final notifications =
                                    viewModel.notifications[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: NotificationTile(
                                      title: notifications.title.toString(),
                                      message: notifications.body.toString(),
                                      date: Utils.dateFormat1(
                                          notifications.createdAt.toString())),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 55.h, left: 21.w),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Image.asset(
//                     "assets/Icon/backarrow.png",
//                     height: 25.h,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5.w,
//                 ),
//                 Content(
//                   data: "Notifications",
//                   size: 14.h,
//                   weight: FontWeight.w600,
//                   family: "Nunito",
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 22.h,
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   NotificationTile(
//                       title: message.notification?.title ?? "",
//                       message: message.notification?.body ?? "",
//                       date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                   NotificationTile(
//                       title: "Headaer", message: "message", date: "date"),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
