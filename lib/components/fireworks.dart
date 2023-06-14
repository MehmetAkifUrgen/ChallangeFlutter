import 'package:flutter/material.dart';
import 'dart:math';

import 'package:confetti/confetti.dart';

class Fireworks extends StatefulWidget {
  const Fireworks({super.key});

  @override
  _FireworksState createState() => _FireworksState();
}

class _FireworksState extends State<Fireworks> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: ConfettiWidget(
          confettiController: _controllerCenter,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ],
          createParticlePath: drawStar,
        ),
      ),
    );
  }
}
