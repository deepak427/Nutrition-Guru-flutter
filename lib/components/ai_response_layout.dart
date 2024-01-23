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
  int audioStatus = 0;

  Future getAudio(String text) async {
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
      String audioUrl = await referenceAudioToUpload.getDownloadURL();
    } catch (error) {
      rethrow;
    }
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
              getAudio(widget.aiResponse);

              // Create an instance of the AudioPlayer
              AudioPlayer audioPlayer = AudioPlayer();

              // Play the audio
              // audioPlayer.play(UrlSource(audioUrl));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Icon( Icons.play_circle_fill),
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
}
