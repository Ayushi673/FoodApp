import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database.dart';


class CookBook extends StatefulWidget {

  final Recipes recipes;

  CookBook({this.recipes});

  @override
  _CookBookState createState() => _CookBookState();
}

class _CookBookState extends State<CookBook> {


  BodyWidget()=>Stack(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag:widget.recipes.imageUrl,
                  child: Image.network(widget.recipes.imageUrl,fit: BoxFit.contain,)),
              Text(widget.recipes.title, textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),),
              SizedBox(height: 8),
              Text("Publisher: ${widget.recipes.publisher}",textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text("Social Rank: ${widget.recipes.socialRank.toInt().toString()}",textAlign: TextAlign.center),
            ],
          ),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade800,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown.shade800,
        title: Text(widget.recipes.title),
      ),
      body:BodyWidget(),
    );
  }
}



