import "package:flutter/material.dart";

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      )),
    );
  }
}
