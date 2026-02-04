import 'package:flutter/material.dart';

class DefaultElevatedBotton extends StatelessWidget {
  
  String label;
  VoidCallback onPressed;

  DefaultElevatedBotton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 48),
      ),
    );
  }
}