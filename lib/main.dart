import 'dart:convert';
import 'package:foodapp/cookbook.dart';
import 'database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'searchedfood.dart';

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
String foodname;
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future navigateToSubPage(context, foodname) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => SearchPage(foodname),
        )
    );
  }

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.brown.shade800,
        title: Text('Yummm'),
      ),
      body: myRecipe==null? /*Center(
        child: CircularProgressIndicator(),
      )*/
      Wait()
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
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://st.depositphotos.com/1761693/4692/i/950/depositphotos_46927675-stock-photo-italian-food-pizza-with-salami.jpg'),
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  foodname=value;
                },
                decoration: InputDecoration(
                  icon: GestureDetector(
                    onTap: (){
                      print(foodname);
                      navigateToSubPage(context, foodname);

                    },
                      child: CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                          child: Icon(Icons.search,
                            color:Colors.white,
                            size: 30,))),
                    filled: true,
                  fillColor: Colors.brown.shade100,
                  hintText: 'Search for food',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


