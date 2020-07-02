import 'dart:ui';

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:habitism/shared/emojis.dart';
import 'package:habitism/shared/util.dart' as utils;
import 'package:habitism/widgets/emoji_text.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      final device = utils.deviceType(context);
      if (device == utils.DeviceType.tablet) {
        return _buildTablet;
      }
      final orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        return _buildPhonePortrait;
      } else {
        return _buildPhoneLandscape;
      }
    });
  }

  Widget get _buildTablet => Scaffold(
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
              body: _content(false)),
        ),
  );

  Widget get _buildPhoneLandscape => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Container(
          color: Colors.amber,
        ),
        title: Container(
          height: 36,
          color: Colors.transparent,
          child: const Text('PhoneLandscape'),
        ),
      ),
      body: Row(
        children: <Widget>[
          const SizedBox(
              width: 150.0,
              height: double.infinity,
              child: SingleChildScrollView(
                child: EmojiText('side panel goes here! $eyeEmoji'),
              )),
          Expanded(child: _content(false)),
        ],
      ));

  Widget get _buildPhonePortrait => Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.transparent,
//          elevation: 0.0,
//          title: Container(
//            height: 36,
//            color: Colors.transparent,
//            child: Text(
//              DateTimeFormat.format(DateTime.now(), format: 'D, M j'),
//            ),
//          ),
//        ),
    drawer: _drawer,
    body: _content(true),
  );

  Widget _content(bool showTitle) =>
      Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            if (showTitle)
              Flexible(
                child: Row(
                  children: <Widget>[
                    const EmojiText(eyeEmoji),
                    Expanded(
                      child: Text(
                          DateTimeFormat.format(DateTime.now(), format: 'D, M j'),
                          textAlign: TextAlign.center
                      ),
                    ),
                    const EmojiText(settingsEmoji),
                  ],
                ),
              ),
            const Expanded(
              child: Center(child: Text('content')),
            ),
          ],
        ),);

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

  Widget get _drawer => const Drawer(
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
