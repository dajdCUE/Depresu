class TestModel{
  final int? id;
  final String tipo;
  final String pregunta;

  TestModel({this.id,required this.tipo,required this.pregunta});

  factory TestModel.fromMap(Map<String, dynamic> json) => new TestModel(
    id: json['Id'],
    tipo: json['tipo'],
    pregunta: json['pregunta']
  );
}