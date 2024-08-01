import 'package:chewie/chewie.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ShowVideoScreen extends StatefulWidget {
  final String video;
  const ShowVideoScreen({super.key, required this.video});

  @override
  State<ShowVideoScreen> createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  Future<void> _getVideo() async {
    Reference videoRef =
        FirebaseStorage.instance.ref().child(widget.video + '.mp4');
    String videoLink = await videoRef.getDownloadURL();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoLink));

    if (_videoPlayerController != null) {
      await _videoPlayerController?.initialize();

      _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          looping: true,
          autoPlay: true,
          allowFullScreen: true,
          showControls: true,
          allowedScreenSleep: false,
          deviceOrientationsOnEnterFullScreen: [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ],
          deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
          controlsSafeAreaMinimum: const EdgeInsets.all(8));
    }

    setState(() {});

    // return chewieController!;
  }

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _getVideo();
    });

    _chewieController?.addListener(() {
      if (_chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          // DeviceOrientation.portraitDown,
        ]);
      }
    });

    // _videoPlayerController = VideoPlayerController.asset('assets/video/1.mp4');
    // _chewieController = ChewieController(
    //   allowedScreenSleep: false,
    //   allowFullScreen: true,
    //   deviceOrientationsAfterFullScreen: [
    //     // DeviceOrientation.landscapeRight,
    //     // DeviceOrientation.landscapeLeft,
    //     DeviceOrientation.portraitUp,
    //     // DeviceOrientation.portraitDown,
    //   ],
    //   videoPlayerController: _videoPlayerController,
    //   aspectRatio: _aspectRatio,
    //   autoInitialize: true,
    //   autoPlay: true,
    //   showControls: true,
    // );
    // _chewieController.addListener(() {
    //   if (_chewieController.isFullScreen) {
    //     SystemChrome.setPreferredOrientations([
    //       DeviceOrientation.landscapeRight,
    //       DeviceOrientation.landscapeLeft,
    //     ]);
    //   } else {
    //     SystemChrome.setPreferredOrientations([
    //       DeviceOrientation.portraitUp,
    //       // DeviceOrientation.portraitDown,
    //     ]);
    //   }
    // });
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController?.dispose();
    }
    if (_chewieController != null) {
      _chewieController!.dispose();
    }
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: _chewieController == null
              ? const Center(child: CupertinoActivityIndicator())
              : Chewie(
                  controller: _chewieController!,
                ),
        ),
      ),
    );
  }
}
