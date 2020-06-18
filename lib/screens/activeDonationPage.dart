import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payda/models/activeDonationData.dart';
import 'package:payda/services/getActiveDonationService.dart';

class ActiveDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FutureBuilder<List<ActiveDonationData>>(
            future: GetActiveDonationService.fetchActiveDonation(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ActiveDonationList(donationList: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        )
    );
  }
}

class ActiveDonationList extends StatelessWidget {

  ActiveDonationList({Key key, this.donationList}) : super(key: key);

  List<ActiveDonationData> donationList;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: donationList.length,
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
                                Text(
                                    donationList[index].donationProgress.toInt().toString(),
                                    style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold)
                                ),
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
                                Text(
                                    donationList[index].donationAmount.toInt().toString(),
                                    style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold)
                                ),
                                Text("цель", style: TextStyle(fontSize: 12, color: Colors.black54))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Center(
                        child: Text(
                            donationList[index].donationTitle,
                            style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6),
                        child: Text(donationList[index].donationDescription),
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