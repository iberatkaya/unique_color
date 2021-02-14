const seed = 16777215;
const factor = 49979693;

///Generate a time invariant Hex color from a [text].
String generateColor(String text) {
  if (text == null) {
    throw Exception('Parameter cannot be null!');
  }
  var b = 1;
  var d = 0;
  var f = 1;
  if (text.isNotEmpty) {
    for (var i = 0; i < text.length; i++) {
      if (text[i].codeUnitAt(0) > d) (d = text[i].codeUnitAt(0));
      f = seed ~/ d;
      b = (b + text[i].codeUnitAt(0) * f * factor) % seed;
    }
  }
  var hex = ((b * text.length) % seed).toRadixString(16);
  if (hex.length < 6) {
    var i = 0;
    while (hex.length != 6) {
      hex += hex[i % hex.length];
      i++;
    }
  }
  return '#' + hex;
}
