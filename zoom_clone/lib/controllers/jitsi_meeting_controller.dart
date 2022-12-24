import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/controllers/saving_meetings_data.dart';

class JitsiController {
  final AuthController authController = AuthController();
  final MeetingsData _data = MeetingsData();
  CreateMeeting({
    required String roomName,
    required bool videoMuted,
    required bool audioMuted,
    String userName = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (userName.isEmpty) {
        name = authController.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..subject = "Meeting with Gunschu"
        ..userDisplayName = name
        ..userEmail = authController.user.email
        ..userAvatarURL = authController.user.photoURL
        ..audioMuted = audioMuted
        ..videoMuted = videoMuted
        ..featureFlags = featureFlag as Map<FeatureFlagEnum, bool>;
      await _data.saveMeetingData(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
