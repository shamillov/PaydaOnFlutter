import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payda/models/testModel.dart';
import 'package:http/http.dart' as http;
import 'package:payda/services/getActiveDonationService.dart';

class ActiveDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ActiveDonationList()
    );
  }
}

Future<http.Response> fetchData() async {
  var response = await http.get(GetActiveDonationService.baseUrl);

  if(response.statusCode == 200) {
    print("SUCCESSFUL");
    return response;
  } else {
    return throw Exception("RESPONSE ERROR");
  }
}

class ActiveDonationList extends StatelessWidget {

  var response = fetchData();

  final list = <TestModel>[
    TestModel("shamil", 24),
    TestModel("uvais", 24),
    TestModel("shamil", 24),
    TestModel("uvais", 24)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: list.length,
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
                      child: FutureBuilder<http.Response>(
                        future: response,
                        builder: (context, snapshot) {
                          return Text(snapshot.data.body.toString());
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