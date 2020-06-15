import 'package:flutter/material.dart';
import 'package:payda/models/testModel.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Payda",
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final tabs = [
    DonationPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabs[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }
}

class DonationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DonationTabs();
  }
}

class DonationTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payda"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "Active",),
              Tab(text: "Completed",)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveDonationPage(),
            CompletedDonationPage()
          ],
        ),
      ),
    );
  }
}

class ActiveDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActiveDonationList()
    );
  }
}

class ActiveDonationList extends StatelessWidget {

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
                    margin: EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Название фонда"),
                            Text("Локация", style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.grey
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("131123", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            Text("собрано", style: TextStyle(fontSize: 12),)
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: RaisedButton(
                            onPressed: (){},
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text("Помочь"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1000000", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("цель", style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Center(
                    child: Text("Название сбора", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Container(
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

class CompletedDonationPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Completed Donation",
          style: TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic),
        ),
      ),
      backgroundColor: Colors.pink,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payda"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic),),
      ),
      backgroundColor: Colors.green,
    );
  }
}
