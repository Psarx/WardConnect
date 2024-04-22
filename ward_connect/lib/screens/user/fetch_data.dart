import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future fetchData(url) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('Authorization');
    String? user = prefs.getString('user');
    // Your token
    // Set up the authorization header
    Map<String, String> headers = {
      'Authorization': token ?? "",
      'user': user ?? "",
    };

    // Make the HTTP request with the authorization header
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    return response;
  } catch (e) {
    print('Error: $e');
  }
}
