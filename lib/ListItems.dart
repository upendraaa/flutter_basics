import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_basics/SavedItems.dart';

class Namer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return MaterialApp(
          title: "Flutter app",
          home: Scaffold(
             body: Center(
               child: RandomWords() ,
             )
          ),

    );
  }
}

class RandomWordState extends State<RandomWords>{
   final suggestions = <WordPair>[];
   final  savedPair = Set<WordPair>();
   final fontSize = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
                title: Text("Random Names"),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.list), onPressed: pushSaved)
                ],
             ),

       body:  ListView.builder(
           padding: const EdgeInsets.all(16.0),
           itemBuilder: (context,i){
             if(i.isOdd)
               return Divider();
             final index = i~/2;
             if (index >= suggestions.length) {
               suggestions.addAll(generateWordPairs().take(10));
             }
             return buildItem(suggestions[index]);
           }));

  }

  void pushSaved(){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> SavedItem(savedItems: savedPair)));
  }
   Widget buildItem(WordPair pair) {
    bool alreadySaved = savedPair.contains(pair);
     return ListTile(
       title: Text(
         pair.asPascalCase,
         style: fontSize,
       ),
       trailing: Icon(
         alreadySaved?Icons.favorite:Icons.favorite_border,
         color: alreadySaved?Colors.red:null,
       ),
       onTap: (){
         setState(() {
            if(alreadySaved){
              savedPair.remove(pair);
            }else{
              savedPair.add(pair);
            }
         });
       },
     );
   }

}

class RandomWords extends StatefulWidget{
  @override
  RandomWordState createState()=> RandomWordState();
}