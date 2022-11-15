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
      title: 'Calidad del Aire',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
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
                icon: Icon(Icons.person),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => calidad()));
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
