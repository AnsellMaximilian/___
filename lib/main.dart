import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/item.dart';
import 'models/category.dart';
import 'pages/list.dart';
import 'pages/settings.dart';
import 'pages/detail.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pudding 18',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Pudding 18'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Map<String, List<dynamic>>> _itemsAndCategories;

  void initState(){
    super.initState();
    _itemsAndCategories = fetchItemsAndCategories();
  }

  Future<Map<String, List<dynamic>>> fetchItemsAndCategories() async{
    final response = await http.get('https://pudding18.herokuapp.com/api/items');
    final json = jsonDecode(response.body);
    List<Item> items = List<Item>.from(json['items'].map((item) => Item.fromJson(item)));
    List<Category> categories = List<Category>.from(json['categories'].map((cat) => Category.fromJson(cat)));
    categories.sort((a,b) => a.name == "Pudding" ? -1 : 1);
    categories.sort((a,b) => a.name == "Coupon" ? 1 : -1);

    return {
      "items": items,
      "categories": categories
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  'app-logo.png',
                  fit: BoxFit.contain,
                  height: 35,
                ),
                margin: EdgeInsets.only(right: 25.0),
              ),
              Text(widget.title)
            ],
          )
        ),
      ),

      body: FutureBuilder<Map<String, List<dynamic>>>(
        future: _itemsAndCategories,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(vertical: 15),
                            color: Colors.green[400],
                            child: Text(
                              "Welcome, Pudding Lovers",
                              style: TextStyle(color: Colors.white),
                            )
                          ),
                        )
                      ],
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                      ),
                      items: snapshot.data['items'].where((item) => item.categoryName == 'Billboard').map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 2.5),
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Detail(item: i)),
                                  );
                                },
                                child: Image.network(i.image, fit: BoxFit.contain)
                              )
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: FlatButton(
                              color: Colors.lightGreenAccent[700],
                              padding: EdgeInsets.all(15),
                              onPressed: (){},
                              child: Row(children: [Icon(Icons.motorcycle, color: Colors.white), Text('FREE DELIVERY', style: TextStyle(color: Colors.white))],)
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: FlatButton(
                              color: Colors.blue[700],
                              padding: EdgeInsets.all(15),
                              onPressed: (){},
                              child: Row(children: [Icon(Icons.store, color: Colors.white,), Text('TAKEAWAY', style: TextStyle(color: Colors.white))],)
                            )
                          )
                        ],
                      )
                    )
                  ],
                ),
                // SECOND ROW
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Colors.green[400],
                                child: Text(
                                  "Promotions",
                                  style: TextStyle(color: Colors.white),
                                )
                              ),
                            )
                          ],
                    ),
                        CarouselSlider(
                          options: CarouselOptions(height: 200.0),
                          items: snapshot.data['items'].where((item) => item.categoryName == 'Promo').map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Detail(item: i)),
                                      );
                                    },
                                    child: Image.network(i.image, fit: BoxFit.contain)
                                  )
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.symmetric(vertical: 15),
                                color: Colors.green[400],
                                child: Text(
                                  "Value Deals",
                                  style: TextStyle(color: Colors.white),
                                )
                              ),
                            )
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(height: 200.0),
                          items: snapshot.data['items'].where((item) => item.categoryName == 'Value Deal').map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 2.5),
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Detail(item: i)),
                                      );
                                    },
                                    child: Image.network(i.image, fit: BoxFit.contain)
                                  )
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  color: Colors.green[400],
                                  child: Text(
                                    "Explore From Categories",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ),
                              )
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            children: snapshot.data['categories'].where((cat) => (cat.promo ?? false) == false).map((cat){
                              return Container(
                                color: Colors.green[100],
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        Map<String, List<dynamic>> itemsAndCategories = await _itemsAndCategories;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MenuList(itemsAndCategories: itemsAndCategories,)),
                                        );
                                      },
                                      child: Container(
                                        // color: Colors.red,
                                        child: Image.network(cat.image, height: 64)
                                      )
                                    ),
                                    Text(cat.name)
                                  ]
                                )
                              );
                            }).toList(),
                          )
                        ],
                      )
                    )
                  ],
                )
              ],
            );
          }else if(snapshot.hasError){

          }
          return Center(child: CircularProgressIndicator());
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, List<dynamic>> itemsAndCategories = await _itemsAndCategories;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuList(itemsAndCategories: itemsAndCategories,)),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.fastfood)
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: "Near By",
            icon: Icon(Icons.map_outlined)
          ),
          BottomNavigationBarItem(
            label: "Menu",
            icon: Icon(Icons.fastfood, color: Colors.white,)
          ),
          BottomNavigationBarItem(
            label: "Find",
            icon: Icon(Icons.ballot_outlined)
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            )
          )
        ],
        currentIndex: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
