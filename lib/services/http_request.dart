import 'package:http/http.dart' as httpClient;

class HttpService {
  static Future get(String location, {Map<String, String>? headers}) async {
    var url = Uri.parse(location);
    try {
      return httpClient.get(url, headers: headers);
    } catch (e) {
      return e;
    }
  }
}
