import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: (text) {
            setState(() {
              searchText = text;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Center(
        child: Text(
          'Search results for: $searchText',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
