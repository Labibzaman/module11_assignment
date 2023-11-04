import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  final String url;
  final String title;
  final int id;
  const PageViewScreen({super.key, required this.url, required this.title, required this.id});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Details'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 350,width: 350,
              child: Image.network(widget.url),
              ),
              SizedBox(height: 4,),
              Text('Title: ${widget.title}'),
              SizedBox(height: 4,),
              Text('ID: ${widget.id}'),
            ],
          ),
        ),
      ),
    );
  }
}
