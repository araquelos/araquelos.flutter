import 'package:voxauthflutter/voxauthflutter_platform_interface.dart';

/* class MockVoxauthflutterPlatform
    with MockPlatformInterfaceMixin
    implements VoxauthflutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
} */

void main() {
  final VoxauthflutterPlatform initialPlatform = VoxauthflutterPlatform.instance;

  /* test('$MethodChannelVoxauthflutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVoxauthflutter>());
  }); */

  /* test('getPlatformVersion', () async {
    Voxauthflutter voxauthflutterPlugin = Voxauthflutter();
    //MockVoxauthflutterPlatform fakePlatform = MockVoxauthflutterPlatform();
    VoxauthflutterPlatform.instance = fakePlatform;

    expect(await voxauthflutterPlugin.getPlatformVersion(), '42');
  }); */
}
