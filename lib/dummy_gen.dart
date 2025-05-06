library dummy_gen;

import 'package:dummy_gen/dummy_gen.dart';
import 'package:dummy_gen/src/dummy_gen_internal.dart';
import 'package:dummy_gen/src/id_count.dart';
export 'src/model.dummy_video.dart';

/// A Calculator.
class DummyGen {
  const DummyGen._();

  /// A plugin scoped unique increment id
  static int get id => IdCount.instance.id;

  /// https://picsum.photos/id/xxxx
  static String get image => DummyInternal.makeImage();

  static DummyVideo get video => DummyInternal.makeVideo();

  /// List of images
  static List<String> images({
    /// Length of array
    int min = 1,

    /// Length of array
    int max = 8,
  }) =>
      List.generate(
        DummyInternal.randomInRange(min, max),
        (index) => DummyInternal.makeImage(),
      );

  static String get city => DummyInternal.makeCity();

  /// Canadian Province
  static String get province => DummyInternal.makeProvince(false);

  /// Canadian Province Abbreviation
  static String get provinceCode => DummyInternal.makeProvince(true);

  /// US State
  static String get state => DummyInternal.makeState(false);

  /// US State Abbreviation
  static String get stateCode => DummyInternal.makeState(true);

  /// Street with number eg: 1234 Something St.
  static String get street => DummyInternal.makeStreet();

  /// Canadian postal format: X0X 0X0
  static String get postal => DummyInternal.makePostal();

  /// 10 digits string
  static String get phone => DummyInternal.makePhone();
  static String get email => DummyInternal.makeEmail();
  static int getInt({min = 0, max = 100000}) {
    return DummyInternal.randomInRange(min, max);
  }

  /// Bool with possibility of return true
  static bool getBool([double truePossibility = 0.5]) =>
      DummyInternal.makeBool(truePossibility);

  static T fromList<T>(List<T> list) => DummyInternal.fromList(list);

  static DateTime get dateAny =>
      DummyInternal.makeDate(past: true, future: true);

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

  /// street+city+provinceCode+postal
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
