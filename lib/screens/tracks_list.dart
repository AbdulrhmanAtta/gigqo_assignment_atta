import 'package:flutter/material.dart';
import 'package:gigqo_assignment/model/Track.dart';
import 'single_track.dart';

class TrackList extends StatelessWidget {

  final List<Track> track;
  TrackList({ required this.track});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Color(0xff121219),
              child: ListView.builder(
            itemCount: track == null ? 0 : track.length,
            itemBuilder: (BuildContext context, int index) {
              return
                Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailWidget(track[index])),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
  backgroundImage: AssetImage(track[index].cover), // no matter how big it is, it won't overflow
),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(track[index].name),
                            SizedBox(width: 10),
                            Text("|"),
                             SizedBox(width: 10),
                            Text(track[index].artist),
                          ],
                        ),
                        subtitle: Text(track[index].year.toString()),
                      ),
                    )
                );
            }),
      );
  }

}