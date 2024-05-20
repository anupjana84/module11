import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String title;

  final String link;
  final int id;

  const DetailsScreen(this.title, this.link, this.id);

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2196F3),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color here
        ),
        title: const Text(
          "Photo Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              link,
              width: 200,
              height: 200,
            ),
            Wrap(
              children: [
                Text(title),
              ],
            ),
            Center(child: Text("Id:${id.toString()}"))
          ],
        ),
      ),
    );
  }
}
