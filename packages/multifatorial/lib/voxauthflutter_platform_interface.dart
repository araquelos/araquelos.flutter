import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'Authentication_Method_Class.dart';
import 'voxauthflutter_method_channel.dart';

abstract class VoxauthflutterPlatform extends PlatformInterface {
  /// Constructs a VoxauthflutterPlatform.
  VoxauthflutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static VoxauthflutterPlatform _instance = MethodChannelVoxauthflutter();

  /// The default instance of [VoxauthflutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelVoxauthflutter].
  static VoxauthflutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VoxauthflutterPlatform] when
  /// they register themselves.
  static set instance(VoxauthflutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceInfo() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceID() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<AuthenticationMethod>> syncAuthenticationMethodsConfigs() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map> insertMobileToken() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getPassword(
    String cryptography,
    String key,
    int passSize,
    int passGenerationTime,
  ) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> MtokenAuthentication(String transactionCode,
      double transactionValue, double idAuthenticationMethod, String token) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map> SMSAuthentication(String transactionCode, double transactionValue,
      double idAuthenticationMethod, String phone) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> ValidateAuthentication(
      String token, String authenticationSignature) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map> ReverseSMSAuthentication(String transactionCode,
      double transactionValue, double idAuthenticationMethod, String phone) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> ResponseAuthentication(String authenticationSignature) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<AuthenticationMethod>> getAuthenticationMethodsMobile(
      String transactionCode, double transactionValue) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> SDKClient(String webServiceUrl, String channelName,
      String password, String clientId, String deviceName) {
    throw UnimplementedError('SDKClient() has not been implemented.');
  }
}
