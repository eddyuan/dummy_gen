## Features

Generate dummy contents;

## Getting started

`import 'package:dummy_gen/dummy_gen.dart';`

## Usage

Import and use the DummyGen;

```dart
/// A plugin scoped unique increment id
DummyGen.id;
/// https://picsum.photos/id/xxxx
DummyGen.image;
/// List of images
DummyGen.images(min:1, max:8);
DummyGen.city;
/// Canadian Province
DummyGen.province;
/// Canadian Province Abbreviation
DummyGen.provinceCode;
/// US State
DummyGen.state;
/// US State Abbreviation
DummyGen.stateCode;
/// Street with number eg: 1234 Something St.
DummyGen.street;
/// Canadian postal format: X0X 0X0
DummyGen.postal;
/// 10 digits string
DummyGen.phone;
DummyGen.email;
DummyGen.getInt(min:0, max: 100000);
/// Bool with possibility of return true
DummyGen.getBool(0.5);
/// street+city+provinceCode+postal
DummyGen.address;
DummyGen.title;
DummyGen.subTitle;
DummyGen.paragraph;
DummyGen.name;
DummyGen.dateFuture;
DummyGen.datePast;
DummyGen.lorem(
  minParagraphs: 1,
  maxParagraphs: 1,
  minWords: 2,
  maxWords: 3,
  punctuation: false,
),
```
