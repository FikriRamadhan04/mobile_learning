import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  // Test SnackBar muncul saat tap menu
  testWidgets('Tap menu item menampilkan SnackBar', (WidgetTester tester) async {
    await tester.pumpWidget(const FikriApp());

    // Cari item pertama
    final firstItem = find.text('Es Teh Manis');
    expect(firstItem, findsOneWidget);

    // Tap item pertama
    await tester.tap(firstItem);
    await tester.pump(); // memicu SnackBar

    // Pastikan SnackBar muncul dengan teks yang benar
    expect(find.text('Berhasil menambahkan Es Teh Manis ke dalam keranjang'), findsOneWidget);
  });

  // Test AppBar muncul
  testWidgets('AppBar tampil dengan judul yang benar', (WidgetTester tester) async {
    await tester.pumpWidget(const FikriApp());
    expect(find.text('Muhamad Fikri Ramadhan'), findsOneWidget);
  });
}
