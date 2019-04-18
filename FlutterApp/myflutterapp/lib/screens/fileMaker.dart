import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileOutput {
  ///get customer output path
  Future<String> get filePath async {
    final output = await getApplicationDocumentsDirectory();
    return output.path;
  }

  ///create new txt file in client phone.
  Future<File> get localFile async {
    final path = await filePath;
    return File('$path/newFile.txt');
  }

  ///Read txt file in local phone.
  Future<String> readTxtFile() async {
    try {
      final file = await localFile;
      String txtInside = await file.readAsString();
      return txtInside;
    } catch (e) {
      return 'Something goes wrong !';
    }
  }

  Future<File> writeFile(String content) async {
    final file = await localFile;
    return file.writeAsString(content);
  }
}

class FileMaker extends StatefulWidget {
  final FileOutput fileOutput;

  FileMaker({Key key, this.fileOutput}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new FileState();
  }
}

class FileState extends State<FileMaker> {
  final textEditingController = new TextEditingController();
  String content = "";
  Future<File> saveFile() async {
    setState(() {
      content = textEditingController.text;
    });
    return widget.fileOutput.writeFile(content);
  }

  @override
  void initState() {
    super.initState();
    widget.fileOutput.readTxtFile().then((String value) {
      setState(() {
        content = value;
      });
    });
  }

  void readFile() {
    widget.fileOutput.readTxtFile().then((String value) {
      setState(() {
        content = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Something with File'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(
                hintText: 'Whatever you want to say about Txt File <3'),
            controller: textEditingController,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: saveFile,
                    color: Colors.green,
                    child: new Text(
                      'Kaydet',
                      style: new TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              new Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: readFile,
                    color: Colors.blue,
                    child: new Text(
                      'Oku',
                      style: new TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Expanded(
            child: new Padding(
              padding: EdgeInsets.all(15),
              child: new Text('$content'),
            ),
          )
        ],
      ),
    );
  }
}
