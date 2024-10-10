import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';

class AuditoriaPage extends StatelessWidget {
  const AuditoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('items'),
          );
        },
      ),
    );
  }
}
