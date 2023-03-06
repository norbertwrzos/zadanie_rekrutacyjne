import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            Text(
              AppLocalizations.of(context).outlierValue,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 50),
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
