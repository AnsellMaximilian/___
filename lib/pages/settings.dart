import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings>{
  bool _ansellMax = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
              ),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Languages', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("English")
                      ],
                    ),
                  ),
                  Switch(
                    value: _ansellMax,
                    onChanged: (value){
                      setState(() {
                        _ansellMax = value;
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5), 
                    child: Text('LOG IN', style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
              ),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CONTACT US', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("We would love to hear what you think about Pudding18")
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5), 
                    child: Text('COMPANY HISTORY', style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5), 
                    child: Text('NEWS & UPDATES', style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5), 
                    child: Text('PRIVACY POLICY', style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border( bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)))
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5), 
                    child: Text('TERMS OF USE', style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ],
            )
          ],
        )
      ),
    );
  }
}