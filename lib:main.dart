import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PentathlonApp());
}

// Configuración de Rutas
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/scanner',
      builder: (context, state) => const ScannerScreen(),
    ),
  ],
);

class PentathlonApp extends StatelessWidget {
  const PentathlonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Pentathlon des ODD',
      theme: ThemeData(
        // Diseño visual: Estilo moderno y llamativo para adolescentes
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C4CC), // ODS 13 Climate Action Color
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.bungeeTextTheme(), // Fuente tipo "Poster"
      ),
    );
  }
}

// Pantalla Principal (Dashboard)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // Fondo crema suave
      appBar: AppBar(
        title: const Text('PENTATHLON ODD 2030'),
        centerTitle: true,
        backgroundColor: Colors.black, // Estilo brutalista
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta de Bienvenida
            _buildNeoCard(
              title: "Salut, Organisateur!",
              subtitle: "Prêt pour la mission?",
              color: const Color(0xFFA3E635), // Verde brillante
              icon: Icons.emoji_events,
            ),
            const SizedBox(height: 20),
            // Botón Gigante de Acción (DUA: Claro y visible)
            ElevatedButton.icon(
              onPressed: () => context.push('/scanner'),
              icon: const Icon(Icons.qr_code_scanner, size: 30),
              label: const Text("SCANNER ÉPREUVE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            const Text(
              "Projet d'Innovation Éducative - 3º ESO",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Widget personalizado estilo "Neo-Brutalism"
  Widget _buildNeoCard({required String title, required String subtitle, required Color color, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 4), // Borde grueso negro
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(6, 6), blurRadius: 0), // Sombra sólida
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.black),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pantalla Placeholder para el Escáner
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SCANNER QR")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            const Text("Aquí irá la cámara para leer los códigos de las pruebas"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text("Retour"),
            ),
          ],
        ),
      ),
    );
  }
}