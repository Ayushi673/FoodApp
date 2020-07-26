import 'dart:convert';
import 'package:foodapp/cookbook.dart';
import 'database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MyRecipe myRecipe;
  var url= "https://recipesapi.herokuapp.com/api/search";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    var res= await http.get(url);
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
      GridView.count(crossAxisCount: 2,
        children: myRecipe.recipes.map((rec)=>
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CookBook(recipes: rec)));
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
                            height: 130,
                            width: 130,
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
      drawer: Drawer(),
    );
  }
}
