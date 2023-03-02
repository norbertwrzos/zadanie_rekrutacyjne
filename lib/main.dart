import 'package:flutter/material.dart';
import 'package:zadanie/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
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
            Container(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Wprowadź liczby po przecinku",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
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
                  child: const Text(
                    "Wyszukaj",
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
