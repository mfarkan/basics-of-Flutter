import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpBasics extends StatelessWidget {
  final Future<PostModel> post = fetchPost();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<PostModel>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.title,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<PostModel> fetchPost() async {
  const Map<String, String> requestHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
  final response = await http.get(
      'https://jsonplaceholder.typicode.com/posts/1',
      headers: requestHeaders);
  if (response.statusCode == 200) {
    return PostModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Http error getting data...');
  }
}

class PostModel {
  num userId, id;
  String title, body;
  PostModel({this.userId, this.id, this.title, this.body});
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        body: json['body'],
        id: json['id'],
        userId: json['userId'],
        title: json['title']);
  }
}
