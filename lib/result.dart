import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int outlier;

  const Result({Key? key, required this.outlier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              'Wartość odstająca: \n \n',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              textAlign: TextAlign.center,
              '$outlier',
              style: const TextStyle(fontSize: 80, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
