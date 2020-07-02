import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('test')),
      drawer: MediaQuery.of(context).size.width < 500
          ? Drawer(
              child: Menu(),
            )
          : null,
      body: SafeArea(
          child: Center(
              child: MediaQuery.of(context).size.width < 500
                  ? Content()
                  : Row(children: [
                      Container(width: 200.0, child: Menu()),
                      Container(
                          width: MediaQuery.of(context).size.width - 200.0,
                          child: Content())
                    ]))));
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ListView(children: [
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.looks_one),
              title: const Text('First Link'),
            )),
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.looks_two),
              title: const Text('Second Link'),
            ))
      ]);
}

class Content extends StatelessWidget {
  final List<String> elements = [
    'Zero',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'A Million Billion Trillion',
    'A much, much longer text that will still fit'
  ];

  @override
  Widget build(BuildContext context) =>
      GridView.builder(
        itemCount: elements.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, i) =>
            Card(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(elements[i]),
                ),
              ),
            ),
      );
}
