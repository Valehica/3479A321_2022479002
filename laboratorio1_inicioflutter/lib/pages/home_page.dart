import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'about_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String iconVaca = 'assets/icon/vaca.svg';
  String iconGanar = 'assets/icon/ganar_icon.svg';
  String iconPerder = 'assets/icon/perder_icon.svg';
  String iconReset = 'assets/icon/reset_icon.svg';

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

  String _descubrirIcono() {
    String icon;

    if (_counter == 5) {
      icon = iconPerder;
    } else if (_counter == 10) {
      icon = iconGanar;
    } else {
      icon = iconVaca;
    }

    return icon;
  }

  String _mostrarMensaje() {
    if (_counter == 5) {
      return 'PERDISTE!';
    } else if (_counter == 10) {
      return 'GANASTE!';
    } else {
      return 'Tu contador esta en:';
    }
  }

  double _tamanoLetra() {
    if (_counter == 5) {
      return 24;
    } else if (_counter == 10) {
      return 24;
    } else {
      return 18;
    }
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
          tooltip: 'Resetear',
          child: SvgPicture.asset(
            iconReset,
            width: 25.0,
            height: 25.0,
          ),
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
        //creacion de la card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15.0), // para hacer bordes redondeados
          ),
          elevation: 5, //para hacer la sombra
          margin: const EdgeInsets.all(20), //el margen fuera de la card
          child: Padding(
            padding: const EdgeInsets.all(15.0), //espacio de dentro de la card
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              //desde aca se escribe para dentro de card

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    _descubrirIcono(),
                    width: 50.0,
                    height: 50.0,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //contador
              Text(
                _mostrarMensaje(),
                style: TextStyle(fontSize: _tamanoLetra()),
              ),
              const SizedBox(height: 10),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),

              //botones que controlan el contador
              _widgetBotones(),

              const SizedBox(height: 20),

              // Botón para ir a la página de detalles
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                  );
                },
                child: const Text('Ir a Detail'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
