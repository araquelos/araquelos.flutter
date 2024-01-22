import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'Authentication_Method_Class.dart';
import 'voxauthflutter_platform_interface.dart';

/// An implementation of [VoxauthflutterPlatform] that uses method channels.
class MethodChannelVoxauthflutter extends VoxauthflutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('voxauthflutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDeviceInfo() async {
    try {
      final result = await methodChannel.invokeMethod<String>('GetDeviceInfo');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getDeviceID() async {
    try {
      final result = await methodChannel.invokeMethod<String>('GetDeviceID');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AuthenticationMethod>> syncAuthenticationMethodsConfigs() async {
    try {
      final result = await methodChannel
          .invokeMethod<String>('SyncAuthenticationMethodsConfigs');
      final auxt = json.decode(result!);
      List<AuthenticationMethod> authMethods = [];
      for (var element in auxt) {
        authMethods.add(AuthenticationMethod.fromJson(element));
      }
      return authMethods;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map> insertMobileToken() async {
    try {
      final result =
          await methodChannel.invokeMethod<String>('InsertMobileToken');

      return json.decode(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getPassword(
    String cryptography,
    String key,
    int passSize,
    int passGenerationTime,
  ) async {
    try {
      final result = await methodChannel.invokeMethod<String>('GetPassword', {
        "Cryptography": cryptography,
        "Key": key,
        "PassSize": passSize,
        "PassGenerationTime": passGenerationTime,
      });

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> MtokenAuthentication(
      String transactionCode,
      double transactionValue,
      double idAuthenticationMethod,
      String token) async {
    try {
      final result =
          await methodChannel.invokeMethod<String>('MTokenAuthentication', {
        "transactionCode": transactionCode,
        "transactionValue": transactionValue,
        "IDAuthenticationMethod": idAuthenticationMethod,
        "token": token,
      });
      return int.parse(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map> SMSAuthentication(String transactionCode, double transactionValue,
      double idAuthenticationMethod, String phone) async {
    try {
      final result =
          await methodChannel.invokeMethod<String>('SMSAuthentication', {
        "transactionCode": transactionCode,
        "transactionValue": transactionValue,
        "IDAuthenticationMethod": idAuthenticationMethod,
        "phone": phone,
      });
      return json.decode(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> ValidateAuthentication(
      String token, String authenticationSignature) async {
    try {
      final result =
          await methodChannel.invokeMethod<String>('ValidateAuthentication', {
        "token": token,
        "authenticationSignature": authenticationSignature,
      });
      return int.parse(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map> ReverseSMSAuthentication(
      String transactionCode,
      double transactionValue,
      double idAuthenticationMethod,
      String phone) async {
    try {
      final result =
          await methodChannel.invokeMethod<String>('ReverseSMSAuthentication', {
        "transactionCode": transactionCode,
        "transactionValue": transactionValue,
        "IDAuthenticationMethod": idAuthenticationMethod,
        "phone": phone,
      });

      return json.decode(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> ResponseAuthentication(String authenticationSignature) async {
    try {
      final result =
          await methodChannel.invokeMethod<String>('ResponseAuthentication', {
        "authenticationSignature": authenticationSignature,
      });

      return int.parse(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AuthenticationMethod>> getAuthenticationMethodsMobile(
      String transactionCode, double transactionValue) async {
    try {
      final result = await methodChannel
          .invokeMethod<String>('GetAuthenticationMethodsMobile', {
        "transactionCode": transactionCode,
        "transactionValue": transactionValue,
      });

      final auxt = json.decode(result!);
      List<AuthenticationMethod> authMethods = [];
      for (var element in auxt) {
        authMethods.add(AuthenticationMethod.fromJson(element));
      }

      return authMethods;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> SDKClient(String webServiceUrl, String channelName,
      String password, String clientId, String deviceName) async {
    try {
      final returnVal = await methodChannel.invokeMethod<String>('SDKClient', {
        "webServiceUrl": webServiceUrl,
        "channelName": channelName,
        "password": password,
        "clientId": clientId,
        "deviceName": deviceName
      });
      return returnVal;
    } catch (e) {
      rethrow;
    }
  }
}
