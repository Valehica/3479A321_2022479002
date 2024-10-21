import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:provider/provider.dart';
import 'package:laboratorio1_inicioflutter/provider/app_data.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    bool _hasAccessed = false;
    final appData = context.watch<AppData>();

    if (!_hasAccessed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        appData.addAction('Acceso a la pantalla de informacion sobre mi');
        _hasAccessed = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre mí'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Desarrollador: Valentina',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text(
              'Hola :)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
