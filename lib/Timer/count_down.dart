import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:revoo/Timer/round_button.dart';
import 'package:revoo/constants/constants.dart';


class CountdownPage extends StatefulWidget {
  final int hours;
  final int minutes;
  final int seconds;
  final double progressValues;
  const CountdownPage({Key? key, required this.hours, required this.minutes, required this.seconds, required this.progressValues}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {


    Duration count = controller.duration! * controller.value;


    return controller.isDismissed
        ? '${(controller.duration!.inHours).toString().padLeft(2,'0')}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inHours).toString().padLeft(2,'0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: widget.hours,minutes: widget.minutes,seconds: widget.seconds),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          // progress = controller.value;
        });
      } else {
        setState(() {
          // progress = 1.0;
          isPlaying = false;
        });
      }
    });

    controller.reverse(
        from: controller.value == 0 ? 1.0 : controller.value);
    setState(() {
      isPlaying = true;
    });


  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {





    return   Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: CircularProgressIndicator(
                  backgroundColor: kyellow.withOpacity(0.3),
                  color: kyellow,
                  value: widget.progressValues,
                  strokeWidth: 6,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (controller.isDismissed) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 300,
                        child: CupertinoTimerPicker(
                          initialTimerDuration: controller.duration!,
                          onTimerDurationChanged: (time) {
                            setState(() {
                              controller.duration = time;
                            });
                          },
                        ),
                      ),
                    );
                  }
                },
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => Text(
                    countText,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kyellow
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   height: 100,
        //   child: Row(
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           if (controller.isAnimating) {
        //             controller.stop();
        //             setState(() {
        //               isPlaying = false;
        //             });
        //           } else {
        //             controller.reverse(
        //                 from: controller.value == 0 ? 1.0 : controller.value);
        //             setState(() {
        //               isPlaying = true;
        //             });
        //           }
        //         },
        //         child: RoundButton(
        //           icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           controller.reset();
        //           setState(() {
        //             isPlaying = false;
        //           });
        //         },
        //         child: RoundButton(
        //           icon: Icons.stop,
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}