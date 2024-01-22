import 'package:local_auth/local_auth.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';
import 'package:local_auth_android/src/auth_messages_android.dart';
import 'package:local_auth_ios/types/auth_messages_ios.dart';

class DigitalServico {
  LocalAuthentication autenticacaoLocal;

  DigitalServico({required this.autenticacaoLocal});

  Future<bool> podeAutenticar() async {
    final bool podeAutenticarComBiometria = await autenticacaoLocal.canCheckBiometrics;
    return podeAutenticarComBiometria || await autenticacaoLocal.isDeviceSupported();
  }

  Future<bool> autenticar() async {
    return await autenticacaoLocal.authenticate(
      localizedReason: " ",
      authMessages: const <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: "Autenticação",
          biometricHint: " ",
          cancelButton: "Cancelar",
        ),
        IOSAuthMessages(
          cancelButton: "Cancelar",
        ),
      ],
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
        useErrorDialogs: false,
      ),
    );
  }

  Future<List<BiometricType>> biometriasAvaliadas() async {
    final List<BiometricType> availableBiometrics = await autenticacaoLocal.getAvailableBiometrics();
    return availableBiometrics;
  }
}
