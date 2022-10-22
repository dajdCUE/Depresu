class FrasesModel{
  
  
  final String Frase;
  final String Autor;

  FrasesModel({required this.Frase, required this.Autor});

  factory FrasesModel.fromMap(Map<String, dynamic> json) => new FrasesModel(
    
    Frase: json['Frase'],
    Autor: json['Autor']
  );
}