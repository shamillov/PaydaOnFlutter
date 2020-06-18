import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payda/models/activeDonationData.dart';
import 'package:payda/models/testModel.dart';
import 'package:payda/services/getActiveDonationService.dart';

class ActiveDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ActiveDonationList()
    );
  }
}

class ActiveDonationList extends StatelessWidget {

  var response = GetActiveDonationService.fetchActiveDonation();

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
                              child: Icon(Icons.person, color: Colors.grey,),
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
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: RaisedButton(
                                onPressed: (){
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text("Button is clicked: $index"))
                                  );
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text("Помочь"),
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
                        child: FutureBuilder<List<ActiveDonationData>>(
                          future: response,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(snapshot.data[index].donationTitle);
                            } else {
                              return Text("Название фонда");
                            }
                            },
                        ),
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
        )
    );
  }
}