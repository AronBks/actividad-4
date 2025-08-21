class Pedido {
  final String id;
  final List<Map<String, dynamic>> productos;
  final int cantidad;
  final String estado;
  final DateTime fecha;

  Pedido({
    required this.id,
    required this.productos,
    required this.cantidad,
    required this.estado,
    required this.fecha,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      productos: List<Map<String, dynamic>>.from(json['productos']),
      cantidad: json['cantidad'],
      estado: json['estado'],
      fecha: DateTime.parse(json['fecha']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productos': productos,
        'cantidad': cantidad,
        'estado': estado,
        'fecha': fecha.toIso8601String(),
      };
}
