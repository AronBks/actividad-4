import 'dart:convert';
import 'package:http/http.dart' as http;

class PocketBaseService {
  Future<void> crearProducto(Map<String, dynamic> producto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/productos/records'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(producto),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear producto');
    }
  }

  Future<void> actualizarProducto(String id, Map<String, dynamic> producto) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/productos/records/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(producto),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar producto');
    }
  }

  Future<void> eliminarProducto(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/productos/records/$id'),
    );
    if (response.statusCode != 204) {
      throw Exception('Error al eliminar producto');
    }
  }
  // Para acceder a localhost desde el emulador Android, usa 10.0.2.2
  final String baseUrl = 'http://10.0.2.2:8090/api/collections';

  Future<List<dynamic>> getProductos() async {
    final response = await http.get(Uri.parse('$baseUrl/productos/records'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['items'];
    }
    throw Exception('Error al cargar productos');
  }

  Future<List<dynamic>> getPedidos(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/pedidos/records?filter=(usuario="$userId")'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['items'];
    }
    throw Exception('Error al cargar pedidos');
  }

  Future<void> crearPedido(Map<String, dynamic> pedido) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pedidos/records'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(pedido),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al crear pedido');
    }
  }

  // CRUD para productos y pedidos...
}
