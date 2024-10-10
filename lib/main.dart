import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/view/admin_dashboard_screen.dart';
import 'package:vidbuy_app/view/cancel_screen.dart';
import 'package:vidbuy_app/view/pending_admin_screen.dart';
import 'package:vidbuy_app/view/splash_screen.dart';

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
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'VidBuy App',
            theme: ThemeData(
              fontFamily: "LondrinaSolid",
              scaffoldBackgroundColor: const Color(0xffFFFFFF),
              scrollbarTheme: ScrollbarThemeData(
                trackColor: WidgetStateProperty.all(const Color(0xffFFFFFF)),
              ),
              useMaterial3: true,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
