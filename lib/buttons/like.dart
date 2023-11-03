import 'package:flutter/material.dart';
import 'package:hello_flutter/main.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  final bool liked;
  final String word;
  final String text;

  LikeButton({
    super.key,
    required this.liked,
    this.word = '',
    this.text = 'Like',
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool liked;
  late String word;
  late String text;

  @override
  void initState() {
    super.initState();
    liked = widget.liked;
    word = widget.word;
    text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    IconData icons;
    if (liked) {
      icons = Icons.favorite;
    } else {
      icons = Icons.favorite_border;
    }

    var appState = context.watch<MyAppState>();

    return ElevatedButton.icon(
      onPressed: () {
        print('like button pressed!');
        appState.toggleFavorite(word.isNotEmpty ? word : appState.current);
        setState(() {
          liked = !liked;
        });
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
