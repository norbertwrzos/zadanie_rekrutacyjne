import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:zadanie/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).title,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
          Locale('pl'), // Polish
        ],
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final TextEditingController _controller = TextEditingController();
final List<int> numbers = _controller.text.split(',').map(int.parse).toList();
final int outlier = findOutlier(numbers);

@override
void dispose() {
  _controller.dispose();
  dispose();
}

int findOutlier(List<int> numbers) {
  int evenCount = 0;
  int oddCount = 0;
  int? even;
  int? odd;

  for (final int number in numbers) {
    if (number.isEven) {
      evenCount++;
      even = number;
    } else {
      oddCount++;
      odd = number;
    }
  }

  if (evenCount > 1 && oddCount == 1) {
    return odd!;
  } else if (oddCount > 1 && evenCount == 1) {
    return even!;
  }

  return 0;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 200,
                child: Text(AppLocalizations.of(context).title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 50, color: Colors.blue))),
            Container(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  label: Text(
                    AppLocalizations.of(context).inputNums,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)))),
              onPressed: () {
                final List<int> numbers =
                    _controller.text.split(',').map(int.parse).toList();
                final int outlier = findOutlier(numbers);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(outlier: outlier),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context).searchOutlier,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
