import 'package:flutter/material.dart';
import '../services/pocketbase_service.dart';

class PedidosScreen extends StatefulWidget {
  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  final PocketBaseService _service = PocketBaseService();
  late Future<List<dynamic>> _pedidosFuture;

  @override
  void initState() {
    super.initState();
    _pedidosFuture = _service.getPedidos(''); // Puedes pasar el userId si lo tienes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedidos')),
      body: FutureBuilder<List<dynamic>>(
        future: _pedidosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay pedidos disponibles'));
          }
          final pedidos = snapshot.data!;
          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              return ListTile(
                title: Text('Pedido #${pedido['id']}'),
                subtitle: Text('Estado: ${pedido['estado']}'),
                trailing: Text(pedido['fecha'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
