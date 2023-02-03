class Task {
  final String title;
  final String body;

  Task({this.title = "", this.body = ""});

  Map toMap() {
    return {'title': title, 'body': body};
  }

  static Task fromMap(Map task) {
    return Task(title: task['title'], body: task['body']);
  }
}
