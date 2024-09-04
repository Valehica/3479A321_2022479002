import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String iconRuta = 'assets/icon/vaca.svg';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _reduceCounter() {
    setState(() {
      _counter--;
    });
  }

  void _zeroCounter() {
    setState(() {
      _counter = 0;
    });
  }

  Widget _widgetBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: _reduceCounter,
          tooltip: 'Restar',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Incrementar',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _zeroCounter,
          tooltip: 'Zero',
          child: const Icon(Icons.exposure_zero),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              iconRuta,
              width: 100.0,
              height: 100.0,
            ),
            const Text(
              'Tu contador esta en:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        _widgetBotones(),
      ],
    );
  }
}
