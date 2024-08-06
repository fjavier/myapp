import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final TextEditingController txtName = TextEditingController();
  String _selectedImage = 'Lake';
  final List<String> _images = ['Lake', 'Country', 'Mountain', 'Sea'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller:
                  txtName, // Assign the txtName controller to this field.
              decoration: const InputDecoration(hintText: "Nombre"),
            ),
            DropdownButton(
                value: _selectedImage,
                items: _images
                    .map((String imageName) => DropdownMenuItem(
                          value: imageName,
                          child: Text(imageName),
                        ))
                    .toList(),
                onChanged: (selected) {
                  print("Objeto seleccionado ${selected}");
                  setState(() => _selectedImage = selected ?? 'Lake'
                  );
                }),
            ElevatedButton(
              onPressed: () {
                print(txtName.text);
              },
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
