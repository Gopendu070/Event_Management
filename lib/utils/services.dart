import 'dart:convert';
import 'package:events/screen/SearchScreen.dart';
import 'package:events/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../screen/Home.dart';

class DataServices {
  Future<void> fetchData(String isSearching) async {
    var url =
        "https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=${Utils.searchController.text.toString()}";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final jsonData = jsonDecode(body);
      if (isSearching == "no")
        HomeScreenState.eventData = jsonData['content']['data'];
      else if (isSearching == "yes")
        SearchScreenState.eventData = jsonData['content']['data'];
    } else {
      print('Some Error Occurred');
    }
  }
}
