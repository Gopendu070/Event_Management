import 'package:events/utils/services.dart';
import 'package:events/utils/utils.dart';
import 'package:events/widget/searchTile.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late Future<void> dataFetchingFuture;
  static List<dynamic> eventData = [];
  void fetchSearchResult() {
    var sv = DataServices();
    dataFetchingFuture = sv.fetchData("yes");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchResult();
  }

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text("Search")],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Icon(Icons.search),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: Utils.searchController,
                    onChanged: (String value) {
                      print('Changing, Input: ${Utils.searchController.text}');
                      fetchSearchResult();
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: "Type Event Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<void>(
                future: dataFetchingFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error occurred while fetching data!'));
                  }
                  return ListView.builder(
                    itemExtent: HEIGHT / 6 - 10,
                    itemCount: eventData.length,
                    itemBuilder: (context, index) {
                      return searchTile(
                        title: eventData[index]['title'],
                        description: eventData[index]['description'],
                        imageUrl: eventData[index]['banner_image'].toString(),
                        date_time: eventData[index]['date_time'],
                        organiser_name: eventData[index]['organiser_name'],
                        organiser_icon: eventData[index]['organiser_icon'],
                        venue_name: eventData[index]['venue_name'],
                        venue_city: eventData[index]['venue_city'],
                        venue_country: eventData[index]['venue_country'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
