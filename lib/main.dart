import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importar Firebase
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
// IMPORTANTE: Esta línea dará error hasta que hagas el paso "El Truco Final" (abajo)
import 'firebase_options.dart'; 

void main() async {
  // 1. Aseguramos que el motor de Flutter esté listo
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Inicializamos Firebase de forma segura
  // Esto detecta automáticamente si es Android o iOS gracias al archivo generado
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PentathlonApp());
}

// Configuración de Rutas (Igual que antes)
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Paleta de colores ODS (Agenda 2030)
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C4CC), // ODS 13
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.bungeeTextTheme(), // Fuente estilo "Gamer/Poster"
      ),
    );
  }
}

// Pantalla Principal (Estilo Neo-Brutalism)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text('PENTATHLON ODD 2030'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNeoCard(
              title: "Équipes",
              subtitle: "Gérer les groupes",
              color: const Color(0xFFE5243B), // ODS 1
              icon: Icons.group,
            ),
            const SizedBox(height: 15),
             _buildNeoCard(
              title: "Mon Score",
              subtitle: "0 Points",
              color: const Color(0xFFDDA63A), // ODS 11
              icon: Icons.star,
            ),
            const Spacer(),
            // Botón Gigante Scanner
            ElevatedButton.icon(
              onPressed: () => context.push('/scanner'),
              icon: const Icon(Icons.qr_code_scanner, size: 30),
              label: const Text("SCANNER OBSTACLE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNeoCard({required String title, required String subtitle, required Color color, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.black),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
              Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

// Pantalla Scanner Placeholder
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SCANNER QR")),
      body: const Center(child: Text("Cámara activada próximamente...")),
    );
  }
}
