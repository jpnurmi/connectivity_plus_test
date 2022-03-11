import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:connectivity_plus_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test the whole app with wifi', (tester) async {
    ConnectivityPlatform.instance =
        FakeConnectivityPlatform(ConnectivityResult.wifi);

    app.main();
    await tester.pumpAndSettle();

    expect(find.text('ConnectivityResult.wifi'), findsOneWidget);
  });
}

class FakeConnectivityPlatform extends ConnectivityPlatform {
  FakeConnectivityPlatform(this._result);

  final ConnectivityResult _result;

  @override
  Future<ConnectivityResult> checkConnectivity() => Future.value(_result);

  @override
  Stream<ConnectivityResult> get onConnectivityChanged => const Stream.empty();
}
