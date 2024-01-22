import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voxauthflutter/voxauthflutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _sdk = false;
  bool _deviceInfo = false;
  bool _deviceId = false;
  bool _mobileToken = false;
  bool _tokenAuthentication = false;
  bool _tokenAuthenticationsms = false;
  bool _password = false;
  String _token = "";
  bool _authenticationMethodsConfigs = false;
  bool _authenticationM = false;
  bool _validateA = false;
  bool _validateReverse = false;
  bool _validateReverseA = false;
  Map _jsonSMSAuth = {};
  Map _jsonReverseSMSAuth = {};
  List _listSyncMethods = [];
  List _listAuthMethods = [];
  final String _teste = 'Unknown';
  final _voxauthflutterPlugin = Voxauthflutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  _sdkClient() async {
    String? sdk;
    try {
      sdk = await _voxauthflutterPlugin.SDKClient(
          'http://10.0.2.214:9091/',
          'AuthSDK_Android',
          'czs+AUVcUGd#5wzof6Ac!%BV5',
          '94997799220',
          'JOAO_EXEMPO1');
    } catch (e) {
      sdk = 'notok';
    }
    setState(() {
      _sdk = (sdk == "ok");
    });
  }

  _getDeviceInfo() async {
    String? deviceInfo;
    try {
      deviceInfo = await _voxauthflutterPlugin.getDeviceInfo();
      setState(() {
        _deviceInfo = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _getDeviceID() async {
    String? deviceId;
    try {
      deviceId = await _voxauthflutterPlugin.getDeviceID();
      setState(() {
        _deviceId = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _syncAuthenticationMethodsConfigs() async {
    try {
      _listSyncMethods =
          await _voxauthflutterPlugin.syncAuthenticationMethodsConfigs();
      setState(() {
        _authenticationMethodsConfigs = true;
      });
    } catch (e) {
      setState(() {
        _authenticationMethodsConfigs = false;
      });
    }
  }

  _insertMobileToken() async {
    Map mobileToken;
    try {
      mobileToken = await _voxauthflutterPlugin.insertMobileToken();
      setState(() {
        _mobileToken = true;
      });
    } catch (e) {
      final a = e;
    }
  }

  _getPassword() async {
    String? password;
    try {
      String cryptography = '';
      String key = '';
      int passSize = 0;
      int passGenerationTime = 0;
      for (var element in _listSyncMethods) {
        if (element.NameAuthenticationMethodType == "Mobile Token") {
          cryptography = element.Cryptography;
          key = element.Key;
          passSize = element.PassSize;
          passGenerationTime = element.PassGenerationTime;
        }
      }
      password = await _voxauthflutterPlugin.getPassword(
          cryptography, key, passSize, passGenerationTime);
      setState(() {
        _token = password.toString();
        _password = true;
      });
    } catch (e) {
      _token = "";
    }
  }

  _mTokenAuthentication() async {
    int password;
    try {
      double idAuthenticationMethod = 0;
      for (var element in _listSyncMethods) {
        if (element.NameAuthenticationMethodType == "Mobile Token") {
          idAuthenticationMethod = element.IDAuthenticationMethod.toDouble();
        }
      }
      if (idAuthenticationMethod == 0) {
        throw Exception("MobileToken não permitido");
      }
      String transactionCode = "999";
      double transactionValue = 0;

      String token = _token;
      password = await _voxauthflutterPlugin.MtokenAuthentication(
          transactionCode, transactionValue, idAuthenticationMethod, token);
      setState(() {
        _tokenAuthentication = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _smsAuthentication() async {
    Map jsonResult;
    try {
      double idAuthenticationMethod = 0;
      for (var element in _listAuthMethods) {
        if (element.NameAuthenticationMethodType == "SMS") {
          idAuthenticationMethod = element.IDAuthenticationMethod.toDouble();
        }
      }
      if (idAuthenticationMethod == 0) {
        throw Exception("SMS não permitido");
      }
      String transactionCode = "999";
      double transactionValue = 0;
      String phone = "91985272987";
      jsonResult = await _voxauthflutterPlugin.SMSAuthentication(
          transactionCode, transactionValue, idAuthenticationMethod, phone);
      setState(() {
        _jsonSMSAuth = jsonResult;
        _tokenAuthenticationsms = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _validateAuthentication() async {
    int code;
    try {
      String token = "203635";
      String authenticationSignature = _jsonSMSAuth['AuthenticationSignature'];
      code = await _voxauthflutterPlugin.ValidateAuthentication(
          token, authenticationSignature);
      setState(() {
        _validateA = code == 1;
      });
    } catch (e) {
      print(e);
    }
  }

  _reverseSMSAuthentication() async {
    Map jsonResult;
    try {
      double idAuthenticationMethod = 0;
      for (var element in _listAuthMethods) {
        if (element.NameAuthenticationMethodType == "SMS Reverso") {
          idAuthenticationMethod = element.IDAuthenticationMethod.toDouble();
        }
      }
      if (idAuthenticationMethod == 0) {
        throw Exception("SMS não permitido");
      }
      String transactionCode = "999";
      double transactionValue = 0;
      String phone = "91985272987";
      jsonResult = await _voxauthflutterPlugin.ReverseSMSAuthentication(
          transactionCode, transactionValue, idAuthenticationMethod, phone);
      setState(() {
        _jsonReverseSMSAuth = jsonResult;
        _validateReverse = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _responseAuthentication() async {
    int code;
    try {
      String authenticationSignature =
          _jsonReverseSMSAuth['AuthenticationSignature'];
      code = await _voxauthflutterPlugin.ResponseAuthentication(
          authenticationSignature);
      setState(() {
        _validateReverseA = true;
      });
    } catch (e) {
      print(e);
    }
  }

  __getAuthenticationMethodsMobile() async {
    try {
      String transactionCode = "999";
      double transactionValue = 0;
      _listAuthMethods = await _voxauthflutterPlugin
          .getAuthenticationMethodsMobile(transactionCode, transactionValue);
      setState(() {
        _authenticationM = true;
      });
    } catch (e) {
      print(e);
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _voxauthflutterPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'SDK Exemplo:',
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: _sdk ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _sdkClient,
                  child: const Text('sdkClient'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: !!_deviceInfo ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _getDeviceInfo,
                  child: const Text('getDeviceInfo '),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: !!_deviceId ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _getDeviceID,
                  child: const Text('getDeviceID'),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: _authenticationMethodsConfigs
                        ? Colors.blue
                        : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _syncAuthenticationMethodsConfigs,
                  child: const Text('sync Authentication'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: _mobileToken ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _insertMobileToken,
                  child: const Text('insertMobileToken'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: _password ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _getPassword,
                  child: const Text('getPassword'),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _tokenAuthentication ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _mTokenAuthentication,
                  child: const Text('MtokenAuthentication'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _authenticationM ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: __getAuthenticationMethodsMobile,
                  child: const Text('getAuthentication'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _tokenAuthenticationsms ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _smsAuthentication,
                  child: const Text('SMSAuthentication'),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: _validateA ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _validateAuthentication,
                  child: const Text('ValidateAuthentication'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _validateReverse ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _reverseSMSAuthentication,
                  child: const Text('reverse SMSAuthentication'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _validateReverseA ? Colors.blue : Colors.red,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _responseAuthentication,
                  child: const Text('response Authentication'),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
