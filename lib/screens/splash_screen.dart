import 'auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(); // Sonraki ekrana geçişinizi burada yapabilirsiniz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.orange])),
            child: const Center(
                child: Text(
              "Splash Screen",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ))),
      ),
    );
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(
        seconds:
            1)); // Görüntüyü bir süre göstermek için bekleme süresi ekleyin
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const LoginPage()), // Splash ekranı kapanıp ana ekrana geçiş yapacak olan ekranı burada belirleyin
    );
  }
}
