import 'dart:math';
import 'package:flutter/material.dart';
 
class TelaJogo extends StatefulWidget {
  final int nivel;
 
  const TelaJogo({Key? key, required this.nivel}) : super(key: key);
 
  @override
  _TelaJogoState createState() => _TelaJogoState();
}
 
class _TelaJogoState extends State<TelaJogo> {
  late int numeroMaximo;
  late int tentativas;
  late TextEditingController controller;
  late int numeroAleatorio;
  String mensagem = '';
  bool jogoEncerrado = false;
 
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    iniciarJogo();
  }
 
  void iniciarJogo() {
    setState(() {
      if (widget.nivel == 1) {
        numeroMaximo = 10;
        tentativas = 4;
      } else if (widget.nivel == 2) {
        numeroMaximo = 100;
        tentativas = 6;
      } else {
        numeroMaximo = 1000;
        tentativas = 10;
      }
      final random = Random();
      numeroAleatorio = random.nextInt(numeroMaximo + 1);
      jogoEncerrado = false;
      mensagem = '';
    });
  }
 
  void verificarNumero() {
    if (!jogoEncerrado) {
      setState(() {
        final int numeroDigitado = int.tryParse(controller.text) ?? 0;
        if (numeroDigitado == numeroAleatorio) {
          mensagem = 'Parabéns! Você acertou o número $numeroAleatorio';
          jogoEncerrado = true;
        } else {
          tentativas--;
          if (tentativas == 0) {
            mensagem = 'Não conseguiu acertar! O número era: $numeroAleatorio';
            jogoEncerrado = true;
          } else if (numeroDigitado < numeroAleatorio) {
            mensagem = 'Tente um número maior!';
          } else {
            mensagem = 'Tente um número menor!';
          }
        }
        controller.clear();
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da Adivinhação"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Adivinhe o número de 0 a $numeroMaximo",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "Tentativas restantes: $tentativas",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurple),
                // Aceita apenas números
                onSubmitted: (_) {
                  verificarNumero();
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verificarNumero();
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 20),
            Text(
              mensagem,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            iniciarJogo();
          });
        },
        tooltip: "Iniciar novo jogo",
        child: const Icon(Icons.refresh),
      ),
    );
  }
 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}