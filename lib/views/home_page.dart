import 'package:flutter/material.dart';
import 'package:media_pr_3/views/screen/tab_page/audio.dart';
import 'package:media_pr_3/views/screen/tab_page/find.dart';
import 'package:media_pr_3/views/screen/tab_page/video.dart';
import 'package:provider/provider.dart';

import '../provider/index_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [
    Music(),
    Video(),
    Settings(),
  ];
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: Provider.of<ChangeIndexProvider>(context, listen: true)
            .changePageIndex
            .index,
        onTap: (val) {
          Provider.of<ChangeIndexProvider>(context, listen: false)
              .ChangeIndex(val: val);
          pageController.animateToPage(val,
              duration: Duration(microseconds: 150), curve: Curves.linear);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "MUSIC",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "VIDEO",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "FIND",
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Media Booster",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notification_important_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (val) {
          Provider.of<ChangeIndexProvider>(context, listen: false)
              .ChangeIndex(val: val);
        },
        controller: pageController,
        children: pageList,
      ),
    );
  }
}