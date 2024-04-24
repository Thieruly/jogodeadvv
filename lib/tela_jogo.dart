import 'package:contador/index.dart';
import 'package:flutter/material.dart';
import 'tela_jogo.dart';
 
class TelaNiveis extends StatelessWidget {
  const TelaNiveis({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolha o nível"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaJogo(nivel: 1)),
                );
              },
              child: const Text('Nível Fácil (0-10)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaJogo(nivel: 2)),
                );
              },
              child: const Text('Nível Médio (0-100)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaJogo(nivel: 3)),
                );
              },
              child: const Text('Nível Difícil (0-1000)'),
            ),
          ],
        ),
      ),
    );
  }
}