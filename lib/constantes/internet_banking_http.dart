// ignore: unnecessary_nullable_for_final_variable_declarations

// api_constantes.dart: When using REST API service in dart then we can store all the API endpoints in a separate file api_constantes.dart
abstract class InternetBankingHttp {
  // Remoto
  // static const String hostBase = '10.0.2.95';
  // static const List<String> contextoCentralizador = ['servicospfreact', 'api'];
  // static const int? porta = null;

  // Local
  static const List<String> contextoCentralizador = ['api'];
  // static const String hostBase = '192.168.1.12'; // Renan
  //static const String hostBase = '192.168.0.36'; // Walberson
  //static const String hostBase = '10.0.0.165'; // Lucas
  //static const String hostBase = '192.168.15.9'; // Raquel

  static const String hostBase = '192.168.1.12'; // Renan
  static const int porta = 56790; // Renan

  //static const String hostBase = '192.168.0.36'; // Walberson
  //static const int? porta = 56790; // Walberson

  //static const String hostBase = '192.168.3.30'; // Lucas
  //static const int? porta = 56790; // Lucas

  //static const String hostBase = '192.168.0.11'; // Raquel
  //static const int? porta = 56790; // Raquel

  // static const String hostBase = '192.168.0.6'; // Anselmo
  // static const int? porta = 50000; // Anselmo
}
