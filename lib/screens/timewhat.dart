import 'package:flutter/material.dart';
import 'package:sign_vision/screens/camerascreen.dart';
import 'package:sign_vision/screens/whatsup.dart';
import 'package:video_player/video_player.dart';

class Timewhat extends StatefulWidget {
  const Timewhat({super.key});

  @override
  _TimewhatState createState() => _TimewhatState();
}

class _TimewhatState extends State<Timewhat> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/cphrases/timewhat.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(114, 204, 253, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close, size: 28)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              Text(
                'Level-3: Common Phrases',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Sign for "What time is it?"',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: Colors.grey, width: 2.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: _controller.value.isInitialized
                                ? SizedBox(
                                    height: 250, // Adjust the height as needed
                                    child: AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    ),
                                  )
                                : Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CameraScreen(nextScreen: Whatsup())));
                  },
                  child: Text(
                    "Practice",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(114, 204, 253, 1),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
