import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.black,
                )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
              ),
              labelText: "Test",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
              ),
            ),
          )
        ],),
      ),
    );
  }
  void creatdatabase()async{
    var db = await openDatabase('my_db.db');
    var databasesPath = await getDatabasesPath();
    openDatabase(
      "todo.db",
      version: 1,
      onCreate: (db,ver) async {
        await db.execute(
            "CREATE TABLE tasks (id INTEGER PRIMARY KEY,"
                "title TEXT,date TEXT,"
                "time TEXT,"
                "status TEXT").then((value){

        }).catchError((error){
          print("error $error");
        });
    },
    onOpen: (db){
    });

  }
}
