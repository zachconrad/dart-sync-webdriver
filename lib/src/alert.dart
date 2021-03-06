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

part of sync.webdriver;

/// A JavaScript alert(), confirm(), or prompt() dialog
class Alert extends _WebDriverBase {
  /**
   * The text of the JavaScript alert(), confirm(), or
   * prompt() dialog.
   */
  final String text;


  Alert._(this.text, commandProcessor)
      : super(commandProcessor, '');

  /**
   * Accepts the currently displayed alert (may not be the alert for which
   * this object was created).
   *
   * Throws [NoAlertOpenException] if there isn't currently an alert.
   */
  void accept() => _post('accept_alert');

  /**
   * Dismisses the currently displayed alert (may not be the alert for which
   * this object was created).
   *
   * Throws [NoAlertOpenException] if there isn't currently an alert.
   */
  void dismiss() => _post('dismiss_alert');

  /**
   * Sends keys to the currently displayed alert (may not be the alert for which
   * this object was created).
   *
   * Throws [NoAlertOpenException] if there isn't currently an alert.
   */
  void sendKeys(String keysToSend) =>
      _post('alert_text', { 'text': keysToSend });
}
