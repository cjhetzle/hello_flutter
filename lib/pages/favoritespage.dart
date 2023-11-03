import 'package:flutter/material.dart';
import 'package:hello_flutter/buttons/like.dart';
import 'package:hello_flutter/labels/smallcard.dart';
import 'package:hello_flutter/main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> favorites = MyAppState.favorites;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmallCard(word: 'Favorites'),
        for (String pair in favorites)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LikeButton(liked: true, word: pair, text: pair),
          ),
      ],
    ));
  }
}
