import 'package:atelier2810/entities/Dog.dart';
import 'package:flutter/material.dart';

import 'ressources/data/FakeDogDatabase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListDog(),
    );
  }
}

class ListDog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AdoPet")),
      body: Container(
        child: ListView.builder(
          itemCount: dogList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DogDetails(dogList[index]))),
                  title: Text(dogList[index].name),
                  subtitle: Text("${dogList[index].age} yrs | Playful"),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(dogList[index].image)),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }

  goToNextPage() {}
}

class DogDetails extends StatelessWidget {
  Dog d;
  DogDetails(this.d);
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: (() => Navigator.pop(context)),
            ),
          ],
          title: Text("Dog details"),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 10,
                  ),
                  child: Image(image: AssetImage(d.image)),
                ))
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20,
                    ),
                    child: Text("Pet name : ${d.name}"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20,
                    ),
                    child: Icon(Icons.location_on, color: Colors.lightBlue),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20,
                    ),
                    child: Text(d.location),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
