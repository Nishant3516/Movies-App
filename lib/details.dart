import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? movie =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (movie == null) {
      // Handle the case where 'arguments' is null.
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid movie data'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie['image']['original']),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                removeAllHtmlTags(movie['summary']),
                style: const TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
