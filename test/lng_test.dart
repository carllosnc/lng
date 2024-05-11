import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lng/lng.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LngMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lng Test'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              openLng(
                context: context,
                title: 'Set language',
                titleStyle: const TextStyle(
                  fontSize: 18,
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          lng.get('text'),
        ),
      ),
    );
  }
}

void main() {
  testWidgets("Check initial render", (widgetTester) async {
    lngCore.init(defaultLang: 'en');
    lng.addLabels({
      'en': {
        'es': 'Spanish',
        'en': 'English',
        'text': 'Hello World',
      },
      'es': {
        'es': 'Español',
        'en': 'Inglés',
        'text': 'Hola Mundo',
      },
    });

    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Hello World'), findsOneWidget);
    expect(find.text('Lng Test'), findsOneWidget);

    //open modal
    await widgetTester.tap(find.byIcon(Icons.language));
    await widgetTester.pumpAndSettle();

    expect(find.text('Set language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Spanish'), findsOneWidget);

    //change language to Spanish
    await widgetTester.tap(find.text('Spanish'));
    await widgetTester.pumpAndSettle();

    expect(find.text('Set language'), findsNothing);
    // expect(find.text('Hola Mundo'), findsOneWidget);
    // expect(find.text('Lng Test'), findsOneWidget);
  });
}
