import 'package:fluttertodo/models/task.dart';

class TaskList {
  List<Task> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
