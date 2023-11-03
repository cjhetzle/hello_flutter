import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final supabase = Supabase.instance.client;
bool connectedDB = false;
Future<void> main() async {
  // Make sure to create a .env at project
  // root and create these variables
  await dotenv.load(fileName: '.env');

  String url = dotenv.get("SB_URL");
  String key = dotenv.get('SB_KEY');
  print("connecting db to url: $url");

  await Supabase.initialize(url: url, anonKey: key)
      .then((value) => connectedDB = true);

  print(connectedDB ? 'connected...' : 'unable to connect...');

  if (connectedDB) MyAppState.loadFavorites();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 255, 34, 156)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random().asLowerCase;
  static var favorites = <String>[];

  void getNext() {
    current = WordPair.random().asLowerCase;
    notifyListeners();
  }

  bool isFavorite([String word = '']) {
    if (word.isEmpty) return favorites.contains(current);
    return favorites.contains(word);
  }

  static void loadFavorites() async {
    var words = await supabase.from('favorites').select('words');

    for (var row in words) {
      print(row['words']);
      MyAppState.favorites.add(row['words']);
    }
  }

  void toggleFavorite(String word) async {
    if (favorites.contains(word)) {
      await supabase.from('favorites').delete().match({'words': word});
      print("removing from favorites");
      favorites.remove(word);
    } else {
      await supabase.from('favorites').insert({'words': word});
      print("adding to favorites");
      favorites.add(word);
    }
    notifyListeners();
  }
}
