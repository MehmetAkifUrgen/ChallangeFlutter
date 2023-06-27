import 'package:deneme_p/screens/question_prepare_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home.dart';
import 'screens/menu.dart';
import 'screens/notifications.dart';
import 'screens/profile.dart';
import 'screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Arka plan rengi
    statusBarBrightness: Brightness.light, // Yazı rengi (beyaz veya siyah)
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
                      icon: const Icon(
                        Icons.home,
                        size: 24.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 24.0,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.account_circle,
                            size: 24.0,
                            color: Colors.white,
                          ),
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
                  QuestionPrepareScreen(),
                  ProfilePage(),
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
              onPressed: () => _onTabSelected(0),
            ),
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 24,
              ),
              color: _currentIndex == 1 ? Colors.orange : Colors.grey,
              onPressed: () => _onTabSelected(1),
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(
                Icons.notification_add,
                size: 24,
              ),
              color: _currentIndex == 2 ? Colors.orange : Colors.grey,
              onPressed: () => _onTabSelected(2),
            ),
            IconButton(
              icon: const Icon(
                Icons.account_box,
                size: 24,
              ),
              color: _currentIndex == 3 ? Colors.orange : Colors.grey,
              onPressed: () => _onTabSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}
