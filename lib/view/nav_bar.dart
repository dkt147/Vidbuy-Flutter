
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Provider/navbar_provider.dart';
import 'package:vidbuy_app/resources/componenets/navbar_widget.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Consumer<NavbarProvider>(builder: (context, value, child) {
            // Check if the screen index is valid to avoid any index errors
            if (value.screen < 0 || value.screen >= screens.length) {
              // Optional: You might want to navigate back to login or a default screen
              return LoginScreen(); // or navigate to a safe screen
            }
            return screens[value.screen];
          }),
          const Positioned(child: NavBar())
        ],
      ),
    );
  }
}