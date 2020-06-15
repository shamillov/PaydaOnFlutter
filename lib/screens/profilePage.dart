import 'package:flutter/material.dart';

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
          style: TextStyle(color: Colors.black54, fontSize: 22, fontStyle: FontStyle.italic),),
      ),
    );
  }
}