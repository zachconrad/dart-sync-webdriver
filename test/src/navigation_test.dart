/*
Copyright 2013 Google Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

library webdriver_test.navigation;

import 'package:unittest/unittest.dart';
import 'package:sync_webdriver/sync_webdriver.dart';
import '../test_util.dart';

void main() {

  group('Navigation', () {

    WebDriver driver;

    setUp(() {
      driver = new WebDriver(desired: Capabilities.chrome);
      driver.url = 'http://www.google.com';
    });

    tearDown(() => driver.quit());

    test('forward/back', () {
      driver.url = testPagePath;
      driver.navigate.back();
      expect(driver.title, contains('Google'));
      driver.navigate.forward();
      expect(driver.title, contains('test_page'));
    });

    test('refresh', () {
      var element = driver.findElement(new By.name('q'));
      driver.navigate.refresh();
      expect(() => element.name,
          throwsA(new isInstanceOf<StaleElementReferenceError>()));
    });
  });
}