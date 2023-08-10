import 'dart:convert';
import 'dart:developer';

import 'package:events/screen/SearchScreen.dart';
import 'package:events/utils/services.dart';
import 'package:events/utils/utils.dart';
import 'package:events/widget/EventWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<void> dataFetchingFuture;
  // This dynamic List will store all the data
  static List<dynamic> eventData = [];

  @override
  void initState() {
    super.initState();
    var sv = DataServices();
    dataFetchingFuture = sv.fetchData("no");
  }

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: Utils.style1,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: Icon(Icons.search)),
              const SizedBox(width: 5),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          )
        ],
      ),
      body: FutureBuilder<void>(
        future: dataFetchingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error occurred while fetching data!'));
          }
          return Scrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              itemExtent: HEIGHT / 6 - 7,
              itemCount: eventData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: EventWidget(
                    title: eventData[index]['title'],
                    description: eventData[index]['description'],
                    imageUrl: eventData[index]['banner_image'].toString(),
                    date_time: eventData[index]['date_time'],
                    organiser_name: eventData[index]['organiser_name'],
                    organiser_icon: eventData[index]['organiser_icon'],
                    venue_name: eventData[index]['venue_name'],
                    venue_city: eventData[index]['venue_city'],
                    venue_country: eventData[index]['venue_country'],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

//Calling the API and fetching the Data
}
