# Pedidos Online

Aplicación móvil híbrida en Flutter para la gestión de pedidos online, con backend PocketBase.

## Características
- Visualización y gestión de productos (CRUD)
- Carrito de compras con cantidades y stock
- Realización y gestión de pedidos
- Descuento automático de stock al comprar
- Historial de pedidos
- UI moderna y responsiva
- Compatible con Android e iOS

## Instalación
1. Clona el repositorio:
   ```sh
   git clone https://github.com/AronBks/actividad-4.git
   cd actividad-4
   ```
2. Instala dependencias:
   ```sh
   flutter pub get
   ```
3. Configura PocketBase:
   - Descarga y ejecuta PocketBase: https://pocketbase.io/docs/
   - Crea las colecciones `productos` y `pedidos` con los siguientes campos:
     - **productos**: nombre (text), descripcion (text), precio (number), stock (number)
     - **pedidos**: productos (relation, multiple, a productos), estado (text), fecha (date)
   - Permite acceso público o configura autenticación según tu necesidad.
   - Si usas emulador Android, usa la URL `http://10.0.2.2:8090` en el servicio.

## Uso
1. Ejecuta la app:
   ```sh
   flutter run
   ```
2. Agrega productos desde la app o PocketBase.
3. Añade productos al carrito, ajusta cantidades y realiza pedidos.
4. El stock se descuenta automáticamente.
5. Consulta el historial de pedidos desde la app.

## Estructura del proyecto
- `lib/models/`: Modelos de datos (Producto, Pedido)
- `lib/services/`: Servicio de conexión a PocketBase
- `lib/providers/`: Provider para el carrito
- `lib/screens/`: Pantallas principales (productos, carrito, historial)
- `README.md`: Documentación y guía de uso

## Dependencias principales
- [Flutter](https://flutter.dev/)
- [Provider](https://pub.dev/packages/provider)
- [http](https://pub.dev/packages/http)

## Ejemplo de configuración PocketBase
```json
// productos
{
  "nombre": "Pizza",
  "descripcion": "pizaa grande de peperoni",
  "precio": 2450.0,
  "stock": 10
}
// pedidos
{
  "productos": ["id_producto1", "id_producto2"],
  "estado": "pendiente",
  "fecha": "2025-08-21T13:37:00Z"
}
```

## Capturas de pantalla

| Catálogo de Productos | Carrito de Compras |
|----------------------|--------------------|
| ![catalogo](screenshots/catalogo.png) | ![carrito](screenshots/carrito.png) |

> Puedes agregar más imágenes en la carpeta `screenshots/` para mostrar otras funciones de la app.

## Notas
- El botón de recarga actualiza el stock y la lista de productos.
- El stock se descuenta automáticamente al realizar un pedido.
- Si usas autenticación, adapta el código para enviar el userId en los pedidos.
- Para dudas o mejoras, abre un issue en el repositorio.

---
**Autor:** Aron
