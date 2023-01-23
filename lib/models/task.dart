class Task {
  final String title;
  final String body;

  Task(this.title, this.body);

  toJSONEncodable() {
    Map<String, dynamic> mappedTask = new Map();

    mappedTask['title'] = title;
    mappedTask['body'] = body;

    return mappedTask;
  }
}
