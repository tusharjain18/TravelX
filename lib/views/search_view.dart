import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/views/hotel.api.dart';
import 'package:travel_app/views/hotel.dart';
import 'package:travel_app/views/hotel_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<Hotel> _recipes;
  bool _isLoading = true;
  late String _query = "";

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getRecipes(String query) async {
    setState(() {
      _isLoading = true;
    });

    _recipes = await RecipeApi.getRecipe(query);
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hotel_class),
            SizedBox(width: 10),
            Text('Hotels')
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "Enter location",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _query = _controller.text.trim();
                        getRecipes(_query);
                      });
                    },
                  )),
            ),
          ),
          _isLoading
              ? Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      return HotelCard(
                          title: _recipes[index].title,
                          secondaryText: _recipes[index].secondaryText,
                          urlTemplate: _recipes[index].image);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
