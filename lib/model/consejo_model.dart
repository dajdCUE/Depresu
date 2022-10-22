class ConsejoModel{
  
  
  final String Nombre;
  final String Texto;

  ConsejoModel({required this.Nombre, required this.Texto});

  factory ConsejoModel.fromMap(Map<String, dynamic> json) => new ConsejoModel(
    
    Nombre: json['Nombre'],
    Texto: json['Texto']
  );
}