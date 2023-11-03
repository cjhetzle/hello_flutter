import 'package:flutter/material.dart';
import 'package:hello_flutter/buttons/next.dart';
import 'package:hello_flutter/buttons/statelesslikebutton.dart';
import 'package:hello_flutter/labels/bigcard.dart';
import 'package:hello_flutter/main.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var word = appState.current;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('A random idea:'),
          BigCard(word: word),
          SizedBox(height: 10),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              StatelessLikeButton(),
              NextButton(),
            ],
          ),
        ],
      ),
    );
  }
}
