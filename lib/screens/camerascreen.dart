import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  final Widget nextScreen;

  const CameraScreen({super.key, required this.nextScreen});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  bool isRecording = false;
  bool showResult = false; // Flag to control result display
  int accuracy = 0;
  String rating = '';
  late VideoPlayerController _videoController;
  int selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      selectedCameraIndex = 0; // Start with the back camera
      cameraController =
          CameraController(cameras[selectedCameraIndex], ResolutionPreset.high);
      await cameraController!.initialize().catchError((e) {
        print('Error initializing camera: $e');
      });
      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    _videoController.dispose(); // Dispose of the video controller
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      cameraController!.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initializeCamera();
    }
  }

  Future<void> _recordAndShowResult() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    try {
      setState(() {
        isRecording = true;
      });

      // Start recording
      await cameraController!.startVideoRecording();

      // Stop recording after 5 seconds
      await Future.delayed(Duration(seconds: 5));
      await cameraController!.stopVideoRecording();

      if (mounted) {
        setState(() {
          isRecording = false;
          showResult = true;
          accuracy = _generateRandomAccuracy();
          rating = _getRating(accuracy);
        });

        // Select the video based on the accuracy
        String videoPath = _selectVideo(accuracy);

        // Initialize and play the selected video
        _videoController = VideoPlayerController.asset(videoPath)
          ..initialize().then((_) {
            setState(() {});
            _videoController.play();
          });
        _videoController.setLooping(true);
      }
    } catch (e) {
      print('Error recording video: $e');
      if (mounted) {
        setState(() {
          isRecording = false;
        });
      }
    }
  }

  int _generateRandomAccuracy() {
    int value = Random().nextInt(101);
    if (value < 50) {
      value = Random().nextInt(51) + 50;
    }
    return value;
  }

  String _getRating(int accuracy) {
    if (accuracy >= 50 && accuracy < 70) {
      return 'Keep it up!';
    } else if (accuracy >= 70 && accuracy < 85) {
      return 'Good Work!';
    } else if (accuracy >= 85) {
      return 'Excellent!';
    } else {
      return 'Try Again!';
    }
  }

  String _selectVideo(int accuracy) {
    if (accuracy >= 50 && accuracy < 70) {
      return 'assets/output/keepitup.mp4';
    } else if (accuracy >= 70 && accuracy < 85) {
      return 'assets/output/good.mp4';
    } else if (accuracy >= 85) {
      return 'assets/output/excellent.mp4';
    } else {
      return 'assets/output/bad.mp4';
    }
  }

  void _switchCamera() async {
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
    if (cameraController != null) {
      await cameraController!.dispose();
    }
    cameraController =
        CameraController(cameras[selectedCameraIndex], ResolutionPreset.high);
    await cameraController!.initialize();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Camera Initialization'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (showResult) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Congratulations!!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    '$accuracy%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    rating,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_videoController.value.isInitialized)
              Center(
                child: Container(
                  width: 250,
                  height: 250,
                  child: AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                ),
              ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              CameraScreen(nextScreen: widget.nextScreen),
                        ),
                      );
                    },
                    child: Text(
                      "Retry",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => widget.nextScreen,
                        ),
                      );
                    },
                    child: Text(
                      "Next Screen",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Recording Sign'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 500,
              child: CameraPreview(cameraController!),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: isRecording ? null : _recordAndShowResult,
                child: Icon(isRecording ? Icons.stop : Icons.videocam),
                backgroundColor: Colors.green,
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                onPressed: _switchCamera,
                child: Icon(Icons.cameraswitch),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
