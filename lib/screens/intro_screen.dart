import 'package:flutter/material.dart';
import 'package:myapp/data/SPHelper.dart';
import 'package:myapp/screens/settings_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String _userName = '';
  String _imageSelected = 'Sea';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    print("Imagen seleccionada $_imageSelected");
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Image.asset("assets/$_imageSelected.jpg", fit: BoxFit.cover)),
      Align(
          alignment: const Alignment(0, -0.5),
          child: Text(
            "Welcome $_userName",
            style: const TextStyle(fontSize: 30, color: Colors.white, shadows: [
              Shadow(color: Colors.black, blurRadius: 10, offset: Offset(5, 5))
            ]),
          )),
      Align(
        alignment: const Alignment(0, 0.5),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const SettingsScreen()));
            },
            child: const Text("Get Started")),
      )
    ]));
  }

  void getSettings() async {
    Sphelper helper = Sphelper();
    helper.getSettings().then((setting) {
      print("cargando configuraciones...");
      var image = setting['image'];
      _userName = setting['name'] ?? '';
      _imageSelected = image == null || image.isEmpty ? 'Sea' : image;
      setState(() {});
    });
  }
}
