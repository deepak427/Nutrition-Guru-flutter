import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nutrition_guru/components/ai_response_layout.dart';

class AiPage extends StatefulWidget {
  final Future<String> Function(String, String) apiCall;
  final String instructions;
  final String systemMessage;
  final String cameraPath;
  final String header;
  const AiPage(
      {super.key,
      required this.apiCall,
      required this.instructions,
      required this.systemMessage,
      required this.cameraPath,
      required this.header});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  XFile? image;
  String nutritionistResponse = '';
  String buttonText = 'Upload Image';
  bool loading = false;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    if (img == null) return;

    setState(() {
      buttonText = 'Uploading';
      loading = !loading;
    });

    //generate a unique name
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //create reference of image
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('temp');

    Reference referenceImageToUpload =
        referenceDirImages.child('$uniqueFileName' '.jpeg');

    try {
      //store the image
      await referenceImageToUpload.putFile(File(img.path));
      String imageUrl = await referenceImageToUpload.getDownloadURL();
      nutritionistResponse =
          await widget.apiCall(imageUrl, widget.systemMessage);
    } catch (error) {
      rethrow;
    }

    setState(() {
      image = img;
      buttonText = 'Update Image';
      loading = !loading;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        Text(
                          'From Camera',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.header),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                //Title
                Text(
                  widget.instructions,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),

                //Logo

                Lottie.asset(
                  widget.cameraPath,
                  width: 130,
                ),

                //Image upload button

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/dummy");
                    // myAlert();
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),

                //Description

                Visibility(
                  visible: loading,
                  child: Lottie.asset(
                    'assests/loading.json',
                    width: 500,
                  ),
                ),

                Visibility(
                  visible: !loading && image != null,
                  child: AiResponseLayout(
                    img: image,
                    aiResponse: nutritionistResponse,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
