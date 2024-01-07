import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Vision extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<Vision> {
  String inputValue = '';
  String predictedImageName = '';
  String predictedprobability = '';
  String uploadedImage = '';
  final TextEditingController inputController = TextEditingController();

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      handleInputChange(imageFile);
    }
  }

  void handleInputChange(File image) async {
    String base64String = base64Encode(image.readAsBytesSync());
    setState(() {
      uploadedImage = base64String;
      inputValue = base64String;
      print('Gambar dalam format base64: $base64String');
    });
  }

  void submit() async {
    try {
      var response = await http.post(
        Uri.parse('http://localhost:5000/predict'),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode({'message': inputValue}),
      );
      print(response);
      var data = json.decode(response.body);
      setState(() {
        predictedImageName = data['nama'];
        predictedprobability = data['probability'];
      });
    } catch (error) {
      print('Gagal terkirim: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tampilkan gambar yang diunggah atau gambar default
            Image.memory(base64Decode(uploadedImage)),
            ElevatedButton(
              onPressed: () async {
                pickImage(ImageSource.gallery); // Memilih gambar dari galeri
              },
              child: Text('Pilih Gambar'),
            ),
            ElevatedButton(
              onPressed: submit,
              child: Text('Submit'),
            ),
            // Tampilkan nama gambar hasil prediksi
            if (predictedImageName != '')
              Text(
                'Artefak: $predictedImageName',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),if (predictedprobability != '')
              Text(
                'probability : $predictedprobability',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
