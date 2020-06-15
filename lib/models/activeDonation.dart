import 'images.dart';

class ActiveDonationData {
  String fundLogo;
  String fundName;
  String fundLocation;
  List<Images> images;
  String donationTitle;
  String donationDescription;
  int donationAmount;
  int donationProgress;

  ActiveDonationData({
    this.fundLogo,
    this.fundName,
    this.fundLocation,
    this.images,
    this.donationTitle,
    this.donationDescription,
    this.donationAmount,
    this.donationProgress});
}