import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxauthflutter/voxauthflutter_method_channel.dart';

void main() {
  MethodChannelVoxauthflutter platform = MethodChannelVoxauthflutter();
  const MethodChannel channel = MethodChannel('voxauthflutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
