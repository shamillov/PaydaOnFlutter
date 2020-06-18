import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:payda/models/activeDonationData.dart';

class GetActiveDonationService {
  static const baseUrl = "http://paydatest-env.eba-rjmpfuvm.us-east-2.elasticbeanstalk.com/";

  static Future<List<ActiveDonationData>> fetchActiveDonation() async {
    var response = await http.get(baseUrl + "api/fees");

    if(response.statusCode == 200) {
      print("SUCCESSFUL");
      return compute(parseData, response.body);
    } else {
      print("FAIL");
      return throw Exception("Response fail");
    }
  }

  static List<ActiveDonationData> parseData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<ActiveDonationData>((json) => ActiveDonationData.fromJson(json)).toList();
  }
}