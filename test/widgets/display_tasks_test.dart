import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/widgets/display_tasks_widget.dart';
import 'package:fluttertodo/services/localizations_injected.dart';

void main() {
  group('display tasks list:', () {
    String title;
    String body;
    Task task;
    testWidgets('render with no tasks', (WidgetTester tester) async {
      await tester.pumpWidget(
          const LocalizationsInjected(child: DisplayTasks(tasks: <Task>[])));
      expect(find.byType(DisplayTasks), findsOneWidget);
    });
  });
}
