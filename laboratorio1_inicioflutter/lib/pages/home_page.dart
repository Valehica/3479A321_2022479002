import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboratorio1_inicioflutter/pages/about_page.dart';
import 'package:laboratorio1_inicioflutter/pages/auditoria_page.dart';
import 'package:laboratorio1_inicioflutter/pages/detail_page.dart';
import 'package:provider/provider.dart';
import 'package:laboratorio1_inicioflutter/provider/app_data.dart';
import 'package:laboratorio1_inicioflutter/pages/preferencias_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasAccessed = false;

  String iconVaca = 'assets/icon/vaca.svg';
  String iconGanar = 'assets/icon/ganar_icon.svg';
  String iconPerder = 'assets/icon/perder_icon.svg';
  String iconReset = 'assets/icon/reset_icon.svg';

  String _userName = '';
  int _counter = 0;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
      print('Counter value $_counter is loaded');
      print('Username value $_userName is loaded');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  String _descubrirIcono(int counter) {
    String icon;

    if (counter == 5) {
      icon = iconPerder;
    } else if (counter == 10) {
      icon = iconGanar;
    } else {
      icon = iconVaca;
    }

    return icon;
  }

  String _mostrarMensaje(int counter) {
    if (counter == 5) {
      return 'PERDISTE!';
    } else if (counter == 10) {
      return 'GANASTE!';
    } else {
      return 'Tu contador esta en:';
    }
  }

  double _tamanoLetra(int counter) {
    if (counter == 5) {
      return 24;
    } else if (counter == 10) {
      return 24;
    } else {
      return 18;
    }
  }

  void incrementCounter() {
    _counter++;
  }

  void reduceCounter() {
    _counter--;
  }

  void zeroCounter() {
    _counter = 0;
  }

  Widget _widgetBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: reduceCounter,
          tooltip: 'Restar',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: incrementCounter,
          tooltip: 'Incrementar',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: zeroCounter,
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
    final appData = context.watch<AppData>();
    if (!_hasAccessed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        appData.addAction('Acceso a la pantalla principal');
        _hasAccessed = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 171, 40),
              ),
              child: const Text(
                'Menu de navegacion',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Detalles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Preferencias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreferenciasPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Sobre mi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Auditoria'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AuditoriaPage()),
                );
              },
            ),
          ],
        ),
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
              const SizedBox(height: 20),
              Text(
                'BIENVENIDO $_userName}',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    _descubrirIcono(_counter),
                    width: 50.0,
                    height: 50.0,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //contador
              Text(
                _mostrarMensaje(_counter),
                style: TextStyle(fontSize: _tamanoLetra(_counter)),
              ),
              const SizedBox(height: 10),
              Text(
                '${_counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),

              //botones que controlan el contador
              _widgetBotones(),

              const SizedBox(height: 20),

              // Botón para ir a la página de detalles
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailPage()));
                },
                child: const Text('Ir a Detail'),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', _userName); // Guardar nombre de usuario
    prefs.setInt('counter', _counter); // Guardar valor del contador
  }
}
