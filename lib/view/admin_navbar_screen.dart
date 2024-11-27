import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Provider/admin_navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/admin_navbar.dart';
import 'package:vidbuy_app/resources/componenets/navbar_widget.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class AdminNavBarScreen extends StatefulWidget {
  const AdminNavBarScreen({super.key});

  @override
  State<AdminNavBarScreen> createState() => _AdminNavBarScreenState();
}

class _AdminNavBarScreenState extends State<AdminNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Consumer<AdminNavbarProvider>(builder: (context, value, child) {
            // Check if the screen index is valid to avoid any index errors
            if (value.screen < 0 || value.screen >= screens.length) {
              // Optional: You might want to navigate back to login or a default screen
              return LoginScreen(); // or navigate to a safe screen
            }
            return screens[value.screen];
          }),
          const Positioned(child: AdminNavbar())
        ],
      ),
    );
  }
}
