// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String userId;
  String description;
  String title;
  String url;
  String createdAt;
  String category;

  DetailScreen(
      {super.key,
      required this.description,
      required this.title,
      required this.url,
      required this.userId,
      required this.category,
      required this.createdAt});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .06),
                      ReuseAbleRow(
                          title: 'Cases', value: widget.userId.toString()),
                      ReuseAbleRow(
                          title: 'totalDeaths', value: widget.title.toString()),
                      ReuseAbleRow(
                          title: 'active',
                          value: widget.description.toString()),
                      ReuseAbleRow(
                          title: 'critical', value: widget.category.toString()),
                      ReuseAbleRow(
                          title: 'totalRecovered',
                          value: widget.createdAt.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.url,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ReuseAbleRow extends StatelessWidget {
  String title, value;

  ReuseAbleRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(height: 5),
          const Divider()
        ],
      ),
    );
  }
}
