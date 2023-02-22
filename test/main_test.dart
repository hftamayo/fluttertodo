import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/main.dart';
import 'package:fluttertodo/provider/tasks_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "FlutterTodo main class",
    (WidgetTester tester) async {
      await tester.pumpWidget(MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => TasksProvider())
      ], child: const MyApp()));
      expect(find.byType(MyApp), findsOneWidget);
    },
  );
}
