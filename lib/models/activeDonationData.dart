import 'images.dart';
import 'dart:convert';

class ActiveDonationData {
  int id;
  String fundLogo;
  String fundName;
  String fundLocation;
  int fundId;
  List<Images> images;
  String donationTitle;
  String donationDescription;
  double donationAmount;
  double donationProgress;

  ActiveDonationData({
    this.id,
    this.fundLogo,
    this.fundName,
    this.fundLocation,
    this.fundId,
    this.images,
    this.donationTitle,
    this.donationDescription,
    this.donationAmount,
    this.donationProgress});

  factory ActiveDonationData.fromJson(Map<String, dynamic> json) {
    return ActiveDonationData(
      id: json["id"],
      donationTitle: json["name"],
      donationDescription: json["description"],
      donationAmount: json["amount"],
      fundLocation: json["region"],
      fundId: json["fundId"],
      donationProgress: json["donations"]
    );
  }
}