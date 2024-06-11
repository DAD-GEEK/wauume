class MascotaModel {
  dynamic photo;
  dynamic carnetVacunacion;
  String nombre;
  List<String> categoria = <String>["Perro", "Gato", "Ave", "Roedor", "Reptil", "Pez"];
  List<String> tamano = <String>["Pequeño", "Mediano", "Grande"];
  int edad;
  String raza;

  MascotaModel(
      {required this.photo,
      required this.carnetVacunacion,
      required this.nombre,
      required this.edad,
      required this.raza});

  Map<String, dynamic> toMap() {
    return {
      'photo': photo,
      'carnetVacunacion': carnetVacunacion,
      'nombre': nombre,
      'categoria': categoria,
      'tamano': tamano,
      'edad': edad,
      'raza': raza
    };
  }


}
