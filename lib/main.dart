import 'package:flutter/material.dart';
import 'package:media_pr_3/provider/index_provider.dart';
import 'package:media_pr_3/views/home_page.dart';
import 'package:media_pr_3/views/songdetais.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<ChangeIndexProvider>(
        create: (context) => ChangeIndexProvider(),
      ),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => HomePage(),
        'songdetail': (context) => SongDetail(),
      },
    ),
  ));
}
