import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hire_it/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(true, File(Images.icons8Microsoft480).existsSync());
    expect(true, File(Images.icons8Google480).existsSync());
    expect(true, File(Images.icons8Amazon480).existsSync());
    expect(true, File(Images.avatar).existsSync());
    expect(true, File(Images.icons8AppleLogo512).existsSync());
    expect(true, File(Images.icons8Netflix480).existsSync());
  });
}
