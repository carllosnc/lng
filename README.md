# lng

>A Flutter package to manage language translations.

| Example                           |
| --------------------------------- |
| <img src="lng.gif" width="280" /> |

## Install

This is a unpublished package, so you will need to add it to your pubspec.yaml file.

```yaml
dependencies:
  vw:
    git:
      url: https://github.com/C4co/lng.git
```

To more information about unpublished packages see: https://dart.dev/tools/pub/package-layout#unpublished-packages

## 01: Initial configuration

The first step is to initialize the package.

- `lngCore`: is responsible for the initialization of the package.
- `lng.addLabels`: is the method that add the translations.

```dart
import 'package:lng/lng.dart';

void main() {
  lngCore.init(defaultLang: 'en');
  lng.addLabels({
    'en': {
      'es': 'Spanish',
      'en': 'English',
      'text': 'Hello World',
      'color': Colors.red,
      'app_title': 'App title'
    },
    'es': {
      'es': 'Español',
      'en': 'Inglés',
      'text': 'Hola Mundo',
      'color': Colors.orange
      'app_title': 'Título de la app'
    },
  });
}
```

## 02: Use LngMixin and call lng.get()

`LngMixin` use `ChangeNotifier` to notify the listeners when the language changes,
each widget that call `lng.get()` must be using `LngMixin`.

```dart
import 'package:flutter/material.dart';
import 'package:lng/lng.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with LngMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lng.get('color'),
      appBar: AppBar(
        title: Text(lng.get('app_title')),
      ),
      body: Column(
        children: [
          Text(lng.get('text')),
        ],
      ),
    );
  }
}
```

## 03: Call openLng()

`openLng` is a function that open a dialog to select the language.

```dart
IconButton(
  icon: const Icon(Icons.translate),
  onPressed: () {
    openLng(
      context: context,
      title: "Set language",
    );
  },
),
```

---

Carlos Costa @ 2024
