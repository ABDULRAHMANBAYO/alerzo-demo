import 'package:http/http.dart' as httpClient;

class HttpService {
  static Future post(String location,
      {dynamic bodyData, Map<String, String>? headers}) async {
    var url = Uri.parse(location);
    Map<String, String> _headers = Map<String, String>();
    _headers.putIfAbsent('Content-Type', () => 'application/json');
    if (headers != null) _headers.addAll(headers);
    try {
      return httpClient.post(url, headers: _headers, body: bodyData);
    } catch (e) {
      return e;
    }
  }
}
