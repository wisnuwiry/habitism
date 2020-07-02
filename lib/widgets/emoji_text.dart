import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class EmojiText extends StatelessWidget {
  const EmojiText(
    this.text, {
    Key key,
  })  : assert(text != null),
        super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _buildText(text),
    );
  }

  TextSpan _buildText(String text) {
    final children = <TextSpan>[];
    final runes = text.runes;

    for (var i = 0; i < runes.length; /* empty */) {
      var current = runes.elementAt(i);

      // we assume that everything that is not
      // in Extended-ASCII set is an emoji...
      final isEmoji = current > 255;
      final shouldBreak = isEmoji ? (int x) => x <= 255 : (int x) => x > 255;

      final chunk = <int>[];
      while (!shouldBreak(current)) {
        chunk.add(current);
        if (++i >= runes.length) break;
        current = runes.elementAt(i);
      }

      children.add(
        TextSpan(
          text: String.fromCharCodes(chunk),
          style: isEmoji
              ? GoogleFonts.notoColorEmojiCompat().copyWith(fontSize: 22)
              : const TextStyle(),
        ),
      );
    }

    return TextSpan(children: children);
  }
}
