import 'package:flutter/material.dart';
import '../models/item.dart';

class Detail extends StatelessWidget{
  Detail({Key key, this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Expanded(child: Image.network(item.image, width: 96),)]),
            Text(item.ingredients ?? item.description ?? "HELLO"),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text("Rp. ${item.harga.toString()},00", style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold),),
                  FlatButton(
                    color: Colors.lightGreenAccent[700],
                    onPressed: (){},
                    child: Text("ADD TO ORDER", style: TextStyle(color: Colors.white),)
                  )
                ]
              )
            )
          ],
        )
      ),
    );
  }
}