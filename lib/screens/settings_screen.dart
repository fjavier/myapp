import 'package:flutter/material.dart';
import 'package:myapp/data/SPHelper.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getSettings();
  }

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
                  setState(() => _selectedImage = selected ?? 'Lake');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveSettings().then((value) {
            String message = value
                ? 'Configuración guardada correctamente'
                : 'Error al guardar la configuración';
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 3),
            ));
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<bool> saveSettings() async {
    final Sphelper helper = Sphelper();
    try {
      await helper.setSettings(txtName.text, _selectedImage);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future getSettings() async {
    final Sphelper helper = Sphelper();
    Future<Map<String, String>> futureSettings = helper.getSettings();
    futureSettings.then((settings) {
      var name = settings['name'];
      var image = settings['image'];
      print("nombre ${name}");
      txtName.text = name ?? '';
      _selectedImage = image == null || image.isEmpty ? 'Lake' : image;
      setState(() {});
    });
  }
}
