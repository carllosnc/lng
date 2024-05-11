import 'package:flutter/material.dart';
import './lng_notifier.dart';

/// Opens a modal bottom sheet to select a language.
/// The modal bottom sheet is closed when the user selects a language.
openLng({
  ///[context] The context to open the modal bottom sheet in.
  required BuildContext context,

  ///[title] The title of the modal bottom sheet.
  String title = 'Set Language',

  ///[titleStyle] The style of the title of the modal bottom sheet.
  TextStyle? titleStyle = const TextStyle(
    fontSize: 18,
  ),

  ///[backgroundColor] The background color of the modal bottom sheet.
  Color? backgroundColor,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: backgroundColor,
    builder: (context) {
      return Container(
        key: const Key('lng_container'),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        height: MediaQuery.of(context).size.height - 100,
        child: Scaffold(
          key: const Key('lng_scaffold'),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            key: const Key('lng_appbar'),
            backgroundColor: Colors.transparent,
            title: Text(
              title,
              style: titleStyle,
            ),
            leading: IconButton(
              key: const Key('lng_appbar_close'),
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: ListView.builder(
            key: const Key('lng_listview'),
            itemCount: lng.labels.length,
            itemBuilder: (context, index) {
              return ListTile(
                key: Key('lng_listview_item_${lng.labels.keys.toList()[index]}'),
                title: Text(
                  lng.get(lng.labels.keys.toList()[index]),
                ),
                onTap: () {
                  lng.setLanguage(
                    lng.labels.keys.toList()[index],
                  );
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
      );
    },
  );
}
