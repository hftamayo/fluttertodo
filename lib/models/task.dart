class Task {
  final String title;
  final String body;

  Task(this.title, this.body);

  toJSONEncodable() {
    Map<String, dynamic> mappedTask = {};

    mappedTask['title'] = title;
    mappedTask['body'] = body;

    return mappedTask;
  }
}
