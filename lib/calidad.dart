import 'package:flutter/material.dart';
import 'package:calidad_aire/services/Aire_service.dart';
import 'model/aire.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VistaDetalle extends StatefulWidget {
  @override
  State<VistaDetalle> createState() => _VistaDetalleState();
}

class _VistaDetalleState extends State<VistaDetalle> {
  final _formKey = GlobalKey<FormState>();

  AireService aireService = AireService();

  Aire aire = Aire();

  String currentWeather = "";

  double nivel = 0;

  String reco = "";

  @override
  void initState() {
    super.initState();
    AireService.setData(aire: aire);
  }

  void getAiredata() async {
    setState(() {
      //currentWeather = aire.condition;
      nivel = aire.nivel;
      reco = aire.recomendacion;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text('CAEP'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Recomendaciones'),
              Text('aqui van las recomedaciones con la integracion'),
              Text(currentWeather),
              Text(nivel.toString()),
              Text(reco.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
