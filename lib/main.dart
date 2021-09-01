import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo ListView Builder"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => {},
            child: null,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(index.toString());
              },
              itemCount: 3,
            ),
          )
        ],
      ),
    );
  }
}
