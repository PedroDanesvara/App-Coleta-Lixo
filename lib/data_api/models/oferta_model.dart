class OfertaModel {
  final String tipo_material;
  final String estado;
  final double peso;
  final double valor;
  final int produtor;
  final String gps_coord;

  OfertaModel({
    required this.tipo_material,
    required this.estado,
    required this.peso,
    required this.valor,
    required this.produtor,
    required this.gps_coord,
  });

  factory OfertaModel.fromMap(Map<String, dynamic> mapped) {
    return OfertaModel(
      tipo_material: mapped['tipo_material'],
      estado: mapped['estado'],
      peso: mapped['peso'] * 1.0,
      valor: mapped['valor'] * 1.0,
      produtor: mapped['produtor'],
      gps_coord: mapped['gps_coord'],
    );
  }
}