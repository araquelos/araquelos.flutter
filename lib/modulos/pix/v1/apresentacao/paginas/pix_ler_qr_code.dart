import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/modulos/pix/v1/apresentacao/componentes/info_alerta.dart';
import 'package:mobile_pj/modulos/pix/v1/dominio/modelos/recebedor_pix.dart';
import 'package:mobile_pj/repositorios/contatos_pix_repositorio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PixLerQrCode extends StatefulWidget {
  const PixLerQrCode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PixLerQrCodeState();
}

class _PixLerQrCodeState extends State<PixLerQrCode> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.963,
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.963,
                  child: _buildQrView(context),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: InfoAlerta(
                    icone: InternetBankingAssetsIcones.info,
                    info:
                        'Aponte sua câmera para o QR Code. A leitura será realizada automaticamente.',
                    corFundo: Color.fromRGBO(55, 52, 52, 1),
                    corBorda: Color.fromRGBO(55, 52, 52, 1),
                    corTexto: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        String qrcode =
            result != null ? result!.code.toString() : 'QrCode não encontrado!';
        RecebedorPix dadosContatoQrCode = ContatosPixRepositorio.contato[4];
        context.pushNamed(InternetBankingRotas.pixLerQrCodeEtapa1,
            extra: dadosContatoQrCode);
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
