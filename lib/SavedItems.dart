
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedItem extends StatelessWidget{
  final Set<WordPair> savedItems;
  SavedItem({Key key, @required this.savedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = savedItems.toList();

    return Scaffold(

           appBar:AppBar(
             title: Text("Saved Items"),
           ),
         body: ListView.builder(
             padding: const EdgeInsets.all(18.0),
             itemBuilder: (context,i){
                   if(i<list.length) {
                     return ListTile(
                       title: Text(list[i].asPascalCase),
                     );
                   }else{
                     return null;
                   }

             }),
    );
  }

}