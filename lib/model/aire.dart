class Aire {
  final double nivel;
  final String recomendacion;

  Aire({
    this.nivel = 0,
    this.recomendacion = "ligero",
  });

  factory Aire.fromJson(Map<String, dynamic> json) {
    return Aire(
      nivel: json['current']['nivel'],
      recomendacion: json['current']['recomendacion']['text'],
    );
  }
}
