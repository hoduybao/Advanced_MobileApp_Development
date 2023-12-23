import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


import '../../model/schedule/booking_infor.dart';

class JoinMeetingPage extends StatefulWidget {
  const JoinMeetingPage({super.key, required this.upcomingClass});
  final BookingInfo upcomingClass;

  @override
  State<JoinMeetingPage> createState() => _JoinMeetingPageState();
}

class _JoinMeetingPageState extends State<JoinMeetingPage> {
  //Join meeting
  late BookingInfo upcomingClass = widget.upcomingClass;
  late DateTime endTime;
  bool canJoinMeeting = false;


  @override
  void initState() {
    super.initState();
    // endTime = DateTime.now().add(const Duration(seconds: 10));
    endTime = DateTime.fromMillisecondsSinceEpoch(
        upcomingClass.scheduleDetailInfo!.startPeriodTimestamp!);
  }

  void onEnd() {
    setState(() {
      canJoinMeeting = true;
    });
  }

  void _joinMeeting() async {
    final String meetingToken =
        upcomingClass.studentMeetingLink?.split('token=')[1] ?? '';
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(meetingToken);
    final String room = jwtDecoded['room'];

    var options = JitsiMeetingOptions(
      roomNameOrUrl: room,
      serverUrl: "https://meet.lettutor.com",
      token: meetingToken,
      isAudioMuted: true,
      isAudioOnly: true,
      isVideoMuted: true,
    );

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onClosed: () => debugPrint("onClosed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
          const Size.fromHeight(50.0), // Define the height of the AppBar
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.1), // Color and opacity of the shadow
                spreadRadius: 1, // Spread radius of the shadow
                blurRadius: 8, // Blur radius of the shadow
                offset: const Offset(0, 0), // Offset of the shadow
              )
            ]),

            child: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.black,
                // Status bar brightness (optional)
                statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
              ),
              title: Text("Join Meeting",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.blueAccent,
                ),
              ),
              centerTitle: true,
            ),

            // Replace 'assets/icon.png' with your image path
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset(ImagesPath.video),
              CountdownTimer(
                onEnd: onEnd,
                endTime: endTime.millisecondsSinceEpoch,
                textStyle: TextStyle(color: Colors.blue),
              //   endWidget: CustomElevatedButton(
              //       title: AppLocalizations.of(context)!.joinMeeting,
              //       callback: () {
              //         _joinMeeting();
              //       },
              //       buttonType: ButtonType.filledButton,
              //       radius: 10),
              // ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // onPressedChatBubble(context, size);
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ));
  }

  // void onPressedChatBubble(BuildContext context, Size size) {
  //   Navigator.pushNamed(context, MyRouter.chatGpt);
  // }
}
