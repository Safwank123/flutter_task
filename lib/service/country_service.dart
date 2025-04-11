import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryService {
  static Future<List<String>> fetchCountrySuggestions(String input) async {
    if (input.isEmpty) return [];

    final url = 'https://restcountries.com/v3.1/name/$input';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map<String>((e) => e['name']['common'].toString()).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
