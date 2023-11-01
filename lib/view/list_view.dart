import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:utsav_cloudrevels_prec/services/state_services.dart';
import 'package:utsav_cloudrevels_prec/view/detailScreen.dart';

import '../services/Utils/app_urls.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<ListViewData> listdata = [];

  Future<List<ListViewData>> getList() async {
    final response = await http.get(Uri.parse(AppUrls.listApi));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        ListViewData listViewData = ListViewData(
          title: i['title'],
          url: i['photo_url'],
          UserId: i['user_id'],
          description: i['description'],
          categories: i['category'],
          createdAt: 'created_at',
        );
        listdata.add(listViewData);
      }
      return listdata;
    } else {
      return listdata;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text('Home List'),
        ),
        body: SafeArea(
            child: Column(children: [
          Expanded(
              child: FutureBuilder(
            future: getList(),
            builder: (context, AsyncSnapshot<List<ListViewData>> snapshot) {
              return ListView.builder(
                  itemCount: listdata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    description: snapshot
                                        .data![index].description
                                        .toString(),
                                    title:
                                        snapshot.data![index].title.toString(),
                                    url: snapshot.data![index].url.toString(),
                                    userId:
                                        snapshot.data![index].UserId.toString(),
                                    category: snapshot.data![index].categories,
                                    createdAt: snapshot.data![index].createdAt
                                        .toString(),
                                  ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString(),
                                scale: 2),
                          ),
                          title: Text(snapshot.data![index].title.toString()),
                          subtitle: Text(
                              snapshot.data![index].description.toString()),
                        ));
                  });
            },
          ))
        ])));
  }
}
