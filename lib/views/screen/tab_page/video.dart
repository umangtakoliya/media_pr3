import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: Center(
        child: Text(
          "Video Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}