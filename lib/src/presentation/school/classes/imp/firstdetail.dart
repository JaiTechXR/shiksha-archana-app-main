import 'package:flutter/material.dart';

class firstdetail extends StatefulWidget {
  final String classes;
  // final String img;
  final List<dynamic> subjects;
  final int nosubjects;
  final String title1;
  final String title2;
  const firstdetail({
    super.key,
    required this.title1,
    required this.title2,
    required this.nosubjects,
    required this.classes,
    // required this.img,
    required this.subjects,
  });

  @override
  State<firstdetail> createState() => _firstdetailState();
}

class _firstdetailState extends State<firstdetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
