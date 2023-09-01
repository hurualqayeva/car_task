import '../model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<List<Welcome>> getCarName() async {
  String url = "https://api.api-ninjas.com/v1/cars?make=mercedes&limit=10";

  try {
    var res = await http.get(
      Uri.parse(url),
      headers: {
        'X-Api-Key': '7RHCqcjmWHu7eTuOYPnqJQ==sSGCLQtq3sMr38hE',
      },
    );

    var data = convert.jsonDecode(res.body);
    
    if (res.statusCode == 200 && data.isNotEmpty) {
      var welcomeData = data.map<Welcome>((e) => Welcome.fromJson(e)).toList();
      return welcomeData;
    }
  } catch (e) {
    print(e);
  }
  return [];
}
