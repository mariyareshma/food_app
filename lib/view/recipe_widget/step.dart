import 'package:flutter/material.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({Key? key, required this.steps}) : super(key: key);
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return Container();
    }
    var result = ' ';

    for (var tag in steps) {
      result = '$result$tag, ';
    }
    if (steps.isNotEmpty) {
      result = result.substring(0, result.length - 2);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Steps :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
