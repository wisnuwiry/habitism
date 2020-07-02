import 'package:flutter/material.dart';
import 'package:habitism/util.dart' as utils;

void main() {
//  DevicePreview(
//    builder: (_) => MyApp(),
//  ),
//);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        //locale: DevicePreview.of(context).locale,
        //builder: DevicePreview.appBuilder,
        title: 'Habitism',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      final device = utils.deviceType(context);
      if (device == utils.DeviceType.tablet) {
        return _buildTablet;
      }
      final orientation = MediaQuery
          .of(context)
          .orientation;
      if (orientation == Orientation.portrait) {
        return _buildPhonePortrait;
      } else {
        return _buildPhoneLandscape;
      }
    });
  }

  Widget get _buildTablet =>
      Scaffold(
        body: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: Container(
                  color: Colors.amber,
                ),
                title: Container(
                  height: 36,
                  color: Colors.transparent,
                  child: const Text('tablet'),
                ),
              ),
              body: _content(true)),
        ),
      );

  Widget get _buildPhoneLandscape =>
      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: Container(
              color: Colors.amber,
            ),
            title: Container(
              height: 36,
              color: Colors.transparent,
              child: Text('PhoneLandscape'),
            ),
          ),
          body: Row(
            children: <Widget>[
              SizedBox(
                  width: 150.0,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Text('Content'),
                  )),
              Expanded(child: _content(false)),
            ],
          ));

  Widget get _buildPhonePortrait =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Container(
            color: Colors.amber,
          ),
          title: Container(
            height: 36,
            color: Colors.transparent,
            child: Text('PhoneVertical'),
          ),
        ),
        drawer: _drawer,
        body: _content(false),
      );

  Widget _content(bool showTitleImage) => const Center(child: Text('content'));

//      CustomScrollView(
//        slivers: <Widget>[
//          SliverPadding(
//            padding: EdgeInsets.symmetric(horizontal: 16.0),
//            sliver: SliverList(
//              delegate: SliverChildListDelegate(
//                [
//                  const SizedBox(
//                    height: 16,
//                  ),
//                  RichText(
//                    textAlign: TextAlign.center,
//                    text: const TextSpan(
//                      text: '“Give me problems, give me ',
//                      children: <TextSpan>[
//                        TextSpan(
//                          text: ' work',
//                        )
//                      ],
//                    ),
//                  ),
//                  SizedBox(
//                    height: 12,
//                  ),
//                  if (showTitleImage) const Text('showImage'),
//                  const SizedBox(
//                    height: 8.0,
//                  ),
//                ],
//              ),
//            ),
//          ),
//          const Text('Grid'),
//          SliverPadding(
//            padding: const EdgeInsets.symmetric(horizontal: 16.0),
//            sliver: SliverList(
//              delegate: SliverChildListDelegate(
//                [
//                  const Text('ornament'),
//                ],
//              ),
//            ),
//          )
//        ],
//      );

  Widget get _drawer =>
      const Drawer(
        child: Text('DrawerContent'),
      );
}

//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => Scaffold(
//      appBar: AppBar(title: const Text('test')),
//      drawer: MediaQuery.of(context).size.width < 500
//          ? Drawer(
//              child: Menu(),
//            )
//          : null,
//      body: SafeArea(
//          child: Center(
//              child: MediaQuery.of(context).size.width < 500
//                  ? Content()
//                  : Row(children: [
//                      Container(width: 200.0, child: Menu()),
//                      Container(
//                          width: MediaQuery.of(context).size.width - 200.0,
//                          child: Content())
//                    ]))));
//}
//
//class Menu extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) =>
//      ListView(children: [
//        FlatButton(
//            onPressed: () {},
//            child: ListTile(
//              leading: Icon(Icons.looks_one),
//              title: const Text('First Link'),
//            )),
//        FlatButton(
//            onPressed: () {},
//            child: ListTile(
//              leading: Icon(Icons.looks_two),
//              title: const Text('Second Link'),
//            ))
//      ]);
//}
//
//class Content extends StatelessWidget {
//  final List<String> elements = [
//    'Zero',
//    'One',
//    'Two',
//    'Three',
//    'Four',
//    'Five',
//    'Six',
//    'Seven',
//    'Eight',
//    'A Million Billion Trillion',
//    'A much, much longer text that will still fit'
//  ];
//
//  @override
//  Widget build(BuildContext context) =>
//      GridView.builder(
//        itemCount: elements.length,
//        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//          maxCrossAxisExtent: 130.0,
//          crossAxisSpacing: 20.0,
//          mainAxisSpacing: 20.0,
//        ),
//        itemBuilder: (context, i) =>
//            Card(
//              child: Center(
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(elements[i]),
//                ),
//              ),
//            ),
//      );
//}
