import 'package:flutter/material.dart';
import 'lng_state.dart';

mixin LngMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    lng.addListener(action);
  }

  @override
  void dispose() {
    super.dispose();
    lng.removeListener(action);
  }

  action() {
    setState(() {});
  }
}
