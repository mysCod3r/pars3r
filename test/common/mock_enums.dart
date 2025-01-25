import 'package:pars3r/pars3r.dart';

enum MockEnum with IParsableEnum<MockEnum> {
  empty,
  test,
  test2,
  ;

  @override
  List<MockEnum> get enumValues => values;
}

enum MockEnumEmptyValues with IParsableEnum<MockEnumEmptyValues> {
  empty,
  ;

  @override
  List<MockEnumEmptyValues> get enumValues => [];
}
