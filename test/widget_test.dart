import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:item_tracker/providers/item_provider.dart';
import 'package:item_tracker/screens/home_screen.dart';

void main() {
  testWidgets('Add, Edit, and Remove items', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ItemProvider()),
        ],
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    // Add an item
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'Item 1');
    await tester.enterText(find.byType(TextField).at(1), 'Description 1');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();
    expect(find.text('Item 1'), findsOneWidget);

    // Edit the item
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'Item 1 Edited');
    await tester.enterText(
        find.byType(TextField).at(1), 'Description 1 Edited');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Item 1 Edited'), findsOneWidget);

    // Remove the item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();
    expect(find.text('Item 1 Edited'), findsNothing);
  });
}
