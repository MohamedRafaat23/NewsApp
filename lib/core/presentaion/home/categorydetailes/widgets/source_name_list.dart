import 'package:flutter/material.dart';

import '../../../../model/source_response/source.dart';

class SourceNameList extends StatelessWidget {
  final bool isSelected;
  final Source source;  

  const SourceNameList({
    super.key,
    required this.source,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? "",
      style: isSelected? 
      Theme.of(context).textTheme.labelLarge
      : Theme.of(context).textTheme.bodyLarge,
    );
  }
}
