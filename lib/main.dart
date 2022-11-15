import 'package:flutter/material.dart';
import 'package:calidad_aire/calidad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAEP',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calidad del Aire'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        //centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'calidadAire/calidad_aire/img/logo_size.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            /* Image.asset(
              'calidadAire/calidad_aire/img/logo_size.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))*/
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('calidadAire/calidad_aire/img/logo_size.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle_outlined),
                hintText: 'Escriba su nombre',
                labelText: 'Nombre *',
              ),
              onSaved: (String? Name) {
                debugPrint('Value saved as "$Name"');
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Ingrese datos validos'
                    : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.accessibility),
                hintText: 'Escriba su edad',
                labelText: 'Edad *',
              ),
              onSaved: (String? Edad) {
                debugPrint('Value saved as "$Edad"');
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Ingrese datos validos'
                    : null;
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => calidad()));
              },
              label: Text("Enviar"),
              icon: Icon(Icons.arrow_circle_right),
            ),
          ],
        ),
      ),
    );
  }
}
