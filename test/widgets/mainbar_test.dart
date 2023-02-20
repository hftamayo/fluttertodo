import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/widgets/mainbar_widget.dart';
import 'package:fluttertodo/services/localizations_injected.dart';

void main() {
  group('mainbar', () {
    testWidgets('widget render', (WidgetTester tester) async {
      await tester.pumpWidget(const LocalizationsInjected(child: MainBar()));
      expect(find.byType(MainBar), findsOneWidget);
    });

    testWidgets('displaying three action buttons', (WidgetTester tester) async {
      await tester.pumpWidget(const LocalizationsInjected(child: MainBar()));
      expect(find.widgetWithIcon(MainBar, Icons.brush), findsOneWidget);
      expect(find.widgetWithIcon(MainBar, Icons.arrow_circle_left),
          findsOneWidget);
      expect(find.widgetWithIcon(MainBar, Icons.arrow_circle_right),
          findsOneWidget);
    });

    /* evaluar si es viable testear los clicks de los appbar actions */

    // testWidgets('switch to spanish on click', (WidgetTester tester) async {
    //   bool pressed = false;
    //   await tester.pumpWidget(const LocalizationsInjected(child: MainBar(
    //     onPressed: () => pressed = true,
    //   )));
    //   await tester.tap(find.widgetWithIcon(MainBar, Icons.arrow_circle_left));
    //   await tester.pump();
    //   expect(pressed, true);
    // });
  });
}

// por favor considerar usar este enfoque tambien:
// await tester.pumpWidget(
// MultiProvider(
//   providers: [
//     FutureProvider(create: (context) => geolocatorService.getlocation()),
//     ProxyProvider<Position, Future<NewsModel>>(
//       update: (context, position, news) {
//         return (position != null) ? newsService.getNews() : null;
//       },
//     ),
//     child: homePage,
//   ),
// );
