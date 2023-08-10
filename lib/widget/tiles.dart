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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            orgImgUrl != 'null'
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                        imageUrl: orgImgUrl,
                        height: 30,
                        width: 30,
                        filterQuality: FilterQuality.medium),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Container(
                      // margin: EdgeInsets.only(right: 8),
                      color: Color.fromARGB(53, 99, 138, 206),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          iCon,
                          color: Utils.themeColor,
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
