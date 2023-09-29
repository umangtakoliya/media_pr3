import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_pr_3/views/screen/audio_detail.dart';
import 'package:media_pr_3/views/screen/file_video.dart';
import 'package:media_pr_3/views/screen/home.dart';
import 'package:media_pr_3/views/screen/splash_screen.dart';
import 'package:media_pr_3/views/screen/video_detail.dart';

import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // bool isvisited = preferences.getBool("isIntroVisited") ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      // initialRoute: (isvisited) ? 'splash' : '/',
      routes: {
        // '/': (ctx) => intro_page(),
        '/': (ctx) => Splash(),
        'home': (ctx) => home(),
        'audio_details': (ctx) => audio_detail(),
        'video_details': (ctx) => video_detalis(),
        'file_video_detalis': (ctx) => file_video_detalis()
      },
    ),
  );
}