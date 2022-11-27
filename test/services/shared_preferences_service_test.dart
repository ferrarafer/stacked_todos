import 'package:flutter_test/flutter_test.dart';
import 'package:todos/app/app.locator.dart';

import '../../test/helpers/test_helpers.dart';

void main() {
  group('SharedPreferencesServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
