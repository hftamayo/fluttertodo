import 'package:fluttertodo/models/task.dart';

class TodoList {
  List<Task> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
