import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revoo/Login/login.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key = const Key('')}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _visible = true;

@override
  void initState() {

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  _controller = VideoPlayerController.asset("asset/introvideo.mp4");
  _controller.initialize().then((_) {
    // _controller.setLooping(true);

      setState(() {
        _controller.play();
        _visible = true;
      });
  });

  Future.delayed(Duration(seconds: 6), () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen()),
            (e) => false);
  });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();

    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
    );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:  VideoPlayer(_controller)
        ),
      ),
    );
  }
}
