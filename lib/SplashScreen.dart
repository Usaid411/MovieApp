import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movieapp/HomePage.dart'; // Adjust the import according to your file structure

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and fade animation
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // Duration for the fade-in animation
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to the home page after the splash screen duration
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or splash image
              Image.asset(
                'assets/71p-auO4+6L.png', // Replace with your logo image path
                width: 150, // Adjust size as needed
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                "Movie App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
