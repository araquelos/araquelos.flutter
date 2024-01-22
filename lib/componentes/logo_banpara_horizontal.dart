import 'package:flutter/material.dart';

class LogoBanparaHorizontal extends StatelessWidget {
  final double? height;
  final double? width;
  const LogoBanparaHorizontal({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset('assets/images/logo_banpara_3.png'),
    );
  }
}
