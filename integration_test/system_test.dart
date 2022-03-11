import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('not good - relies on the system', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // hope for the best
    final connectivity = await Connectivity().checkConnectivity();
    await tester.pumpUntil(find.text(connectivity.toString()));
    expect(find.text(connectivity.toString()), findsOneWidget);
  });
}

extension WidgetPumper on WidgetTester {
  Future<void> pumpUntil(
    Finder finder, [
    Duration timeout = const Duration(seconds: 10),
  ]) {
    return Future.doWhile(() async {
      if (any(finder)) return false;
      await pump();
      return true;
    }).timeout(timeout);
  }
}
