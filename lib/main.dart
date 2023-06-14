import 'package:deneme_p/components/icon_image.dart';
import 'package:deneme_p/screens/home.dart';
import 'package:deneme_p/screens/menu.dart';
import 'package:deneme_p/screens/notifications.dart';
import 'package:deneme_p/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/profile.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Arka plan rengi
    statusBarBrightness: Brightness.light, // Yazı rengi (beyaz veya siyah)
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CustomNavigationBar({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.orange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                height: 72.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const IconImage(iconAsset: 'assets/home.png'),
                      onPressed: () {},
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const IconImage(iconAsset: 'assets/menu.png'),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const IconImage(iconAsset: 'assets/user.png'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: const [
                  Home(),
                  Menu(),
                  Notifications(),
                  ProfilePage()
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.red,
              Colors.yellow,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(36),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.rocket_launch_outlined,
            size: 48,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 56,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                size: 24,
              ),
              color: _currentIndex == 0 ? Colors.orange : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 24,
              ),
              color: _currentIndex == 1 ? Colors.orange : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            const SizedBox(
              width: 40,
            ),
            IconButton(
              icon: const Icon(
                Icons.notification_add,
                size: 24,
              ),
              color: _currentIndex == 2 ? Colors.orange : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.account_box,
                size: 24,
              ),
              color: _currentIndex == 3 ? Colors.orange : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
