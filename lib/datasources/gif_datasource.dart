import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSource {
  final String apiKey = "FlcbU4kRveMJPkFLmeIb8cJNeT9bHm3n";

  Future<Map> getGifs({String search = '', int offset = 0}) async {
    http.Response response;

    if (search.isEmpty) {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=$apiKey&limit=20&rating=G"));
    } else {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$search&limit=19&offset=$offset&rating=G&lang=en"));
    }

    return json.decode(response.body);
  }
}
