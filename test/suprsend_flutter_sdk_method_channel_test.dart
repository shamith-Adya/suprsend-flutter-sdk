import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:suprsend_flutter_sdk/suprsend_flutter_sdk_method_channel.dart';

void main() {
  MethodChannelSuprsendFlutterSdk platform = MethodChannelSuprsendFlutterSdk();
  const MethodChannel channel = MethodChannel('suprsend_flutter_sdk');

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
