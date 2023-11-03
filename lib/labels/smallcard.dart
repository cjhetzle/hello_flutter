import 'package:flutter/material.dart';
import 'package:hello_flutter/buttons/like.dart';
import 'package:hello_flutter/main.dart';
import 'package:provider/provider.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
    required this.word,
  });

  final String word;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          word,
          style: style,
          //semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
