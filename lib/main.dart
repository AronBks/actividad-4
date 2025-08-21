import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/carrito_provider.dart';
import 'screens/productos_screen.dart';
import 'screens/historial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
      ],
      child: MaterialApp(
        title: 'Pedidos Online',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ProductosScreen(),
        routes: {
          '/historial': (context) => const HistorialScreen(),
        },
      ),
    );
  }
}
