import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedDonationPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Completed Donation",
          style: TextStyle(color: Colors.black54, fontSize: 22, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}