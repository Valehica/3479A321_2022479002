import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasPage extends StatefulWidget {
  @override
  _PreferenciasPageState createState() => _PreferenciasPageState();
}

class _PreferenciasPageState extends State<PreferenciasPage> {
  String _userName = '';
  int _counter = 0;

  // Método para cargar las preferencias
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? ''; // Cargar nombre de usuario
      _counter = prefs.getInt('counter') ?? 0; // Cargar valor del contador
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Cargar las preferencias al iniciar la pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre de Usuario'),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
                _savePreferences(); // Guardar el nuevo nombre de usuario
              },
              controller: TextEditingController(text: _userName),
            ),
            SizedBox(height: 20),
            Text('Valor del contador: $_counter'),
            Slider(
              value: _counter.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: _counter.toString(),
              onChanged: (double value) {
                setState(() {
                  _counter = value
                      .toInt(); // Cambiar el valor del contador con el Slider
                });
                _savePreferences(); // Guardar el nuevo valor del contador
              },
            ),
          ],
        ),
      ),
    );
  }

  // Método para guardar las preferencias
  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', _userName); // Guardar nombre de usuario
    prefs.setInt('counter', _counter); // Guardar valor del contador
  }
}
