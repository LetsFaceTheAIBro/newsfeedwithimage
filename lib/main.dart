import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Neuro Community"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Neuro Community")
                .snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.document.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot course = snapshot.data.document[index];
                  return ListTile(
                    leading: Image.network(course.get('img')),
                    title: Text(course.get('name')),
                    subtitle: Text(course.get('detail')),
                  );
                },
              );
            }));
  }
}
