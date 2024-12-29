import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputPage extends StatefulWidget {
  final String role;

  InputPage({required this.role});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final Map<String, List<String>> roleSpecificFields = {
    "QP Bank Maker": ["Subject Name"],
    "Logistics": ["Destination"],
  };

  File? _image;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final commonFields = [
      "Name",
      "Aadhar Number",
      "Phone Number",
      "PAN Number",
      "Voter ID Number",
      "Address"
    ];
    final dynamicFields = roleSpecificFields[widget.role] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("Input Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Role: ${widget.role}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            for (var field in commonFields + dynamicFields)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: field,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Take Picture"),
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.file(
                  _image!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}