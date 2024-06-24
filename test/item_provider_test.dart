import 'package:flutter_test/flutter_test.dart';
import 'package:item_tracker/providers/item_provider.dart';

void main() {
  group('ItemProvider', () {
    test('should add an item', () {
      final provider = ItemProvider();
      provider.addItem('Item 1', 'Description 1');
      expect(provider.items.length, 1);
      expect(provider.items[0].name, 'Item 1');
    });

    test('should edit an item', () {
      final provider = ItemProvider();
      provider.addItem('Item 1', 'Description 1');
      provider.editItem(0, 'Item 1 Edited', 'Description 1 Edited');
      expect(provider.items[0].name, 'Item 1 Edited');
      expect(provider.items[0].description, 'Description 1 Edited');
    });

    test('should remove an item', () {
      final provider = ItemProvider();
      provider.addItem('Item 1', 'Description 1');
      provider.removeItem(0);
      expect(provider.items.length, 0);
    });
  });
}
