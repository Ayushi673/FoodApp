import 'dart:convert';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class SearchPage extends StatefulWidget {
  SearchPage(foodname);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  MyRecipe myRecipe;
  var url1= "https://recipesapi.herokuapp.com/api/search?q=$foodname&page=1";
  @override
  void initState() {
    super.initState();
    fetchData();
    print('init');
    print(foodname);
  }

  void fetchData() async{
    var res= await http.get(url1);
    var decodedData=jsonDecode(res.body);
    myRecipe=MyRecipe.fromJson(decodedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade800,
        title: Text('Yummm'),

      ),
      body: myRecipe==null? Center(
        child: CircularProgressIndicator(),
      )
          :
      GridView.count(crossAxisCount: 1,
        children: myRecipe.recipes.map((rec)=>
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CookBook1(recipes: rec)));
                },
                child: Hero(
                  tag: rec.imageUrl,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 250,
                            width: 500,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(rec.imageUrl),
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(rec.title, textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        ).toList(),
      ),
    );
  }
}



class CookBook1 extends StatefulWidget {

  final Recipes recipes;

  CookBook1({this.recipes});

  @override
  _CookBook1State createState() => _CookBook1State();
}

class _CookBook1State extends State<CookBook1> {


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
              Text("Social Rank: ${widget.recipes.socialRank}",textAlign: TextAlign.center),
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



