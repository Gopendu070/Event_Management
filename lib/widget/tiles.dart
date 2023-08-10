import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/utils/utils.dart';
import 'package:flutter/material.dart';

class TilesWidget extends StatelessWidget {
  String head;
  String bottom;
  String orgImgUrl;
  IconData iCon;
  TilesWidget(
      {required this.head,
      required this.bottom,
      required this.iCon,
      required this.orgImgUrl});

  @override
  Widget build(BuildContext context) {
    final double WIDTH = MediaQuery.of(context).size.width;
    final double HEIGHT = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            //if there is an url available
            orgImgUrl != 'null'
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) {
                          return Icon(
                            Icons.question_mark_rounded,
                            color: Colors.grey,
                          );
                        },
                        imageUrl: orgImgUrl,
                        height: HEIGHT * 0.03 + 5,
                        filterQuality: FilterQuality.medium),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Container(
                      color: Color.fromARGB(53, 99, 138, 206),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          iCon,
                          color: Utils.themeColor,
                          size: HEIGHT * 0.03,
                        ),
                      ),
                    ),
                  ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  head,
                  style: Utils.styleH,
                ),
                Text(bottom, style: Utils.styleB),
              ],
            )
          ],
        ),
      ),
    );
  }
}
