import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/provider/lang_provider.dart';

void main() {
  group('language provider', () {
    final LangProvider langProvider = Provider.of<LangProvider>(context);
    testWidgets('switching to english', (tester) async {
      langProvider.languageCode = 'en';
      await tester.pumpWidget();
      expect(context, equals(xx.currentContext));
      expect(Provider.of<Location>(_childKey.currentContext), null);

  });
}
