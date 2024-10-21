import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'package:laboratorio1_inicioflutter/provider/app_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _hasAccessed = false;
    final appData = context.watch<AppData>();

    if (!_hasAccessed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        appData.addAction('Acceso a la pantalla de detalles');
        _hasAccessed = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'El contador actual es: ${appData.counter}',
          style: const TextStyle(fontSize: 24),
        ),
      ])),
    );
  }
}
