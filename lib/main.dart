import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(17.0),
        itemBuilder: (BuildContext _context, int i){
          if(i.isOdd){
            return new Divider();
          }
          final int index = i ~/2;
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(15));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Name Generator - Study Jam'),
      ),
      body: _buildSuggestions(),
    );
  }
}


