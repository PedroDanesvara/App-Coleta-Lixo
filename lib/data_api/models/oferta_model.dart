class OfertaModel {
  final int id_oferta;
  final String tipo_material;
  final String estado;
  final double peso;
  final double valor;
  final int id_produtor;
  final String gps_coord;

  OfertaModel({
    required this.id_oferta,
    required this.tipo_material,
    required this.estado,
    required this.peso,
    required this.valor,
    required this.id_produtor,
    required this.gps_coord,
  });

  factory OfertaModel.fromMap(Map<String, dynamic> map) {
    return OfertaModel(
      id_oferta: map['id'],
      tipo_material: map['tipo_material'],
      estado: map['estado'],
      peso: map['peso'] * 1.0,
      valor: double.parse(map['valor']),
      id_produtor: map['produtor'],
      gps_coord: map['gps_coord'],
    );
  }
}