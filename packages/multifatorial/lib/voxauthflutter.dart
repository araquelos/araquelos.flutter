import 'Authentication_Method_Class.dart';
import 'voxauthflutter_platform_interface.dart';

class Voxauthflutter {
  Future<String?> getPlatformVersion() {
    return VoxauthflutterPlatform.instance.getPlatformVersion();
  }

  Future<String?> SDKClient(String webServiceUrl, String channelName,
      String password, String clientId, String deviceName) {
    return VoxauthflutterPlatform.instance
        .SDKClient(webServiceUrl, channelName, password, clientId, deviceName);
  }

  Future<String?> getDeviceInfo() {
    return VoxauthflutterPlatform.instance.getDeviceInfo();
  }

  Future<String?> getDeviceID() async {
    return await VoxauthflutterPlatform.instance.getDeviceID();
  }

  Future<List<AuthenticationMethod>> syncAuthenticationMethodsConfigs() {
    return VoxauthflutterPlatform.instance.syncAuthenticationMethodsConfigs();
  }

  Future<Map> insertMobileToken() {
    return VoxauthflutterPlatform.instance.insertMobileToken();
  }

  Future<String?> getPassword(
    String cryptography,
    String key,
    int passSize,
    int passGenerationTime,
  ) {
    return VoxauthflutterPlatform.instance
        .getPassword(cryptography, key, passSize, passGenerationTime);
  }

  Future<int> MtokenAuthentication(String transactionCode,
      double transactionValue, double idAuthenticationMethod, String token) {
    return VoxauthflutterPlatform.instance.MtokenAuthentication(
        transactionCode, transactionValue, idAuthenticationMethod, token);
  }

  Future<Map> SMSAuthentication(String transactionCode, double transactionValue,
      double idAuthenticationMethod, String phone) {
    return VoxauthflutterPlatform.instance.SMSAuthentication(
        transactionCode, transactionValue, idAuthenticationMethod, phone);
  }

  Future<int> ValidateAuthentication(
      String token, String authenticationSignature) {
    return VoxauthflutterPlatform.instance
        .ValidateAuthentication(token, authenticationSignature);
  }

  Future<Map> ReverseSMSAuthentication(String transactionCode,
      double transactionValue, double idAuthenticationMethod, String phone) {
    return VoxauthflutterPlatform.instance.ReverseSMSAuthentication(
        transactionCode, transactionValue, idAuthenticationMethod, phone);
  }

  Future<int> ResponseAuthentication(String authenticationSignature) {
    return VoxauthflutterPlatform.instance
        .ResponseAuthentication(authenticationSignature);
  }

  Future<List<AuthenticationMethod>> getAuthenticationMethodsMobile(
      String transactionCode, double transactionValue) {
    return VoxauthflutterPlatform.instance
        .getAuthenticationMethodsMobile(transactionCode, transactionValue);
  }
}
