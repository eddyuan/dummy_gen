class IdCount {
  static IdCount? _instance;
  // Avoid self instance
  IdCount._();
  static IdCount get instance => _instance ??= IdCount._();
  int _id = 0;
  int get id {
    _id += 1;
    return _id;
  }
}
