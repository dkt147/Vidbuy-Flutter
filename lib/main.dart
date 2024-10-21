import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/services/nav.service.dart';
import 'package:vidbuy_app/services/storage.service.dart';
import 'package:vidbuy_app/view/admin_dashboard_screen.dart';
import 'package:vidbuy_app/view/cancel_screen.dart';
import 'package:vidbuy_app/view/pending_admin_screen.dart';
import 'package:vidbuy_app/view/splash_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_signup_view_model.dart';

late SharedPreferences pref;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization
  pref = await SharedPreferences.getInstance(); // Initialize SharedPreferences
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ChangeNotifierProvider(create: (_) => InfluencerSignupViewModel()),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return FutureBuilder<String>(
            future: _getInitialRoute(), // Await the initial route
            builder: (context, snapshot) {
              // Check the connection state
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const Center(child: CircularProgressIndicator()); // Show loading while waiting
              // }
              // if (snapshot.hasError) {
              //   return MaterialApp(
              //     home: Center(child: Text('Error: ${snapshot.error}')),
              //   ); // Show error if it occurs
              // }

              // If route is ready, return MaterialApp with initialRoute
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'VidBuy App',
                initialRoute:
                    snapshot.data, // Use the initial route from snapshot
                theme: ThemeData(
                  fontFamily: "LondrinaSolid",
                  scaffoldBackgroundColor: const Color(0xffFFFFFF),
                  scrollbarTheme: ScrollbarThemeData(
                    trackColor:
                        WidgetStateProperty.all(const Color(0xffFFFFFF)),
                  ),
                  useMaterial3: true,
                ),
                onGenerateRoute: Nav.generateRoute, // Use the route generator
              );
            },
          );
        },
      ),
    );
  }
}

Future<String> _getInitialRoute() async {
  StorageService storageService = StorageService();
  String? token =
      await storageService.get('token'); // Await the future to get the token
  return (token != null && token.isNotEmpty)
      ? Nav.navBar
      : Nav.splash; // Check token and return route
}
