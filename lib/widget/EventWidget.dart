import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/screen/EventDetail.dart';
import 'package:events/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventWidget extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  String date_time;
  String organiser_name;
  String organiser_icon;
  String venue_name;
  String venue_city;
  String venue_country;

  EventWidget(
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
    if (venue_country == 'United States') {
      venue_country = 'US';
    }
    final String venue_details =
        venue_name + " • " + venue_city + ", " + venue_country;
    final dateTime =
        DateFormat('E, MMM d • h:mm a').format(DateTime.parse(date_time));
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Date and Time
                    const SizedBox(height: 7),
                    Text(
                      dateTime,
                      style: Utils.style3,
                    ),
                    const SizedBox(height: 4),
                    //Event Title
                    Text(
                      title,
                      style: Utils.style2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 7),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 17,
                          color: Colors.grey[500],
                        ),
                        Expanded(
                          child: Text(
                            venue_details,
                            style: Utils.style4,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
