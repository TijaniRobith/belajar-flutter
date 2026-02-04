import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Menggunakan tema gelap agar efek neon terlihat
      home: const UnusualHelloWorld(),
    );
  }
}

class UnusualHelloWorld extends StatefulWidget {
  const UnusualHelloWorld({super.key});

  @override
  State<UnusualHelloWorld> createState() => _UnusualHelloWorldState();
}

class _UnusualHelloWorldState extends State<UnusualHelloWorld>
    with SingleTickerProviderStateMixin {
  // Controller untuk mengatur animasi
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Inisialisasi animasi durasi 2 detik
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Mengatur kurva animasi agar gerakan halus (easeInOut)
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Mengulang animasi secara bolak-balik (reverse)
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background dengan gradasi gelap futuristik
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0f0c29),
              Color(0xFF302b63),
              Color(0xFF24243e),
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // Menggerakkan widget ke atas dan bawah berdasarkan nilai animasi
              return Transform.translate(
                offset: Offset(0, _animation.value * -20), 
                child: child,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ikon Roket dengan efek Glow
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.rocket_launch,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // Teks Hello World dengan Gradient
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.cyan, Colors.pinkAccent],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: const Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna ini akan ditimpa oleh shader
                      letterSpacing: 2,
                    ),
                  ),
                ),
                
                const SizedBox(height: 10),
                
                // Subtitle kecil
                Text(
                  'Welcome to the Future',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}