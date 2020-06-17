import 'package:http/http.dart' as http;

class GetActiveDonationService {
  static var baseUrl = "http://paydatest-env.eba-rjmpfuvm.us-east-2.elasticbeanstalk.com/api/fees";
  Future<http.Response> fetchActiveDonation() async {
    var response = await http.get(baseUrl);

    if(response.statusCode == 200) {
      return response;
    } else {
      return throw Exception("Response fail");
    }
  }
}