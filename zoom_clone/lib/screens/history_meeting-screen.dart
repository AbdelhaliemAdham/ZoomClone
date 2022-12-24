import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/controllers/saving_meetings_data.dart';

class HistoryMeetingScreen extends StatelessWidget {
  HistoryMeetingScreen({super.key});
  final MeetingsData _data = MeetingsData();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MeetingsData().getMeetingStreem,
      builder: ((context, snapshot) {
        final data = (snapshot.data! as dynamic);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: data.docs.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(data.docs[index]['roomName']),
                subtitle: Text(data.docs[index]['createdAt']),
              )),
        );
      }),
    );
  }
}
