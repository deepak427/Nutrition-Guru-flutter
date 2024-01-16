import 'dart:io';

import 'package:nutrition_guru/api/gpt_vision_api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nutrition_guru/components/ai_response_layout.dart';

class NutritionistAiPage extends StatefulWidget {
  const NutritionistAiPage({super.key});

  @override
  State<NutritionistAiPage> createState() => _NutritionistAiPageState();
}

class _NutritionistAiPageState extends State<NutritionistAiPage> {
  XFile? image;
  String nutritionistResponse = '';
  String buttonText = 'Upload Image';

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    if (img == null) return;

    setState(() {
      buttonText = 'Uploading';
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
      nutritionistResponse = await makeGptVisionApiRequest(imageUrl);
    } catch (error) {
      rethrow;
    }

    setState(() {
      image = img;
      buttonText = 'Update Image';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Nutritionist AI"),
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
                  "Upload an image of the nutrition label of any product, and the nutritionist AI will give health insights about that product.",
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),

                //Logo

                Lottie.asset(
                  'assests/camera_animation.json',
                  width: 100,
                ),

                const SizedBox(height: 15),

                //Image upload button

                ElevatedButton(
                  onPressed: () {
                    myAlert();
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
                  visible: image != null,
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
