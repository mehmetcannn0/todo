import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(13),
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Note',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                ref
                    .push()
                    .set(
                      title.text,
                    )
                    .asStream();

                Navigator.pop(context);
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Note successfully added!',
                  autoCloseDuration: Duration(seconds: 2),
                );
              },
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
