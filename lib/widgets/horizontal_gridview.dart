// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HorizontalGridView extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final Widget retrunWidget;
  const HorizontalGridView(
      {super.key, required this.snapshot, required this.retrunWidget});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data.data.length,
      scrollDirection: Axis.horizontal,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return retrunWidget;
      },
    );
  }
}
