import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone/controllers/jitsi_meeting_controller.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiController jitsiController = JitsiController();

  createMeeting() async {
    await jitsiController.CreateMeeting(
        roomName: Random().nextInt(1000).toString(),
        videoMuted: false,
        audioMuted: false);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video_call_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: joinMeeting(context),
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Schedule',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
