import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_test/main.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  testWidgets('test widgets with wifi', (tester) async {
    final connectivity = MockConnectivity();
    when(connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);

    await tester.pumpWidget(
      MaterialApp(
        home: Provider<Connectivity>.value(
          value: connectivity,
          child: const ConnectivityConsumer(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ConnectivityResult.wifi'), findsOneWidget);
    verify(connectivity.checkConnectivity()).called(1);
  });
}
