import 'dart:async';
import 'dart:math';

import 'package:covid_19_tracker/Views/world_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    duration: Duration(
      seconds: 3
    ),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WorldScreen();
          }));
          animationController.dispose();
            });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animationController,
              child: Container(
                    child: Center(child: Image.asset("assets/images/virus.png")),
              ),
              builder: (BuildContext context,child){
                  return Transform.rotate(
                    angle:animationController.value * 2 * pi,
                    child: child,
                  );
                },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.08,
            ),
            Text(
              "Covid-19 Tracker",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),)
          ],
      ),
      ),
    );
  }
}

