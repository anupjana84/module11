import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:module11/details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var photoList = [];

  Future<void> _getPhototList() async {
    const String phototListUrl = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri = Uri.parse(phototListUrl);
    Response response = await get(uri);

    if (response.statusCode == 200) {
      // data decode
      final decodedData = jsonDecode(response.body);
      photoList = decodedData;
      setState(() {});
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Get Photo list failed! Try again.')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getPhototList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xff2196F3),
        title: const Text(
          "Photo Gallery App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: photoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            photoList[index]['title'],
                            photoList[index]['thumbnailUrl'],
                            photoList[index]['id'],
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.00),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network("${photoList[index]["thumbnailUrl"]}"),
                  ),
                  Expanded(
                      child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.00),
                        child: Text("${photoList[index]["title"]}"),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ); // n(1)
        },
      ),
    );
  }

  // Widget _buildProductItem(photo) {
  //   return
  // }
}
