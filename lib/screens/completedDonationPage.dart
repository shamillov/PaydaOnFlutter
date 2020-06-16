import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompletedDonationList(),
    );
  }
}

class CompletedDonationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(6),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(Icons.person),
                            margin: EdgeInsets.only(right: 4),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Название фонда"),
                              Text("Локация", style: TextStyle(fontSize: 12, color: Colors.black54))
                            ],
                          ),
                          Spacer(),
                          Align(alignment: Alignment.centerRight, child: Icon(Icons.reply, color: Colors.grey))
                        ],
                      ),
                    ),
                    Container(
                        height: 300,
                        color: Colors.grey
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("131123", style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold)),
                              Text("собрано", style: TextStyle(fontSize: 12, color: Colors.black54))
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Сбор завершен"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1000000", style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold)),
                              Text("цель", style: TextStyle(fontSize: 12, color: Colors.black54))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Text("Название сбора", style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      child: Text("Описание сбора, описание сбора"),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}