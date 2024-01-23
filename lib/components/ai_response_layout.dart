import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutrition_guru/api/gpt_tts_1.dart';

class AiResponseLayout extends StatefulWidget {
  final XFile? img;
  final String aiResponse;
  final String aiHeader;

  const AiResponseLayout(
      {Key? key, this.img, required this.aiResponse, required this.aiHeader})
      : super(key: key);

  @override
  State<AiResponseLayout> createState() => _AiResponseLayoutState();
}

class _AiResponseLayoutState extends State<AiResponseLayout> {
  String audioUrl = '';
  int audioStatus = -1;
  AudioPlayer audioPlayer = AudioPlayer();

  Future getAudio(String text) async {
    setState(() {
      audioStatus = 0;
    });

    String base64Audio = await makeGptTtsApiRequest(text);
    Uint8List audioData = base64.decode(base64Audio);
    //generate a unique name
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //create reference of audio
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirAudio = referenceRoot.child('temp');

    Reference referenceAudioToUpload =
        referenceDirAudio.child('$uniqueFileName' '.mp3');

    try {
      //store the audio
      await referenceAudioToUpload.putData(audioData);
      audioUrl = await referenceAudioToUpload.getDownloadURL();
    } catch (error) {
      rethrow;
    }

    setState(() {
      audioStatus = 1;
      audioPlayer.play(UrlSource(audioUrl));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // AspectRatio widget with a fixed aspect ratio
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: widget.img != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.file(
                        File(widget.img!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(), // Or SizedBox()
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: Text(
              widget.aiHeader,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // Replace 'your_audio_url.mp3' with the actual download URL of your audio file
              if (audioUrl != '') {
                if (audioStatus == 1) {
                  setState(() {
                    audioPlayer.pause();
                    audioStatus = -1;
                  });
                } else {
                  setState(() {
                    audioPlayer.play(UrlSource(audioUrl));
                    audioStatus = 1;
                  });
                }
              } else {
                getAudio(widget.aiResponse);
              }
            },
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Icon(audioStatus == -1
                      ? Icons.play_circle_fill
                      : audioStatus == 0
                          ? Icons.api_rounded
                          : Icons.pause_circle),
                ),
                if (audioStatus == 0)
                  Text(
                    'Loading',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Product name
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              widget.aiResponse,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Release resources in the dispose method
    audioPlayer.dispose();
    super.dispose();
  }
}
