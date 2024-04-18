// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class SearchTap extends StatelessWidget {
  SearchTap({super.key});

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
                // controller: q.text,
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
                      return Text(data[index].title??'no data');
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
