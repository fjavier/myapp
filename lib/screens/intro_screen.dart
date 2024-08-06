import 'package:flutter/material.dart';
import 'package:myapp/screens/settings_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(child: Image.asset("assets/Sea.jpg", fit: BoxFit.cover)),
      const Align(
          alignment: Alignment(0, -0.5),
          child: Text(
            "Welcome",
            style: TextStyle(fontSize: 30, color: Colors.white, shadows: [
              Shadow(color: Colors.black, blurRadius: 10, offset: Offset(5, 5))
            ]),
          )),
      Align(
        alignment: const Alignment(0, 0.5),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SettingsScreen()));
            },
            child: const Text("Get Started")),
      )
    ]));
  }
}
