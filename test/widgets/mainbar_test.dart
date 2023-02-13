import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/widgets/mainbar_widget.dart';
import 'package:fluttertodo/services/localizations_injected.dart';

void main() {
  group('mainbar', () {
    testWidgets('widget render', (WidgetTester tester) async {
      await tester.pumpWidget(const LocalizationsInjected(child: MainBar()));
      expect(find.byType(MainBar), findsOneWidget);
    });
  });
}
