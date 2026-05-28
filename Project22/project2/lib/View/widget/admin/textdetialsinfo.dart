import 'package:flutter/widgets.dart';

class TextDetialsInfo extends StatelessWidget {
  final String? text;
  const TextDetialsInfo({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
