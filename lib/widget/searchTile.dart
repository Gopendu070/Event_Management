import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screen/EventDetail.dart';

class searchTile extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  String date_time;
  String organiser_name;
  String organiser_icon;
  String venue_name;
  String venue_city;
  String venue_country;

  searchTile(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.date_time,
      required this.organiser_name,
      required this.organiser_icon,
      required this.venue_name,
      required this.venue_city,
      required this.venue_country});

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;
    final dateTime =
        DateFormat('dd MMM - E - h:mm a').format(DateTime.parse(date_time));
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailScreen(
                      title: title,
                      description: description,
                      imageUrl: imageUrl,
                      date_time: date_time,
                      organiser_name: organiser_name,
                      organiser_icon: organiser_icon,
                      venue_name: venue_name,
                      venue_city: venue_city,
                      venue_country: venue_country,
                    )));
      },
      child: Card(
        surfaceTintColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                // Banner Image
                child: Container(
                  width: WIDTH / 4,
                  decoration: BoxDecoration(
                      image: imageUrl != 'null'
                          ? DecorationImage(
                              image: CachedNetworkImageProvider(
                                imageUrl,
                                scale: 0.7,
                              ),
                              fit: BoxFit.fill,
                            )
                          : null, //A default image can be shown here
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HEIGHT > 950
                          ? SizedBox(height: 30)
                          : SizedBox(height: 22),
                      //Date Time
                      Text(
                        dateTime,
                        style:
                            Utils.style3.copyWith(fontSize: HEIGHT * 0.011 + 2),
                      ),
                      SizedBox(height: 11),
                      //Title
                      Text(
                        title,
                        style:
                            Utils.style2.copyWith(fontSize: HEIGHT * 0.02 - 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
