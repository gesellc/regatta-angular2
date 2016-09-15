import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:frontend/app_component.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent, [
    provide(Client, useFactory: () => new BrowserClient(), deps: [])
  ]);
  // Simplify bootstrap provider list to [BrowserClient]
  // once there is a fix for:
  // https://github.com/dart-lang/angular2/issues/37
}

