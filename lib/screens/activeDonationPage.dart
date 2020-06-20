import 'package:carousel_slider/carousel_slider.dart';
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
                  ? _ActiveDonationList(donationList: snapshot.data)
                  : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}

class _ActiveDonationList extends StatelessWidget {
  _ActiveDonationList({Key key, this.donationList}) : super(key: key);

  List<ActiveDonationData> donationList;

  List<String> images = [
    "https://bobak.ru/wp-content/gallery/oboi-800x600/wallpaper800_11.jpg",
    "https://bobak.ru/wp-content/gallery/oboi-800x600/wallpaper800_13.jpg",
    "https://bobak.ru/wp-content/gallery/oboi-800x600/wallpaper800_14.jpg",
    "https://bobak.ru/wp-content/gallery/oboi-800x600/wallpaper800_15.jpg"
  ];

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
                              child: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
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
                            Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  constraints: BoxConstraints(minWidth: 10, minHeight: 10),
                                  icon: Icon(Icons.reply, color: Colors.grey),
                                  onPressed: (){
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text("Share button"))
                                    );
                                  },
                                )
                            )
                          ]
                        )
                      ),
                      Container(
                        child: _ImageSlider(images: images),
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
                                    donationList[index]
                                        .donationProgress
                                        .toInt()
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold)),
                                Text("собрано", style: TextStyle(fontSize: 12, color: Colors.black54))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                onPressed: () {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content:
                                          Text("Button is clicked: $index")));
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
                                    donationList[index]
                                        .donationAmount
                                        .toInt()
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold)),
                                Text("цель", style: TextStyle(fontSize: 12, color: Colors.black54))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Center(
                        child: Text(donationList[index].donationTitle,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.all(6),
                        child: Text(donationList[index].donationDescription),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

class _ImageSlider extends StatelessWidget {
  _ImageSlider({Key key, this.images}) : super(key: key);

  List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1.0,
          ),
          items: images.map((item) => Container(
            child: Center(
                child: Image.network(item, fit: BoxFit.cover, width: 1000,)))).toList(),
    ));
  }
}
