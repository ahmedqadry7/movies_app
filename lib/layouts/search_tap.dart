// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import '../screen/movie_details_screen.dart';

class SearchTap extends StatefulWidget {
  SearchTap({super.key});

  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  String query = '';

  //TextEditingController q = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          actions: [
            Container(
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff514F4F),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )),
                onChanged: (String value) {
                  query = value;
                  ApiManager.searchData(query);
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: ApiManager.searchData(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Something Went Wrong'));
                }
                var data = snapshot.data?.results ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // return
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MovieDetailsScreen.routeName,
                            arguments: {
                              'id': data[index].id,
                              'title':  data[index].title,
                            },
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 100,
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original${data[index].backdropPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                       data[index].title??'',
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    Text(
                                      data[index].releaseDate??'',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                  ),
                );
              },
            )
          ],
        ));
  }
}
