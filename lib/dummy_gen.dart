library dummy_gen;

import 'package:dummy_gen/src/dummy_gen_internal.dart';
import 'package:dummy_gen/src/id_count.dart';

/// A Calculator.
class DummyGen {
  int get id => IdCount.instance.id;

  static String get image => DummyInternal.makeImage();
  static String get city => DummyInternal.makeCity();
  static String get province => DummyInternal.makeProvince(false);
  static String get provinceCode => DummyInternal.makeProvince(true);
  static String get state => DummyInternal.makeState(false);
  static String get stateCode => DummyInternal.makeState(true);
  static String get street => DummyInternal.makeStreet();
  static String get postal => DummyInternal.makePostal();
  static String get phone => DummyInternal.makePhone();
  static String get email => DummyInternal.makeEmail();
  static DateTime get dateFuture =>
      DummyInternal.makeDate(past: false, future: true);
  static DateTime get datePast =>
      DummyInternal.makeDate(past: true, future: false);
  static String get name => lorem(
        minParagraphs: 1,
        maxParagraphs: 1,
        minWords: 2,
        maxWords: 3,
        punctuation: false,
      );
  static String get address => [
        street,
        city,
        provinceCode,
        postal,
      ].join(", ");
  static String get title => lorem(
        minParagraphs: 1,
        maxParagraphs: 1,
        minWords: 1,
        maxWords: 4,
        punctuation: false,
      );
  static String get subTitle => lorem(
        minParagraphs: 1,
        maxParagraphs: 1,
        minWords: 4,
        maxWords: 8,
        punctuation: false,
      );
  static String get paragraph => lorem(
        minParagraphs: 1,
        maxParagraphs: 1,
        minWords: 12,
        maxWords: 30,
        punctuation: true,
      );

  static String lorem({
    int minParagraphs = 1,
    int maxParagraphs = 3,
    int minWords = 60,
    int maxWords = 120,
    bool? punctuation,
  }) {
    int paragraphs = DummyInternal.randomInRange(minParagraphs, maxParagraphs);
    final int words = DummyInternal.randomInRange(minWords, maxWords);
    if (paragraphs < 0) {
      throw ArgumentError.value(paragraphs, "paragraphs");
    }
    if (words < 0) {
      throw ArgumentError.value(words, "words");
    }

    if (paragraphs == 0 || words == 0) {
      return "";
    }

    if (paragraphs > words) {
      // Not possible, so we downside to match words
      paragraphs = words;
    }

    return DummyInternal.makeParagraphs(
      paragraphs,
      words,
      punctuation: punctuation,
    );
  }
}
