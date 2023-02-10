import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/widgets/display_tasks_widget.dart';
import 'package:fluttertodo/services/localizations_injected.dart';

void main() {
  group('display tasks list:', () {
    final Task task =
        Task(title: 'Market Shopping List', body: 'Buy fruits and veggies');
    late List<Task> tasks;
    testWidgets('render with no tasks english', (WidgetTester tester) async {
      await tester.pumpWidget(
          const LocalizationsInjected(child: DisplayTasks(tasks: <Task>[])));
      expect(find.byType(DisplayTasks), findsOneWidget);
      expect(find.text('No Tasks found'), findsOneWidget);
    });

    testWidgets('displaying tasks', (WidgetTester tester) async {
      tasks = task.toMap().entries.map((e) => e.value).toList();
      await tester
          .pumpWidget(LocalizationsInjected(child: DisplayTasks(tasks: tasks)));
      expect(find.byType(DisplayTasks), findsOneWidget);
      expect(find.text('Market Shopping List'), findsOneWidget);
      expect(find.text('Buy fruits and veggies'), findsOneWidget);
    });
  });
}
