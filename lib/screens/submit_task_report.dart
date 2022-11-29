import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utility.dart';

class SubmitReport extends StatefulWidget {
  const SubmitReport({super.key});

  @override
  State<SubmitReport> createState() => _SubmitReportState();
}

class _SubmitReportState extends State<SubmitReport> {
  Uint8List? _savedImage;
  bool tookPictures = false;

  Future<void> _takePictures() async {
    Uint8List file = await pickImage(ImageSource.camera);
    setState(() {
      tookPictures = true;
      _savedImage = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          tookPictures == false
              ? GestureDetector(
                  onTap: _takePictures,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(color: Colors.green),
                          child: const Text('Click Me to take Pictures'),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 300,
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: Border.all(width: 1, color: Colors.blue),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: MemoryImage(_savedImage!),
                      )),
                ),

                TextButton(onPressed: (){}, child: Text('Submit') )
        ],
      ),
    );
  }
}
