/*https://medium.com/swlh/testing-in-flutter-ef7d509f3f75*/
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/widgets/add_task_form_widget.dart';
import 'package:fluttertodo/services/localizations_injected.dart';

void main() {
  group('fields validation', () {
    test('empty title', () {
      var title = TitleValidator.validate('');
      expect(title, 'Title can\'t be empty');
    });
    test('non empty title', () {
      var title = TitleValidator.validate('title');
      expect(title, null);
    });
    test('empty body', () {
      var body = BodyValidator.validate('');
      expect(body, 'Body can\'t be empty');
    });
    test('non empty body', () {
      var body = BodyValidator.validate('body');
      expect(body, null);
    });
  });
}
