// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/pages/NewReals/like_icon.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({
    Key? key,
    this.src,
  }) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool autoPlay = true;
  bool _liked = false;
  bool _play = true;
  bool test = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _videoPlayerController.pause();
    _chewieController!.pause();

    // if (_chewieController != null) {
    //   _chewieController!.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  if (_play == true) {
                    _videoPlayerController.pause();
                    setState(() {
                      _play = !_play;
                    });
                  } else {
                    _videoPlayerController.play();
                    setState(() {
                      _play = !_play;
                    });
                  }
                },
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        Visibility(
            visible: _play == false ? true : false,
            child: Center(
                child: GestureDetector(
              onTap: () {
                _videoPlayerController.play();
                setState(() {
                  _play = !_play;
                });
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30.w,
              ),
            ))),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        option()
      ],
    );
  }

  Widget option() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Column(
              //   children: [
              //     SizedBox(height: 110),
              //     Row(
              //       children: [
              //         const CircleAvatar(
              //           radius: 16,
              //           child: Icon(Icons.person, size: 18),
              //         ),
              //         const SizedBox(width: 6),
              //         const Text('Skilldren Admin',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 //fontFamily: grandstander,
              //                 color: Colors.white,
              //                 shadows: <Shadow>[
              //                   Shadow(
              //                     offset: Offset(1.0, 1.0),
              //                     blurRadius: 3.0,
              //                     color: Color.fromARGB(255, 0, 0, 0),
              //                   ),
              //                 ])),
              //         const SizedBox(width: 10),
              //         const Icon(Icons.verified, size: 15),
              //         const SizedBox(width: 6),
              //         TextButton(
              //           onPressed: () {},
              //           child: const Text(
              //             'Follow',
              //             style: TextStyle(
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(width: 6),
              //     Text(
              //       'Skilldren is beautiful and fast 💙❤💛 ..',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     SizedBox(height: 10),
              //     Row(
              //       children: [
              //         Icon(
              //           Icons.music_note,
              //           size: 15,
              //           color: Colors.white,
              //         ),
              //         Text(
              //           'Original Audio - some music track--',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

              Column(
                children: [
                  // GestureDetector(
                  //   onTap: () async {
                  //     if (test == false) {
                  //       await likereelProvider.fetchApi(widget.reelId);
                  //       Fluttertoast.showToast(
                  //           msg: likereelProvider.mydata?.response ?? '');
                  //       reelProvider.fetchAip();
                  //       setState(() {
                  //         test = !test;
                  //       });
                  //     } else {
                  //       await reaalDislikeProvider.fetchApi(widget.reelId);
                  //       Fluttertoast.showToast(
                  //           msg: reaalDislikeProvider.mydata?.response ?? '');
                  //       reelProvider.fetchAip();
                  //       setState(() {
                  //         test = !test;
                  //       });
                  //     }
                  //   },
                  //   child: Icon(
                  //     test == false ? Icons.favorite_outline : Icons.favorite,
                  //     color: test == false ? Colors.white : Colors.red,
                  //   ),
                  // ),

                  // Text(
                  //   widget.reelTotalLikes.toString(),
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  //const SizedBox(height: 20),
                  // const Icon(Icons.comment_rounded),
                  // const Text('1123'),
                  // const SizedBox(height: 20),
                  // Transform(
                  //   transform: Matrix4.rotationZ(5.8),
                  //   child: const Icon(
                  //     Icons.send,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // Icon(Icons.more_vert, color: ColorUtils.text1),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
