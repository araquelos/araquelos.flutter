import 'package:flutter/material.dart';

class FundoTelaAutenticacao extends StatelessWidget {
  const FundoTelaAutenticacao({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color.fromARGB(148, 8, 30, 96), Color.fromARGB(255, 214, 0, 25)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcOver,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login-fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
