import 'package:flutter/material.dart';
import '../services/pocketbase_service.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PocketBaseService service = PocketBaseService();
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Pedidos')),
      body: FutureBuilder<List<dynamic>>(
        future: service.getPedidos(''), // Si tienes userId, pásalo aquí
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay pedidos realizados'));
          }
          final pedidos = snapshot.data!;
          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text('Pedido #${pedido['id']}'),
                  subtitle: Text('Estado: ${pedido['estado']}'),
                  trailing: Text(pedido['fecha'].toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
