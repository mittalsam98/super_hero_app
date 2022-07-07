import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/json_parsing/Hero.dart';
import 'package:http/http.dart' as http;

class HeroSearchDelegate extends SearchDelegate<Result> {
  SuperHero heroesList;
  Result selectedResult;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Select from the provided options',
          style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.grey[800]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future getAllHeroList() async {
      if (query.length > 0) {
        try {
          var list = await http.get(
              'https://www.superheroapi.com/api.php/836211930121768/search/$query');
          Map<String, dynamic> jsonResponse = json.decode(list.body);
          if (jsonResponse.containsKey('error')) {
            List weightData = List();
            jsonResponse.forEach((k, v) => weightData.add(k));
            return weightData;
          }
          heroesList = await superHeroFromJson(list.body);
          return heroesList.results;
        } catch (e) {
          return e.toList();
        }
      }
    }

    return FutureBuilder(
      future: getAllHeroList(),
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Input a URL to start');
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          case ConnectionState.active:
            return new Text('');
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        size: 30,
                        color: Colors.red.withOpacity(0.7),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your connection is not stable :(',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[800]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data.contains('error')) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'No superhero found for the given name',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[800]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedResult = snapshot.data[index];
                      query = selectedResult.name;
                      close(context, selectedResult);
                    },
                    child: Card(
//                    margin: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                      elevation: 3,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        child: Center(
                          child: Text(
                            snapshot.data[index].name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    'Search all SuperHeroes and Villians data from all universes',
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[800]),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
