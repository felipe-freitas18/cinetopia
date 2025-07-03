import 'package:cinetopia/ui/components/bottons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/logo.png"),
            Image.asset("assets/splash.png"),
            Text(
              "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
            ),
            PrimaryButton(),
          ],
        ),
      ),
    );
  }
}
