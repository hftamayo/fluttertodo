import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/widgets/new_task_button_widget.dart';
import 'package:fluttertodo/services/localizations_injected.dart';

void main() {
  group('new task button', () {
    testWidgets('button render', (WidgetTester tester) async {
      await tester.pumpWidget(LocalizationsInjected(
          child: ButtonAddTask(
        onPressed: () {},
      )));
      expect(find.byType(ButtonAddTask), findsOneWidget);
    });

    testWidgets('onPress event', (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(MaterialApp(
          home: ButtonAddTask(
        onPressed: () => pressed = true,
      )));
      await tester.tap(find.byType(ButtonAddTask));
      await tester.pumpAndSettle();
      expect(pressed, true);
    });
  });
}
