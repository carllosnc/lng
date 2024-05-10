import 'package:flutter/material.dart';
import './lng_notifier.dart';

openLng({
  required BuildContext context,
  String title = 'Set Language',
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: ListView.builder(
            itemCount: lng.labels.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lng.get(lng.labels.keys.toList()[index])),
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
