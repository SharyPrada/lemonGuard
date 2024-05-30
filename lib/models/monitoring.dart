class TreeData {
  final String fecha;
  final String identificador;
  final String estado;
  final String prediccion;
  final int precision;
  final String tratamiento;

  TreeData({
    required this.fecha,
    required this.identificador,
    required this.estado,
    required this.prediccion,
    required this.precision,
    required this.tratamiento,
  });

  factory TreeData.fromJson(Map<String, dynamic> json) {
    return TreeData(
      fecha: json['fecha'],
      identificador: json['identificador'],
      estado: json['estado'],
      prediccion: json['prediccion'],
      precision: json['precision'],
      tratamiento: json['tratamiento'],
    );
  }
}
