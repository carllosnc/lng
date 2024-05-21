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
        title: const Text("lng"),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              openLng(
                context: context,
                title: lng.get('set_lang'),
                borderRadius: 25,
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(200),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                lng.get('image'),
                width: 160,
                height: 160,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                lng.get('title'),
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              lng.get('text'),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
