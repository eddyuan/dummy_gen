import 'dart:math';

import 'package:dummy_gen/src/city_list.dart';
import 'package:dummy_gen/src/province_list.dart';

import 'word_list.dart';

class DummyInternal {
  static final Random _random = Random();

  /// Generates random text using latin words. Words are distributed
  /// evenly across the paragraphs.
  // static String lorem({int paragraphs = 3, int words = 100}) {
  //   if (paragraphs < 0) {
  //     throw ArgumentError.value(paragraphs, "paragraphs");
  //   }
  //   if (words < 0) {
  //     throw ArgumentError.value(words, "words");
  //   }

  //   if (paragraphs == 0 || words == 0) {
  //     return "";
  //   }

  //   if (paragraphs > words) {
  //     // Not possible, so we downside to match words
  //     paragraphs = words;
  //   }

  //   return _makeParagraphs(paragraphs, words);
  // }

  static String makeImage({int width = 400, int height = 400}) {
    return "https://picsum.photos/id/${randomInRange(1, 500)}/$width/$height";
  }

  static String makeParagraphs(
    int paragraphs,
    int words, {
    bool? punctuation,
  }) {
    int wordLength = words ~/ paragraphs;
    List<String> result = [];

    for (int i = 0; i < paragraphs - 1; i++) {
      result.add(makeParagraph(wordLength, punctuation: punctuation));
    }

    // Last paragraph might need to be slightly larger
    result.add(makeParagraph(
      wordLength + (words % paragraphs),
      punctuation: punctuation,
    ));
    return result.join("\n\n");
  }

  static String makeParagraph(
    int words, {
    bool? punctuation,
  }) {
    int remain = words;

    List<String> result = [];

    if (words == 1) {
      return makeSentence(1, punctuation: punctuation);
    }

    while (remain > 0) {
      int length = randomInRange(2, min(10, remain));

      // Avoid being left with tiny sentences.
      if (remain - length < 2) {
        length = remain;
      }

      result.add(makeSentence(length, punctuation: punctuation));
      remain -= length;
    }

    return result.join(" ");
  }

  static T fromList<T>(List<T> list) => list[_random.nextInt(list.length)];

  static int randomInRange(int minInclusive, int maxInclusive) {
    final int max = maxInclusive < minInclusive ? minInclusive : maxInclusive;
    return _random.nextInt(max - minInclusive + 1) + minInclusive;
  }

  static String makePhone() {
    return List.generate(10, (index) => makeNumber()).join();
  }

  static String makeEmail() {
    return "${makeWord()}_${makeWord()}@${makeWord()}.com";
  }

  static DateTime makeDate({bool past = true, bool future = true}) {
    final now = DateTime.now();
    final Duration diff = Duration(
      days: randomInRange(0, 800),
      hours: randomInRange(0, 4),
      minutes: randomInRange(1, 60),
    );
    final bool shouldPast = past && future ? makeBool() : past;
    if (shouldPast) {
      return now.subtract(diff);
    }
    return now.add(diff);
  }

  static String makeSentence(
    int words, {
    bool? punctuation,
  }) {
    List<String> result = [];
    int commas = 0;
    bool lastWasComma = false;

    final bool usePunctuation = punctuation ?? words > 4;

    for (int i = 0; i < words; i++) {
      String nextWord = makeWord();

      if (usePunctuation) {
        // Add commas, occasionally (up to 2), but not consecutively
        if (lastWasComma) {
          lastWasComma = false;
        } else if (i != (words - 1) && commas < 2) {
          int n = randomInRange(1, 7);
          if (n == 1) {
            nextWord += ",";
            commas++;
            lastWasComma = true;
          }
        }
      }

      result.add(nextWord);
    }

    // Capitalize the first word in sentence
    result[0] =
        result[0].substring(0, 1).toUpperCase() + result[0].substring(1);
    final String resultStr = result.join(" ");

    if (usePunctuation) {
      return "$resultStr.";
    }

    return resultStr;
  }

  static String makeWord() {
    // 50% of words should be short
    int n = _random.nextInt(2);
    String chosen;

    do {
      chosen = wordList[_random.nextInt(wordList.length)];
    } while (n > 0 && chosen.length > 5);

    return chosen;
  }

  static String makeCity() {
    return cityList[_random.nextInt(cityList.length)];
  }

  static String makeProvince([bool abbreviation = false]) {
    late final List<String> provinces;
    if (abbreviation) {
      provinces = provinceList.keys.toList();
    } else {
      provinces = provinceList.values.toList();
    }
    return provinces[_random.nextInt(provinces.length)];
  }

  static String makeState([bool abbreviation = false]) {
    late final List<String> states;
    if (abbreviation) {
      states = stateList.keys.toList();
    } else {
      states = stateList.values.toList();
    }
    return states[_random.nextInt(states.length)];
  }

  static bool makeBool([double truePossibility = 0.5]) {
    return _random.nextDouble() < truePossibility;
  }

  static String makeStreet() {
    final String streetNumber = randomInRange(100, 10000).toString();
    String streetName = makeWord();
    streetName =
        streetName[0].toUpperCase() + streetName.substring(1).toLowerCase();
    final String streetType = makeBool() ? "St." : "Ave.";
    return [streetNumber, streetName, streetType].join(" ");
  }

  static String makeNumber() {
    const numbers = '1234567890';
    return numbers[_random.nextInt(numbers.length)];
  }

  static String makeLetter() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return letters[_random.nextInt(letters.length)];
  }

  static String makePostal() {
    return [
      makeLetter(),
      makeNumber(),
      makeLetter(),
      " ",
      makeLetter(),
      makeNumber(),
      makeLetter()
    ].join();
  }
}
