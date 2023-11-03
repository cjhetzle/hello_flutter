import 'package:flutter/material.dart';
import 'package:hello_flutter/main.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return ElevatedButton(
      onPressed: () {
        print('next button pressed!');
        appState.getNext();
      },
      child: Text('Next'),
    );
  }
}
