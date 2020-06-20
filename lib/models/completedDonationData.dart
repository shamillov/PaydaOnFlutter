import 'images.dart';

class CompletedDonationData {
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

  CompletedDonationData({
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
}