import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/controllers/jitsi_meeting_controller.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController controller;
  late TextEditingController namecontroller;
  final AuthController authController = AuthController();
  final JitsiController jitsiController = JitsiController();

  @override
  void initState() {
    controller = TextEditingController();
    namecontroller = TextEditingController(
      text: authController.user.displayName,
    );
    super.initState();
  }

  _joinMeeting() {
    jitsiController.CreateMeeting(
        roomName: controller.text,
        videoMuted: isVideoMuted,
        audioMuted: isAudioMuted,
        userName:namecontroller.text);
  }

  bool isAudioMuted = false;
  bool isVideoMuted = false;
  isVideoMutedfuction(bool muteVideo) {
    setState(() {
      isVideoMuted = muteVideo;
    });
  }

  isAudioMutedfunction(bool muteAudio) {
    setState(() {
      isAudioMuted = muteAudio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        TextField(
          controller: controller,
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'ROOM ID'),
        ),
        TextField(
          controller: namecontroller,
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Name'),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: _joinMeeting,
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'join',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),
        MeetingOption(
            text: "Mute Audio",
            isMute: isAudioMuted,
            onChange: isAudioMutedfunction),
        MeetingOption(
            text: "Turn off myVideo",
            isMute: isAudioMuted,
            onChange: isVideoMutedfuction),
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    namecontroller.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }
}
