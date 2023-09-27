import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          height: 40,
          width: w * .9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Search music and videos",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Find Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}