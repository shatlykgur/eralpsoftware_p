import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  File _image;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "$position.altitude, $position.longitude";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundColor: Colors.orange,
              ),
            ),
            Icon(Icons.camera),
            RaisedButton(
              child: Text('Profil fotoğrafı yükle'),
              onPressed: getImage,
            ),
            Icon(Icons.location_on),
            Text(locationMessage),
            RaisedButton(
              child: Text('Konumumu al'),
              onPressed: () {
                getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
