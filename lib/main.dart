import 'package:flutter/material.dart';
import 'screens/activeDonationPage.dart';
import 'screens/completedDonationPage.dart';
import 'screens/profilePage.dart';

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
