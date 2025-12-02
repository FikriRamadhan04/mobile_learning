import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:latihan_flutter_input_13/main.dart';

void main() {
  testWidgets('InputMahasiswaPage renders all form elements',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.pumpAndSettle();

    expect(find.text('P13 Input - Andri Hermawan'), findsOneWidget,
        reason: 'Should find the title of the input page.');

    expect(find.widgetWithText(TextFormField, 'NIM'), findsOneWidget,
        reason: 'Should find the input field with label NIM.');

    expect(find.widgetWithText(TextFormField, 'NAMA'), findsOneWidget,
        reason: 'Should find the input field with label NAMA.');

    expect(find.widgetWithText(ElevatedButton, 'Simpan'), findsOneWidget,
        reason: 'Should find the Save/Simpan button.');

    expect(find.byIcon(Icons.list), findsOneWidget,
        reason:
            'Should find the Floating Action Button for data list navigation.');

    await tester.enterText(
        find.widgetWithText(TextFormField, 'NIM'), '231091750053');
    expect(find.text('231091750053'), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextFormField, 'NAMA'), 'Andri Hermawan');
    expect(find.text('Andri Hermawan'), findsOneWidget);
  });
}
