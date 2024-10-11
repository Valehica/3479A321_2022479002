import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:laboratorio1_inicioflutter/provider/app_data.dart';

class AuditoriaPage extends StatelessWidget {
  const AuditoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = context.watch<AppData>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView.builder(
        itemCount: appData.actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(appData.actions[index]),
          );
        },
      ),
    );
  }
}
