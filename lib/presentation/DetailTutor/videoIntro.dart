import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';

class VideoIntro extends StatefulWidget {
  const VideoIntro({super.key});

  @override
  State<VideoIntro> createState() => _VideoIntroState();
}

class _VideoIntroState extends State<VideoIntro> {
  late CustomVideoPlayerController _customVideoPlayerControler;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerControler,));
  }
  void initializeVideoPlayer(){
    VideoPlayerController _videoPlayerController;
    _videoPlayerController=VideoPlayerController.asset("assets/video/VideoDeTailTutor.mp4")..initialize().then((value)  {
      setState(() {

      });
    });
    _customVideoPlayerControler=CustomVideoPlayerController(context: context, videoPlayerController: _videoPlayerController);
  }
  @override
  void dispose() {
    _customVideoPlayerControler.dispose();
    super.dispose();
  }
}