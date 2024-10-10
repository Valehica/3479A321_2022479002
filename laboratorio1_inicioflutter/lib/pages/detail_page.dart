import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Pagina de detalles',
          style: TextStyle(fontSize: 24),
        ),
      ])),
    );
  }
}
