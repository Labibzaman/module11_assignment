import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'imageView.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> responseDATA = [];

  Future<void> getapiData() async {
    Response response =
    await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        responseDATA = jsonDecode(response.body);
      });
      print(response.body);
    }
  }

  @override
  void initState() {
    getapiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: ListView.separated(
        itemCount: responseDATA.length,
        itemBuilder: (BuildContext context, int index) {
          String url = responseDATA[index]['thumbnailUrl'];
          String bigurl = responseDATA[index]['url'];
          String title = responseDATA[index]['title'];
          return ListTile(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PageViewScreen(url: bigurl,title: title, id:index,);

              }));
            },
            leading: imageLoad(url), // Use custom widget
            title: Text(title),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 2,
          );
        },
      ),
    );
  }
}

class imageLoad extends StatelessWidget {
  final String url;

  imageLoad(this.url);

  @override
  Widget build(BuildContext context) {
    try {
      return Image.network(url);
    } catch (e) {
      // Handle image loading error
      return Image.network('https://static.thenounproject.com/png/1856610-200.png'); // Replace with your error image asset
    }
  }
}
