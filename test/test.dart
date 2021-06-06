import 'package:test/test.dart';
import 'package:unique_color/unique_color.dart';

void main() {
  test('Should generate hex color', () {
    var color = generateColor('test');
    expect(color.contains('#'), true);
  });

  test('Color should be time invariant', () {
    var color1 = generateColor('test');
    var color2 = generateColor('test');
    var color3 = generateColor('test');
    expect(color1 == color2 && color1 == color3 && color2 == color3, true);
  });

  test('Different strings should have different colors', () {
    var color1 = generateColor('test1');
    var color2 = generateColor('test2');
    var color3 = generateColor('test3');
    expect(color1 != color2 && color1 != color3 && color2 != color3, true);
  });

  test('Should generate hex color with empty string', () {
    var color = generateColor('');
    expect(color.contains('#'), true);
  });

  test('Should generate hex color from string with whitespace', () {
    var color = generateColor('random color');
    expect(color.contains('#'), true);
  });
}
