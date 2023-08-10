import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/utils/utils.dart';
import 'package:events/widget/bookmarkWidg.dart';
import 'package:events/widget/tiles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  String date_time;
  String organiser_name;
  String organiser_icon;
  String venue_name;
  String venue_city;
  String venue_country;
  EventDetailScreen(
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
    var dateTimeFormat = DateTime.parse(date_time);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Event Details', style: Utils.style5),
        actions: [
          SizedBox(width: 35, height: 30, child: bookmark()),
          const SizedBox(width: 7)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: HEIGHT / 3 - 20,
                width: WIDTH,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                title,
                overflow: TextOverflow.clip,
                style: Utils.style6.copyWith(fontSize: HEIGHT * 0.025),
              ),
            ),
            //Organizer's details
            TilesWidget(
                head: organiser_name,
                bottom: 'Organizer',
                iCon: Icons.event,
                orgImgUrl: organiser_icon),
            //Event Timing
            TilesWidget(
                head: DateFormat('d MMMM, y', 'en_US').format(dateTimeFormat),
                bottom:
                    DateFormat('EEEE, h:mm a', 'en_US').format(dateTimeFormat),
                iCon: Icons.calendar_month_rounded,
                orgImgUrl: 'null'),
            //Venue Details
            TilesWidget(
                head: venue_name,
                bottom: venue_city + ", " + venue_country,
                iCon: Icons.location_on_rounded,
                orgImgUrl: 'null'),
            //Description about the event
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'About Event',
                style: TextStyle(
                    fontSize: HEIGHT * 0.02, fontWeight: FontWeight.w500),
              ),
            ),
            //Event Description
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: Utils.style1.copyWith(fontSize: 15),
                overflow: TextOverflow.clip,
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print('Successfully Booked!');
        },
        child: Container(
          width: WIDTH / 3,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(child: Text('BOOK NOW', style: Utils.whiteText)),
              Container(
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Utils.themeColor),
      ),
    );
  }
}
