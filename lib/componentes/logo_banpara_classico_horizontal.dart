import 'package:flutter/material.dart';

class LogoBanparaClassicoHorizontal extends StatelessWidget {
  final double? height;
  final double? width;
  const LogoBanparaClassicoHorizontal({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset('assets/images/logo_banpara_classico.png'),
    );
  }
}
