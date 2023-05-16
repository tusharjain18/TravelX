import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app/views/hotel.dart';

class RecipeApi {
  static Future<List<Hotel>> getRecipe(String query) async {
    var uri = Uri.https('travel-advisor.p.rapidapi.com',
        '/api/v1/hotels/searchLocation', {"query": query});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "676eb17295msh8225b8583bc5643p16ec41jsnff933a681d72",
      "x-rapidapi-host": "tripadvisor16.p.rapidapi.com",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i);
    }

    return Hotel.recipesFromSnapshot(_temp);
  }
}
