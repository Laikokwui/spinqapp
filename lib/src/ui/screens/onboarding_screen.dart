import 'package:flutter/material.dart';
import '../widgets/orb_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              OrbWidget(),
              SizedBox(height: 24),
              Text('Welcome to SpinQ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text('Privacy-first anonymous Q&A'),
            ],
          ),
        ),
      ),
    );
  }
}
