import 'dart:developer';

import 'package:calidad_aire/calidad.dart';
import 'package:calidad_aire/model/aire.dart';
import 'package:calidad_aire/services/Aire_service.dart';
import 'package:calidad_aire/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
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
              controller: _ageController,
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
                log('EL nombre es ${_nameController.text} y la edad ${_ageController.text}');
                //AireService.setData(aire: Aire());
                AireService.setData(
                    data: [_ageController.text, '6.2476', '75.5658']);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VistaDetalle(),
                  ),
                );
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
