import 'package:flutter/material.dart';

import '../../../model/audiomodel.dart';
import '../../../utils/Assets/audiolist/audiolist.dart';


class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...listsong
                .map(
                  (e) => Container(
                height: 60,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundImage: AssetImage("${e["image"]}"),
                    ),
                    title: Text(
                      "${e["title"]}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    // subtitle: Text("${e["audio"]}"),
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: IconButton(
                      onPressed: () {
                        AudioModel m = AudioModel(
                          audio: e['audio'],
                          image: e['image'],
                          title: e['title'],
                        );
                        Navigator.pushNamed(context, 'songdetail',
                            arguments: m);
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
                .toList()
          ],
        ),
      ),
    );
  }
}