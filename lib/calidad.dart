import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:caep_1/services/Aire_service.dart';
import 'model/aire.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:caep_1/widgets/custom_app_bar.dart';

class VistaDetalle extends StatefulWidget {
  const VistaDetalle({
    Key? key,
    required this.response,
  }) : super(key: key);

  final String response;
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
    log(widget.response);
    super.initState();
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
      appBar: const CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/img/fondo.png'),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
        )),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Recomendaciones',
                style: TextStyle(),
              ),
              Text(widget.response),
            ],
          ),
        ),
      ),
    );
  }
}
