import 'package:flutter/material.dart';

class bookmark extends StatelessWidget {
  const bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Color.fromARGB(78, 185, 180, 180),
        child: Center(
          child: IconButton(
              onPressed: () {
                print('Bookmarhed this event!');
              },
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 20,
              )),
        ),
      ),
    );
  }
}
