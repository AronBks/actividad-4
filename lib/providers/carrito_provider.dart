import 'package:flutter/material.dart';
import '../models/producto.dart';

class CarritoProvider with ChangeNotifier {
  final List<Producto> _items = [];
  final Map<String, int> cantidades = {};

  List<Producto> get items => _items;

  void agregarProducto(Producto producto) {
    if (!_items.any((p) => p.id == producto.id)) {
      _items.add(producto);
      cantidades[producto.id] = 1;
    } else {
      cantidades[producto.id] = (cantidades[producto.id] ?? 1) + 1;
    }
    notifyListeners();
  }

  void eliminarProducto(Producto producto) {
    _items.removeWhere((p) => p.id == producto.id);
    cantidades.remove(producto.id);
    notifyListeners();
  }

  void limpiarCarrito() {
    _items.clear();
    cantidades.clear();
    notifyListeners();
  }

  void sumarCantidad(Producto producto) {
    if (_items.any((p) => p.id == producto.id)) {
      cantidades[producto.id] = (cantidades[producto.id] ?? 1) + 1;
      notifyListeners();
    }
  }

  void restarCantidad(Producto producto) {
    if (_items.any((p) => p.id == producto.id) && (cantidades[producto.id] ?? 1) > 1) {
      cantidades[producto.id] = (cantidades[producto.id] ?? 1) - 1;
      notifyListeners();
    }
  }
}
