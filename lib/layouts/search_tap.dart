// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
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
                  hintText: 'find a movie...',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (String value) {
                  query = value;
                  ApiManager.searchData(query);
                  setState(() {});
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                cursorColor: Colors.yellow,
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              FutureBuilder(
                future: ApiManager.searchData(query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something Went Wrong'),
                    );
                  }
                  var data = snapshot.data?.results ?? [];
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 3,
                              height: 4,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                      itemBuilder: (context, index) {
                        // return
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MovieDetailsScreen.routeName,
                              arguments: {
                                'id': data[index].id,
                                'title': data[index].title,
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
                                  child: data[index].backdropPath != null
                                      ? CachedNetworkImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/original${data[index].backdropPath ?? ""}',
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(color: Colors.yellow,),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )
                                      : Center(
                                          child: Text(
                                            'No Image available',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          data[index].title ?? '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        data[index].releaseDate ?? '',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
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
          ),
        ));
  }
}
