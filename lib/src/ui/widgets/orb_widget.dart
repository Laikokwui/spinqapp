import 'package:flutter/material.dart';

class OrbWidget extends StatelessWidget {
  const OrbWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [Colors.deepPurple, Colors.blueAccent],
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: const Center(
        child: Icon(Icons.help_outline, size: 56, color: Colors.white70),
      ),
    );
  }
}
