import 'package:flutter/material.dart';
import 'package:hello_flutter/main.dart';
import 'package:provider/provider.dart';

class StatelessLikeButton extends StatelessWidget {
  final String text;

  StatelessLikeButton({
    super.key,
    this.text = 'Like',
  });

    @override
  Widget build(BuildContext context) {
    IconData icons;
    var appState = context.watch<MyAppState>();

    if (appState.isFavorite()) {
      icons = Icons.favorite;
    } else {
      icons = Icons.favorite_border;
    }

    return ElevatedButton.icon(
      onPressed: () {
        print('like button pressed!');
        appState.toggleFavorite(appState.current);
      },
      icon: Icon(icons),
      label: SizedBox(
          child: Text(
        text,
        overflow: TextOverflow.fade,
        maxLines: 1,
      )),
    );
  }
}

