import 'dart:developer';

import 'package:calidad_aire/calidad.dart';
import 'package:calidad_aire/model/aire.dart';
import 'package:calidad_aire/services/Aire_service.dart';
import 'package:calidad_aire/services/location_service.dart';
import 'package:calidad_aire/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  double _lat = 0.0, _long = 0.0;
  bool _isSettingLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Ttitulo'),
            const SizedBox(height: 10),
            Text(
              _lat == 0.0
                  ? 'Por favor define tu ubicación antes de continuar'
                  : 'Vas a ingresar con los siguientes datos: $_lat,$_long',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            _isSettingLocation
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSettingLocation = true;
                      });
                      LocationService.determinePosition().then((value) {
                        setState(() {
                          _isSettingLocation = false;
                          _lat = value.latitude;
                          _long = value.longitude;
                        });
                      });
                    },
                    child: Text("Definir ubicación"),
                  ),
            const SizedBox(height: 10),
            Visibility(
              visible: _lat != 0.0,
              replacement: const SizedBox(height: 10),
              child: Column(
                children: [
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
                    onChanged: ((value) {
                      setState(() {});
                    }),
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Ingrese datos validos'
                          : null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: _ageController.text.isEmpty
                          ? MaterialStateProperty.all(Colors.grey)
                          : MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      if (!_isSettingLocation &&
                          _ageController.text.isNotEmpty) {
                        //AireService.setData(aire: Aire());
                        AireService.setData(
                          data: [_ageController.text, '$_lat', '$_long'],
                        ).then((value) {
                          if (value != 'e') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VistaDetalle(response: value),
                              ),
                            );
                          }
                        });
                      } else
                        log("NO SE PUEDE");
                    },
                    label: Text("Enviar"),
                    icon: Icon(Icons.arrow_circle_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
