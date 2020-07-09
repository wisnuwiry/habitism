import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:habitism/data/route_paths.dart';
import 'package:habitism/provider/theme_provider.dart';
import 'package:habitism/ui/emojis.dart';
import 'package:habitism/ui/text.dart';
import 'package:habitism/utils/device_type.dart' as utils;
import 'package:habitism/utils/prefs.dart';
import 'package:habitism/widgets/emoji_text.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Upon exiting, save theme preferences
      onWillPop: () {
        final themeState = Provider.of<ThemeProvider>(context).state;
        updatePrefs(themeState.isDarkTheme, themeState.appLocale);
        return Future.value(true);
      },
      child: LayoutBuilder(builder: (context, _) {
        final orientation = MediaQuery.of(context).orientation;
        final device = utils.deviceType(context);

        if (device == utils.DeviceType.tablet ||
            orientation == Orientation.portrait) {
          return _buildVerticalView;
        }

        return _buildHorizontalView;
      }),
    );
  }

  Widget get _buildHorizontalView => Scaffold(
          body: Row(
        children: <Widget>[
          const SizedBox(
            width: 150.0,
            height: double.infinity,
            child: SingleChildScrollView(
              child: EmojiText(
                'side panel goes here! $eyeEmoji',
              ),
            ),
          ),
          Expanded(child: _content(false)),
        ],
      ));

  Widget get _buildVerticalView => Scaffold(
        body: _content(true),
      );

  Widget _content(bool showDetails) => Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            Flexible(
              child: HomeAppBar(showDetails),
            ),
            Expanded(
              child: HomeTodoList(),
            ),
          ],
        ),
      );
}

class HomeAppBar extends StatelessWidget {
  final bool showDetails;

  const HomeAppBar(this.showDetails, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (showDetails) const EmojiText(eyeEmoji),
        ResponsiveText(
            DateTimeFormat.format(
              DateTime.now(),
              format: 'D, M j',
            ),
            align: TextAlign.center),
        IconButton(
          icon: const EmojiText(settingsEmoji),
          onPressed: () {
            Navigator.pushNamed(
              context,
              RoutePaths.settings,
            );
          },
        )
      ],
    );
  }
}

class HomeTodoList extends StatefulWidget {
  @override
  _HomeTodoListState createState() => _HomeTodoListState();
}

class _HomeTodoListState extends State<HomeTodoList> {
  List<String> alphabetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: List.generate(
        alphabetList.length,
            (index) {
          return ListViewCard(
            alphabetList,
            index,
            Key('$index'),
          );
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
          () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }
}

class ListViewCard extends StatefulWidget {
  @override
  final Key key;
  final int index;
  final List<String> listItems;

  ListViewCard(this.listItems, this.index, this.key);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () => print('Item ${widget.listItems[widget.index]} selected.'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Title ${widget.listItems[widget.index]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description ${widget.listItems[widget.index]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//    TODo: USING CUSTOM SCROLL FOR HOME CONTENT
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
