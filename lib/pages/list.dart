import 'package:flutter/material.dart';
import 'detail.dart';

class MenuList extends StatelessWidget{
  MenuList({Key key, this.itemsAndCategories}) : super(key: key);

  final Map<String, List<dynamic>> itemsAndCategories;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: ListView(
        children: itemsAndCategories['categories'].where((cat) => cat.name != 'Coupon' && cat.name != "Billboard").map((cat){
          final items = itemsAndCategories['items'].where((item) => (item.categoryName == cat.name)).map((item){
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(item: item)),
                );
              },
              child: Row(
                children: [
                  Image.network(item.image, width: 64),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(item.ingredients ?? (item.description ?? "NADA"), textAlign: TextAlign.start),
                          (item.categoryName != "Promo" && item.categoryName != "Value Deal") ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Rp. ${item.harga.toString()},00", style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold),),
                                FlatButton(
                                  color: Colors.lightGreenAccent[700],
                                  onPressed: (){},
                                  child: Text("ADD TO ORDER", style: TextStyle(color: Colors.white),)
                                )
                              ],
                            )
                            :
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PROMO", style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold),),
                                FlatButton(
                                  color: Colors.lightGreenAccent[700],
                                  onPressed: (){},
                                  child: Text("USE PROMO", style: TextStyle(color: Colors.white),)
                                )
                              ],
                            )
                        ],
                      )
                    )
                  )
                ],
              )
            );
          });
          return Column(
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
                        cat.name,
                        style: TextStyle(color: Colors.white),
                      )
                    ),
                  )
                ],
              ),
              Column(
                // shrinkWrap: true,
                children: items.toList(),
              )
            ],
          );
        }).toList()
      ),
    );
  }

}