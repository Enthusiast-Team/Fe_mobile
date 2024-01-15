import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Vision extends StatefulWidget {
  @override
  _VisionState createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  String base64Image = '';
  String backendResponse = '';

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Convert image to base64
      List<int> imageBytes = await pickedFile.readAsBytes();
      String imageBase64 = base64Encode(Uint8List.fromList(imageBytes));

      setState(() {
        base64Image = imageBase64;
      });
      print('Base64 Image: $base64Image');
    }
  }

  Future<void> _sendImageToServer() async {
    try {
      if (base64Image.isNotEmpty) {
        // Kirim gambar ke server
        var response = await http.post(
          Uri.parse('http://4.145.90.55:8000/predict'),
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode({'message': base64Image}),
        );

        print(response);
        var data = json.decode(response.body);
        setState(() {
          backendResponse = data['nama'];
          // Ubah variabel predictedprobability sesuai kebutuhan, karena tidak didefinisikan sebelumnya
          // predictedprobability = data['probability'];
        });
      } else {
        print('Pilih gambar terlebih dahulu');
      }
    } catch (error) {
      print('Gagal terkirim: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deteksi Artefak'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            base64Image.isNotEmpty
                ? Image.memory(
                    Uint8List.fromList(base64.decode(base64Image)),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Pilih Gambar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendImageToServer,
              child: Text('Submit'),
            ),
            SizedBox(height: 10),
            Text('Hasil Deteksi: $backendResponse'),
          ],
        ),
      ),
    );
  }
}
