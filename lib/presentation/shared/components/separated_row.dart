import 'package:flutter/material.dart';

class SeparatedRow extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;

  const SeparatedRow(
      {Key? key, required this.children, required this.separator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return Row();
    List<Widget> result = [children[0]];
    for (int i = 1; i < children.length; i++) {
      result.add(separator);
      result.add(children[i]);
    }

    return Row(
      children: result,
    );
  }
}
