import 'package:flutter/material.dart';

void main() => runApp(const App_carros());

class App_carros extends StatelessWidget {
  const App_carros({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tienda de carros",
      home: refacciones(),
    );
  }
} // Fin clase app tienda de carros

class refacciones extends StatelessWidget {
  const refacciones({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. DEFINIMOS LOS DATOS (Faltaba esto para que funcione el ListView)
    final List<Map<String, dynamic>> items = [
      {
        "titulo": "Motor V8",
        "subtitulo": "Alta Potencia",
        "icono": Icons.settings,
        "color": Colors.blueAccent,
      },
      {
        "titulo": "Diferencial",
        "subtitulo": "Marca finix",
        "icono": Icons.car_repair,
        "color": Colors.orangeAccent,
      },
      {
        "titulo": "Llantas 18'",
        "subtitulo": "Todo Terreno",
        "icono": Icons.radio_button_checked,
        "color": Colors.pinkAccent,
      },
      {
        "titulo": "Aceite Sintético",
        "subtitulo": "correcaminos",
        "icono": Icons.opacity,
        "color": Colors.teal,
      },
    ];

    // 2. INICIO DEL SCAFFOLD
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          157,
          87,
          236,
        ), // Fondo morado
        title: const Text(
          "Tienda MyselftCar 6°J ||",
          style: TextStyle(color: Colors.white), // Título blanco
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.camera_alt,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 255, 108, 108),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
      ), // <--- AQUÍ HABÍA UN ERROR (tenías ; en vez de ,)
      // 3. BODY (Ahora sí está dentro del Scaffold)
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: item['color'].withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),

                // LEADING
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: item['color'].withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item['icono'], color: item['color'], size: 28),
                ),

                // TEXT
                title: Text(
                  item['titulo'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  item['subtitulo'],
                  style: TextStyle(color: const Color.fromARGB(255, 37, 37, 37), fontSize: 13),
                ),

                // TRAILING
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),

                // ONTAP
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Tocaste: ${item['titulo']}"),
                      backgroundColor: item['color'],
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    ); // <--- AQUÍ SE CIERRA EL SCAFFOLD
  }
} // fin clase refacciones
