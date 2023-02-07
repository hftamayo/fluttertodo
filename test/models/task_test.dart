import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/models/task.dart';

void main() {
  group('task models:', () {
    const String title = 'test title';
    const String body = 'test body';

    test('new task instance', () {
      final Task task = Task(title: title, body: body);
      expect(task.title, title);
      expect(task.body, body);
    });
    test('from map to class', () {
      final Map<String, String> mapOfTasks = {'title': title, 'body': body};
      final Task fromMapFormatTask = Task.fromMap(mapOfTasks);
      expect(fromMapFormatTask.title, title);
      expect(fromMapFormatTask.body, body);
    });
    // test('to map format', () {
    //   final Task task = Task(title: title, body: body);
    //   final List<Task> tasksToMap = tasksToMap.map((task) => task.toMap().toList());
    // });
  });
}
